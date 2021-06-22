package com.vegan.user.qaa.view;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.vegan.user.qaa.biz.QaaBoardService;
import com.vegan.user.qaa.biz.QaaBoardVO;


@Controller
@SessionAttributes("qaa")
public class QaaBoardController {
	
	@Autowired
	private QaaBoardService boardService;
	
	//글 등록 - command 객체에 담아준다.
	@RequestMapping("/insertBoard.qa")
	public String insertBoard(QaaBoardVO vo, HttpSession session, Model model) throws IOException {
		model.getAttribute("member");
		String fileSaveFolder = session.getServletContext().getRealPath("/uploadQaa/"); 
		

		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) { 
			String fileName = uploadFile.getOriginalFilename(); //현재 첨부된 파일의 이름을 반환
			uploadFile.transferTo(new File(fileSaveFolder+fileName)); //입력으로 
			vo.setImage("./uploadQaa/"+fileName);
		}else {
			vo.setImage("");
		}
		
		
		System.out.println("콘트롤러");
		boardService.insertBoard(vo);
		

		return "/getBoardList.qa";
	}
	
	//글 수정
	@RequestMapping("/updateBoard.qa")
	public String updateBoard(@ModelAttribute("qaa") QaaBoardVO vo, Model model) {
		model.getAttribute("member");
		boardService.updateBoard(vo);		
		return "/getBoardList.qa";
	}
	
	//글 삭제
	@RequestMapping("/deleteBoard.qa")
	public String deleteBoard(QaaBoardVO vo, Model model) {
		model.getAttribute("member");
		
		boardService.deleteBoard(vo);		
		return "/getBoardList.qa";
	}

	//글 목록 검색
	@RequestMapping(value="/getBoardList.qa", method = RequestMethod.POST)
	public String getBoardList(QaaBoardVO vo, Model model) {
		System.out.println("post방식 getBoardList 진입");
		
		model.getAttribute("member");
		
		model.addAttribute("qaaBoardList", boardService.getBoardList(vo));
		
		return "/customerService/QAA.jsp"; 
	}	
	
	@RequestMapping(value="/getBoardList.qa", method = RequestMethod.GET)
	public String getLogin(QaaBoardVO vo) {
		System.out.println("get방식 getBoardList 진입");
		return "/customerService/QAALogin.jsp";
	}


	//글 상세 조회
	@RequestMapping("/getBoard.qa")
	public String getBoard(QaaBoardVO vo, Model model) {
		
		model.getAttribute("member");
		model.addAttribute("qaa", boardService.getBoard(vo));

		
		if(vo.getStatus().equals("%EB%8B%B5%EB%B3%80%20%EC%99%84%EB%A3%8C")) {
			
			model.addAttribute("reply", boardService.getReply(vo));
			
			return "/customerService/QAAReply.jsp";
		} else {
			return "/customerService/QAADetail.jsp";
		}
		
		
	}
	




}

