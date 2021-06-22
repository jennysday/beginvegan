package com.vegan.admin.member.view;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vegan.admin.member.repository.MemberVO;
import com.vegan.admin.member.repository.ZipcodeVO;
import com.vegan.admin.member.service.MemberService;

@Controller
@SessionAttributes("member")
public class MemberController { //회원 관리

	@Autowired
	private MemberService memberService;
	
	@Autowired
	  private JavaMailSender mailSender;

	//사용자(관리자/회원) 로그인 체크
	@RequestMapping(value = "/memberLogin.me", method = RequestMethod.POST)
	public String memberCheck(MemberVO vo, Model model, HttpSession session, HttpServletResponse response) throws IOException {
		MemberVO member = memberService.memberCheck(vo);
	
		if(member != null) { //db에 데이터가 있는 경우
			model.addAttribute("member", member);
			session.setAttribute("member", member);
			session.setAttribute("seq", member.getSeq());
			session.setAttribute("id", member.getId());
			
			//관리자인 경우
			if((vo.getId()).equals("admin")) { 
				System.out.println("회원목록 조회 처리");
				return "adminPage/adminMain.jsp"; //회원관리(관리자) 페이지 이동
			}
			//회원인 경우
			else if(vo.getPw().equals(member.getPw())) { //비밀번호가 일치하는 경우
				System.out.println("로그인 처리");
				return "main/main.jsp"; //회원 페이지 이동
			}else if(!vo.getPw().equals(member.getPw())){ //비밀번호가 불일치하는 경우
				System.out.println("비밀번호 불일치");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); 
				out.println("alert('아이디와 비밀번호를 확인하세요');");
				out.println("history.go(-1);");
				out.println("</script>"); 
				out.flush();
				return "";
			}
		}else { //db에 데이터가 없는 경우
			System.out.println("아이디, 비밀번호 데이터없음");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('가입하지 않는 아이디이거나 잘못된 비밀번호입니다');");
			out.println("</script>");
			out.flush();
			return "loginPage/login.jsp";
		}
		return "redirect:loginPage/login.jsp";
	}
	
	@RequestMapping(value = "/filterQaaLogin.me", method = RequestMethod.POST)
	public String goBackPreviousPageQaa(MemberVO vo, Model model, HttpSession session) {
		MemberVO member = memberService.memberCheck(vo);
		model.addAttribute("member", member);
		session.setAttribute("seq", member.getSeq());
		session.setAttribute("id", member.getId());
		return "./getBoardList.qa";
	}
	
	@RequestMapping(value = "/filterBasketLogin.me", method = RequestMethod.POST)
	public String goBackPreviousPageBasket(MemberVO vo, Model model, HttpSession session) {
		MemberVO member = memberService.memberCheck(vo);
		model.addAttribute("member", member);
		session.setAttribute("seq", member.getSeq());
		session.setAttribute("id", member.getId());
		return "./basketList.do";
	}
	
	
	@RequestMapping(value = "/filterAddBasketLogin.me", method = RequestMethod.POST)
	public String goBackPreviousPageAddBasket(MemberVO vo, Model model, HttpSession session) {
		MemberVO member = memberService.memberCheck(vo);
		model.addAttribute("member", member);
		session.setAttribute("seq", member.getSeq());
		session.setAttribute("id", member.getId());
		session.setAttribute("pw", member.getPw()); //이전 로그인, 직전 로그인 판별용.
		session.setAttribute("test", 1);	
		return "./addBasket.do";
	}
	
	@RequestMapping(value = "/filterOrderLogin.me", method = RequestMethod.POST)
	public String goBackPreviousPageOrder(MemberVO vo, Model model, HttpSession session) {
		MemberVO member = memberService.memberCheck(vo);
		model.addAttribute("member", member);
		session.setAttribute("seq", member.getSeq());
		session.setAttribute("id", member.getId());	
		System.out.println("1");
		return "./orderList.od";
	}
	
	@RequestMapping(value = "/filterOrderOnlyThisLogin.me", method = RequestMethod.POST)
	public String goBackPreviousPageOrderOnlyThis(MemberVO vo, Model model, HttpSession session) {
		MemberVO member = memberService.memberCheck(vo);
		model.addAttribute("member", member);
		session.setAttribute("seq", member.getSeq());
		session.setAttribute("id", member.getId());
		session.setAttribute("pw", member.getPw()); //이전 로그인, 직전 로그인 판별용.
		session.setAttribute("test", 1);	
		return "./prepareOrderOnly.od";
	}
	
	@RequestMapping(value = "/filterMemberPageLogin.me", method = RequestMethod.POST)
	public String goBackPreviousPageMemberPageThis(MemberVO vo, Model model, HttpSession session) {
		MemberVO member = memberService.memberCheck(vo);
		model.addAttribute("member", member);
		session.setAttribute("seq", member.getSeq());
		session.setAttribute("id", member.getId());	
		return "./getMyPage.me";
	}
	
