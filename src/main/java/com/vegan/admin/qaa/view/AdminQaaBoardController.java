package com.vegan.admin.qaa.view;

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

import com.vegan.admin.qaa.biz.AdminQaaBoardService;
import com.vegan.admin.qaa.biz.AdminQaaBoardVO;


@Controller
@SessionAttributes("adminqaa")
public class AdminQaaBoardController {
	
	@Autowired
	private AdminQaaBoardService boardService;
	
	//글 등록 - command 객체에 담아준다.
	@RequestMapping("/insertBoard.aq")
	public String insertBoard(AdminQaaBoardVO vo, HttpSession session) throws IOException {
		System.out.println("글 등록 처리");
		System.out.println(vo.getRe_ref());
		
		boardService.insertBoard(vo);
		

		return "redirect:getBoardList.aq";
	}
	
	//글 수정
	@RequestMapping("/updateReply.aq")
	public String updateBoard(@ModelAttribute("reply") AdminQaaBoardVO vo) {

		boardService.updateBoard(vo);		
		return "redirect:getBoardList.aq";
	}
	
	//글 삭제
	@RequestMapping("/deleteBoard.aq")
	public String deleteBoard(AdminQaaBoardVO vo) {
		System.out.println("글 삭제 처리");
		
		boardService.deleteBoard(vo);		
		return "redirect:getBoardList.aq";
	}
	
	@RequestMapping("/deleteReply.aq")
	public String deleteReply(@ModelAttribute("reply") AdminQaaBoardVO vo) {
		System.out.println("답글 삭제 처리");
		System.out.println(vo.getSeq());
		System.out.println(vo.getRe_ref());
		boardService.deleteReply(vo);		
		return "redirect:getBoardList.aq";
	}
	
	
	//글 검색 기능 - requestMapping 직전에 ModelAttribute를 호출해주게끔...
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "SUBJECT");
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("작성자", "ID");
		
		return conditionMap;
	}
	
	//카테고리 필터링
	@ModelAttribute("categoryMap")
	public Map<String, String> filterCategoryMap() {
		Map<String, String> categoryMap = new HashMap<String, String>();
		categoryMap.put("전체", "전체");
		categoryMap.put("cate1", "cate1");
		categoryMap.put("cate2", "cate2");
		categoryMap.put("cate3", "cate3");
		categoryMap.put("cate4", "cate4");
		
		return categoryMap;
	}
	
	//상태 필터링
	@ModelAttribute("statusMap")
	public Map<String, String> filterStatusMap() {
		Map<String, String> statusMap = new HashMap<String, String>();
		statusMap.put("전체", "전체");
		statusMap.put("등록 완료", "등록 완료");
		statusMap.put("답변 완료", "답변 완료");

		
		return statusMap;
	}
		
	//글 목록 검색
	@RequestMapping("/getBoardList.aq")
	public String getBoardList(AdminQaaBoardVO vo, Model model) {
		System.out.println("getBoardList.aq들어옴.");
		if(vo.getSearchCondition()==null) {
			vo.setSearchCondition("SUBJECT");
		}
		
		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		if(vo.getFilterCategory() == null) {
			vo.setFilterCategory("전체");
		}
		
		if(vo.getFilterStatus() == null) {
			vo.setFilterStatus("전체");
		}
	
		model.addAttribute("qaaBoardList", boardService.getBoardList(vo));   
		
		return "/adminPage/adminQAA.jsp"; 
	}	

	//글 상세 조회
	@RequestMapping("/getBoard.aq")
	public String getBoard(AdminQaaBoardVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
		model.addAttribute("adminqaa", boardService.getBoard(vo));
		
		
		if(vo.getStatus().equals("답변 완료")) {
			
			model.addAttribute("reply", boardService.getReply(vo));
			
			return "/adminPage/adminQAAReply.jsp";
		} else {
			return "/adminPage/adminQAADetailInsert.jsp";
		}
	
			
	}	
	
		@RequestMapping("/insertReply.aq")
		public String insertReply(AdminQaaBoardVO vo, Model model) {
			boardService.insertBoard(vo);
			

			return "redirect:getBoardList.aq";

	}	
	
	


}

