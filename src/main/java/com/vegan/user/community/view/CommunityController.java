package com.vegan.user.community.view;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.vegan.user.community.repository.CommunityVO;
import com.vegan.user.community.service.CommunityService;

@Controller
@SessionAttributes("community")
public class CommunityController { //커뮤니티 게시판
	
	@Autowired
	private CommunityService communityService;
	
	//글 등록 페이지 호출
	@RequestMapping("/insertPage.co") 
	public String insertPage() {
		System.out.println("커뮤니티 글 등록 페이지 호출 처리");
		return "/community/insertCmnt.jsp"; //글 등록 페이지 이동
	}
	
	//글 작성
	@RequestMapping(value = "/insertCmnt.co", method = RequestMethod.POST) 
	public String insertCmnt(CommunityVO vo, HttpSession session, Model model) throws IOException {
		System.out.println("커뮤니티 글 작성 처리");
		
		//파일 업로드 처리
		String fileSaveFolder = session.getServletContext().getRealPath("/communityUpload/");
		MultipartFile uploadFile = vo.getFile(); 
		if(!uploadFile.isEmpty()) { //파일이 첨부된 경우 
			String fileName = uploadFile.getOriginalFilename(); 
			System.out.println(fileName);
			uploadFile.transferTo(new File(fileSaveFolder+fileName)); 
//			vo.setCmnt_file(fileSaveFolder+fileName); //파일 경로 저장
			vo.setCmnt_file(fileName); //파일명 저장
		}
		else { //파일이 첨부되지 않은 경우
			vo.setCmnt_file("");
		}
		
		communityService.insertCmnt(vo);
		model.getAttribute("community");
		return "redirect:/getCmntList.co"; //전체 글 목록 페이지 이동
	}
	
	//댓글 작성
	@RequestMapping("/insertCmntReply.co") 
	public String insertCmntReply(CommunityVO vo, HttpSession session, Model model) throws IOException {
		System.out.println("커뮤니티 댓글 작성 처리");
		
		communityService.insertCmntReply(vo);
		communityService.updateCmntReplySeq(vo);
		model.getAttribute("community");
		return ""; //글 상세 페이지 이동
	}

	//목록 검색용 데이터
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목", "SUBJECT");
		return conditionMap;
	}
	
	//페이징 처리 데이터
//	@ModelAttribute("paging")
//	public List<CommunityVO> setPaging() {
//		CommunityVO vo = new CommunityVO();
//		List<CommunityVO> paging = new ArrayList<>();
//		paging.add(vo);
//		return paging;
//	}
	
//	@RequestMapping("/updateReply_content.co")
//	public String updateReply_content(CommunityVO vo) {
//		System.out.println("댓글 추가 처리");
//		communityService.updateReply_content(vo);
//		System.out.println(vo); 
//		return "getCmnt.co"; //글 상세 페이지 이동
//	}
	
	//전체 글 조회
	@RequestMapping("/getCmntList.co") 
	public String getCmntList(CommunityVO vo, Model model, HttpServletRequest request) {
//		System.out.println("커뮤니티 전체 글 조회 처리");
		String val = request.getParameter("value");
	      System.out.println(val);
	      vo.setSearchCondition(val);
		//검색
		if(vo.getSearchCondition() == null) { vo.setSearchCondition("SUBJECT"); }
		if(vo.getSearchKeyword() == null) { vo.setSearchKeyword(""); }
		if(vo.getCategory() == null) { vo.setCategory("전체"); }
		if(vo.getCategory() == "레시피") { vo.setCategory("레시피"); }
		if(vo.getCategory() == "식당 정보") { vo.setCategory("식당 정보"); }
		
		model.addAttribute("communityList", communityService.getCmntList(vo));
		
		return "/community/getCmntList.jsp"; //전체 글 페이지 이동
	}
	
	//글 상세 조회
	@RequestMapping("/getCmnt.co") 
	public String getCmnt(CommunityVO vo, Model model) {
//		System.out.println("커뮤니티 글 상세 조회 처리");
//		communityService.updateReadcount(vo); //조회수 업데이트
		model.getAttribute("member");
		model.addAttribute("community", communityService.getCmnt(vo));
		return "/community/getCmnt.jsp"; //글 상세 페이지 이동
	}
	
	//글 수정
	@RequestMapping(value = "/updateCmnt.co", method = RequestMethod.POST) 
	public String updateCmnt(@ModelAttribute("community") CommunityVO vo, Model model) {
		System.out.println("커뮤니티 글 수정 처리");
		communityService.updateCmnt(vo);
		return "/getCmnt.co"; //글 상세 페이지 이동
	}
	
	//글 삭제
	@RequestMapping("/deleteCmnt.co") 
	public String deleteMember(CommunityVO vo) {
		System.out.println("커뮤니티 글 삭제 처리");
		communityService.deleteCmnt(vo);
		return "/getCmntList.co"; //전체 글 페이지 이동
	}
	
}
