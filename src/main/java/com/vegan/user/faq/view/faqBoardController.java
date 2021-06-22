package com.vegan.user.faq.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vegan.user.faq.biz.faqBoardService;
import com.vegan.user.faq.biz.faqBoardVO;


@Controller
@SessionAttributes("faq")
public class faqBoardController {
	
	@Autowired
	private faqBoardService boardService;
	
	//글 목록 검색
	@RequestMapping("/getBoardList.fu")
	public String getBoardList(faqBoardVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
		model.addAttribute("faqBoardList", boardService.getBoardList(vo));   

		return "/customerService/faqList.jsp"; //viewResolver를 삭제했기 때문에 .jsp를 넣어야함.
	}	

	//글 상세 조회
	@RequestMapping("/getBoard.fu")
	public String getBoard(faqBoardVO vo, Model model) {
		System.out.println("글 상세 조회 처리1");	
		
		model.addAttribute("board", boardService.getBoard(vo));
		return "/customerService/faqDetail.jsp";	
	}	
	
	


}