//	민지 추가
	@RequestMapping(value = "/filterReviewLogin.me", method = RequestMethod.POST)
	public String goBackPreviousPageReview(MemberVO vo, Model model, HttpSession session) {
		MemberVO member = memberService.memberCheck(vo);
		model.addAttribute("member", member);
		session.setAttribute("seq", member.getSeq());
		session.setAttribute("id", member.getId());	
		session.setAttribute("test", 1);	
		return "./insertReview.re";
	}
	
	//커뮤니티 게시판 글 작성할 때
	@RequestMapping(value = "/filterInsertCmntLogin.me", method = RequestMethod.POST)
	public String goBackPreviousPageCommunity(MemberVO vo, Model model, HttpSession session) {
		MemberVO member = memberService.memberCheck(vo);
		model.addAttribute("member", member);
		session.setAttribute("seq", member.getSeq());
		session.setAttribute("id", member.getId());	
		return "/community/insertCmnt.jsp";
	}
	
	//커뮤니티 게시판 댓글 작성할 때
	@RequestMapping(value = "/filterInsertReplyLogin.me", method = RequestMethod.POST)
	public String goBackPreviousPageCommunityReply(MemberVO vo, Model model, HttpSession session) {
		MemberVO member = memberService.memberCheck(vo);
		model.addAttribute("member", member);
//		session.setAttribute("seq", member.getSeq());
		session.setAttribute("id", member.getId());	
		session.getAttribute("community");
		return "/getCmnt.co?seq="+vo.getSeq();
	}
	
	//추가
	@RequestMapping(value = "/getMyPage.me", method = RequestMethod.POST)
	public String getMemberPage(MemberVO vo, Model model, HttpSession session) {
		return "orderList.od";
	}
	
	@RequestMapping(value = "/getMyPage.me", method = RequestMethod.GET)
	public String getMemberPageNeedLogin(MemberVO vo, Model model, HttpSession session) {
		return "/myPage/memberPageLogin.jsp";
	}
	
	//로그아웃 처리
	@RequestMapping(value = "/memberLogout.me")
	public String memberLogout(MemberVO vo, Model model, HttpSession session) {
		System.out.println("로그아웃 처리");
		session.removeAttribute("member");
		session.removeAttribute("id");
		session.removeAttribute("seq");
		session.removeAttribute("pw");
		session.removeAttribute("test");
		
		model.addAttribute("member", null);
//		return "redirect:/main/main.jsp"; //redirect가 안됨
		return "/main/main.jsp"; //
	}

	//아이디 중복확인
	@RequestMapping("/idCheck.me") 
	public String idCheck(MemberVO vo, Model model, HttpServletResponse response) throws IOException {
		System.out.println("아이디 중복확인 처리");
		Integer check = memberService.idCheck(vo);  //같은 id의 개수를 return
		response.setContentType("text/html; charset=UTF-8");
		
		if(vo.getId().equals("")) { //입력하지 않은 경우
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디를 입력하세요')");
			out.println("history.go(-1)");
			out.println("</script>");
			out.flush();
		}else if(check == 1) { //이미 존재하는 아이디인 경우
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 등록된 아이디입니다')");
			out.println("history.go(-1)");
			out.println("</script>");
			out.flush();
		}else if(vo.getId().length() < 6) { //아이디가 6자리 미만인 경우
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디는 최소 6자리 이상 입력하세요')");
			out.println("history.go(-1)");
			out.println("</script>");
			out.flush();
		}else{ //아이디가 존재하지 않는 경우
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('사용이 가능합니다')");
			out.println("history.go(-1)");
			out.println("</script>");
			out.flush();
		}
		return "/loginPage/memberJoin.jsp";
	}
	
	//계정 비밀번호 체크(개인정보 수정시)
	@RequestMapping(value = "/pwCheck.me", method = RequestMethod.POST)
	public String pwCheck(MemberVO vo, Model model, HttpServletResponse response) throws IOException {
			MemberVO member = memberService.memberCheck(vo);
			//비밀번호 불일치
			if(!vo.getPw().equals(member.getPw())) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호를 다시 입력하세요')");
				out.println("</script>");
				out.flush();
				return "/myPage/memberPage.jsp";
			}
			return "/myPage/memberUpdate.jsp";
		}
	
	//회원 아이디 찾기
	@RequestMapping(value = "/memberFindId.me", method = RequestMethod.POST)
	public String findMemberId(MemberVO vo, Model model, HttpServletResponse response) throws IOException {
		System.out.println("회원 아이디 찾기 처리");
		MemberVO member = memberService.findMemberId(vo);
		model.addAttribute("memberId", member);
		
		//아이디, 이메일 하나라도 일치하지 않는 경우
		if(member == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('정보를 다시 입력하세요')");
			out.println("</script>");
			out.flush();
			return "/loginPage/findId.jsp";
		}
		return "/loginPage/findIdOk.jsp"; //검색 완료 페이지 이동
	}
	
	//회원 비밀번호 찾기
	@RequestMapping(value = "/memberFindPw.me", method = RequestMethod.POST)
	public String findMemberPw(MemberVO vo, Model model, HttpServletResponse response, HttpServletRequest request ) throws IOException {
		System.out.println("회원 비밀번호 찾기 처리");
		MemberVO member = memberService.findMemberPw(vo);
		model.addAttribute("memberPw", member);
		
		//아이디, 이메일, 이름 하나라도 일치하지 않는 경우
		if(member == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('정보를 다시 입력하세요')");
			out.println("</script>");
			out.flush();
			return "/loginPage/findPw.jsp";
		}
		
		String setfrom = "beginveganshopproj@gmail.com";
		String email  = request.getParameter("email");
		String pw = member.getPw();
		String name = request.getParameter("name") ;
		String title="비긴비건에서 보내온 비밀번호 찾기 메일입니다.";
		String content = " <h2 style=\"color:#213421; font-size:40px; font-family: 'Noto Sans KR', sans-serif;\">"+name+"  님 비밀번호 찾기 메일입니다.<br/></h2>";
		String content1 ="<p style=\"font-size:20px;\">"+ name + "  님의 비밀번호는 "+"</p>"+"<p style=\"color:red; font-size:18px;\">"+ pw +"</p>";
		String content2 = "<p style=\"font-size:20px;\">"+" 입니다."+"</p><br/>";
//		String content3 = "<br/><a href=\"http://192.168.0.85:8090/board\"><button style=\"background-color: #213421; color: white; border: 0px; width: 200px; height: 40px; border-radius:10px;\">홈페이지 바로가기 </button></a>";
//		String content3 = "<br/><a href=\"http://localhost:8085/board\"><button style=\"background-color: #213421; color: white; border: 0px; width: 200px; height: 40px; border-radius:10px;\">홈페이지 바로가기 </button></a>";
		String content3 = "<br/><a href=\"http://localhost:8090/board\"><button style=\"background-color: #213421; color: white; border: 0px; width: 200px; height: 40px; border-radius:10px;\">홈페이지 바로가기 </button></a>";
		
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(email);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	      messageHelper.setText(content1);  // 메일 내용
		
			  String contents = "<center>"+"<img src=\"cid:logo3.png\" width=\"500px\" >" +content + content1 + content2+ content3+"</center>";
			  messageHelper.setText(contents, true); 
			  
			  FileSystemResource file = new
//			  FileSystemResource(new File("C:/workspaces/spring/VeganShopProject_210427/src/main/webapp/image/logo3.png"));
			  FileSystemResource(new File("C:/workspaces/spring/VeganShopProject_210430/src/main/webapp/image/logo3.png"));
			  messageHelper.addInline("logo3.png", file);
		
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	    return "/loginPage/findPwOk.jsp";//검색 완료 페이지 이동
	}
	
	//우편번호 검색
	@RequestMapping(value = "/searchZipcode.me", method = RequestMethod.POST) 
	public String searchZipcode(ZipcodeVO vo, Model model) throws IOException {
		System.out.println("우편번호 검색 처리");
		System.out.println(model.addAttribute("zipcodeList", memberService.searchZipcode(vo)));
		return "/loginPage/memberZipcode.jsp"; //우편번호 검색 페이지 이동
	}
	
	//회원 가입
	@RequestMapping("/insertMember.me") 
	public String insertMember(MemberVO vo, HttpServletRequest request) throws IOException {
		System.out.println("회원 가입 처리");
		System.out.println(vo);
		memberService.insertMember(vo);
		
		mailSending(request);
		return "redirect:/loginPage/login.jsp"; //로그인 처리
	}
	
	//웰컴 메일
	@RequestMapping(value = "/emailP.em", method = RequestMethod.POST)
	  public String mailSending(HttpServletRequest request) {
	    String setfrom = "beginveganshopproj@gmail.com";         
	    String email  = request.getParameter("email");     // 받는 사람 이메일
	    String title   = "비긴비건에 가입하신 것을 환영합니다";     // 제목
	    String content = "<h2> 비긴비건에 가입하신 것을 환영합니다.</h2>";   // 내용
	    String content1="<br>아름다운 날이에요"; 
//	    String content2 = "<br/><a href=\"http://192.168.0.85:8090/board\"><button style=\"background-color: #213421; color: white; border: 0px; width: 200px; height: 40px; border-radius:10px;\">홈페이지 바로가기 </button></a>";
//	    String content2 = "<br/><a href=\"http://localhost:8085/board\"><button style=\"background-color: #213421; color: white; border: 0px; width: 200px; height: 40px; border-radius:10px;\">홈페이지 바로가기 </button></a>";
	    String content2 = "<br/><a href=\"http://localhost:8090/board\"><button style=\"background-color: #213421; color: white; border: 0px; width: 200px; height: 40px; border-radius:10px;\">홈페이지 바로가기 </button></a>";
	   
	    
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(email);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	      messageHelper.setText(content1);  // 메일 내용
	      messageHelper.setText(content2);  // 메일 내용
	      
			  String contents ="<center>"+ content + "<img src=\"cid:welcomeMail.png\" width=\"500px\" >"+content2+"</center>";
			  messageHelper.setText(contents, true); 
			  
			  FileSystemResource file = new
//			  FileSystemResource(new File("C:/workspaces/spring/VeganShopProject_210427/src/main/webapp/image/welcomeMail.png"));
			  FileSystemResource(new File("C:/workspaces/spring/VeganShopProject_210430/src/main/webapp/image/welcomeMail.png"));
			  messageHelper.addInline("welcomeMail.png", file);
			
		  //Mail에 img 삽입 
		 // ClassPathResource resource = new
		 // ClassPathResource("https://drive.google.com/file/d/163yLSb7-ErdTy64kNicM9CFF5HDV7Fri/view?usp=sharing"); 
		 // messageHelper.addInline("img", resource.getFile());
			 
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	    return "index.jsp";
	  }
	
	//목록 검색용 데이터
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("아이디", "ID");
		conditionMap.put("이름", "NAME");
		return conditionMap;
	}
	
	/*
	 * //마이페이지
	 * @RequestMapping("/myPage.me") public String myPage(Model model) {
	 * model.getAttribute("member"); //member의 name값 가져오기 위해 return
	 * "/myPage/memberPage.jsp"; }
	 */
	
	//회원 목록 보기(관리자)
	@RequestMapping("/memberList.ad") 
	public String getBoardList(MemberVO vo, Model model) { 
		//검색
		if(vo.getSearchCondition() == null) { 
			vo.setSearchCondition("ID");  
		}
		if(vo.getSearchKeyword() == null) { 
			vo.setSearchKeyword(""); 
		}
		model.addAttribute("memberList", memberService.getMemberList(vo)); 
		return "/adminPage/memberList.jsp"; //회원 목록 페이지 이동
	}
	
	/*
	 * //회원 정보 상세 조회
	 * 
	 * @RequestMapping("/getMember.me") public String getMember(MemberVO vo, Model
	 * model) { System.out.println("회원 정보 상세 조회 처리");
	 * model.addAttribute("member",memberService.getMember(vo)); return
	 * "redirect:/myPage/memberPage.jsp"; //마이페이지 이동 }
	 */
	
	//회원 정보 수정
	@RequestMapping(value = "/updateMember.me", method = RequestMethod.POST) 
	public String updateMember(@ModelAttribute("member") MemberVO vo, HttpServletResponse response) throws IOException {
		System.out.println("회원 정보 수정 처리");
		 memberService.updateMember(vo);
		 response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('회원 정보가 수정되었습니다')");
		out.println("</script>");
		out.flush();
		return "/myPage/memberPage.jsp";
	}
	
	//회원 정보 탈퇴
	@RequestMapping("/deleteMember.me") 
	public String deleteMember(MemberVO vo, HttpServletResponse response, HttpSession session) throws IOException {
		System.out.println("회원 정보 탈퇴 처리");
		MemberVO member = memberService.memberCheck(vo);
		response.setContentType("text/html; charset=UTF-8");
		//비밀번호 불일치
		if(!vo.getPw().equals(member.getPw()) || member == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 확인하세요')");
			out.println("</script>");
			out.flush();
			return "/myPage/memberOut.jsp";
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("var answer = confirm('정말로 탈퇴하시겠습니까?');");
			out.println("if(answer == true){alert('탈퇴되었습니다')}");
			out.println("</script>");
			out.flush();
			memberService.deleteMember(vo);
			session.removeAttribute("member");
			session.removeAttribute("id");
			return "./memberLogout.me"; //탈퇴해도 로그인 상태가 유지되서 로그아웃 url을 다시 요청
		}
	}
}
