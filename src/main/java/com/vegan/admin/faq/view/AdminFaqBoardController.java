package com.vegan.admin.faq.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vegan.admin.faq.biz.AdminFaqBoardService;
import com.vegan.admin.faq.biz.AdminFaqBoardVO;


@Controller
@SessionAttributes("adminfaq")
public class AdminFaqBoardController {
	
	@Autowired
	private AdminFaqBoardService boardService;
	
	@RequestMapping("/insertBoard.fa")
	public String insertBoard(AdminFaqBoardVO vo, HttpSession session) throws IOException {
	


		boardService.insertBoard(vo);

		return "redirect:getBoardList.fa";
	}
	
	//글 수정
	@RequestMapping("/updateBoard.fa")
	public String updateBoard(@ModelAttribute("board") AdminFaqBoardVO vo) {

	
		boardService.updateBoard(vo);		
		return "redirect:getBoardList.fa";
	}
	
	//글 삭제
	@RequestMapping("/deleteBoard.fa")
	public String deleteBoard(AdminFaqBoardVO vo) {

		boardService.deleteBoard(vo);		
		return "redirect:getBoardList.fa";
	}

	
	
	//글 목록 검색
	@RequestMapping("/getBoardList.fa")
	public String getBoardList(AdminFaqBoardVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
		


		model.addAttribute("faqBoardList", boardService.getBoardList(vo));   

		return "/adminPage/faqAdminList.jsp"; //viewResolver를 삭제했기 때문에 .jsp를 넣어야함.
	}	

	//글 상세 조회
	@RequestMapping("/getBoard.fa")
	public String getBoard(AdminFaqBoardVO vo, Model model) {
		System.out.println("글 상세 조회 처리");	
		
		model.addAttribute("board", boardService.getBoard(vo));
		return "/adminPage/faqAdminDetail.jsp";	
	}	
	
	


}
