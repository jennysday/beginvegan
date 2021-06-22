package com.vegan.admin.goods.view;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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

import com.vegan.admin.goods.db.GoodsVO;
import com.vegan.admin.goods.service.GoodsService;
import com.vegan.user.goods.review.db.ReviewVO;
import com.vegan.user.goods.review.service.ReviewService;

@Controller
@SessionAttributes({"goods", "review"})
public class mix_goodsReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private GoodsService goodsService;
	//관리자 상품 등록
	@RequestMapping(value="/insertGoods.go", method = RequestMethod.POST)
	public String insertGoods(GoodsVO vo, HttpSession session) throws IOException {
				
		System.out.println("상품 등록 처리");
		String fileSaveFolder = session.getServletContext().getRealPath("/GoodsUpload/"); 
		MultipartFile uploadImage01 = vo.getFile01();
		MultipartFile uploadImage02 = vo.getFile02();
		MultipartFile uploadImage03 = vo.getFile03();
		
		if (!uploadImage01.isEmpty()) {
			String fileName = uploadImage01.getOriginalFilename();
			uploadImage01.transferTo(new File(fileSaveFolder + fileName));
			vo.setImage01(fileName);
		}
		if (!uploadImage02.isEmpty()) {
			String fileName = uploadImage02.getOriginalFilename();
			uploadImage02.transferTo(new File(fileSaveFolder + fileName));
			vo.setImage02(fileName);
		}
		if (!uploadImage03.isEmpty()) {
			String fileName = uploadImage03.getOriginalFilename();
			uploadImage03.transferTo(new File(fileSaveFolder + fileName));
			vo.setImage03(fileName);
		}
		
		goodsService.insertGoods(vo); 
		return "redirect:adminGoodsList.go";
	}
	//관리자 상품 목록
	@RequestMapping(value="/adminGoodsList.go", method = RequestMethod.GET)
	public String adminGoodsList(GoodsVO vo, Model model) {
		System.out.println("Controller.adminGoodsList();");
		List<GoodsVO> list = goodsService.adminGoodsList(vo);
		model.addAttribute("list", list);
		return "/adminPage/listGoods.jsp";
	}
		
	//관리자 상품 수정
	@RequestMapping(value="/modifyGoods.go", method = RequestMethod.POST)
	public String modifyGoods(@ModelAttribute("goods") GoodsVO vo, HttpServletRequest request) {
		System.out.println("Controller_modifyGoods");
		
		HttpSession session = request.getSession();
		String fileSaveFolder = session.getServletContext().getRealPath("/GoodsUpload/"); 
		
		MultipartFile uploadImage01 = vo.getFile01();
		MultipartFile uploadImage02 = vo.getFile02();
		MultipartFile uploadImage03 = vo.getFile03();
		
		if (!uploadImage01.isEmpty()) {
			String fileName = uploadImage01.getOriginalFilename();
			try {
				uploadImage01.transferTo(new File(fileSaveFolder + fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setImage01(fileName);
		}
		if (!uploadImage02.isEmpty()) {
			String fileName = uploadImage02.getOriginalFilename();
			try {
				uploadImage02.transferTo(new File(fileSaveFolder + fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setImage02(fileName);
		}
		if (!uploadImage03.isEmpty()) {
			String fileName = uploadImage03.getOriginalFilename();
			try {
				uploadImage03.transferTo(new File(fileSaveFolder + fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setImage03(fileName);
		}
		
		goodsService.modifyGoods(vo);
		return "redirect:adminGoodsList.go";
	}
		
	//관리자 상품 삭제
	@RequestMapping(value="/deleteGoods.go", method = RequestMethod.GET)
	public String deleteGoods(@ModelAttribute("goods") GoodsVO vo){
		System.out.println("Controller_deleteGoods");
		goodsService.deleteGoods(vo);
		return "redirect:adminGoodsList.go";
	}
		
	//관리자 상품 상세페이지
	@RequestMapping("/adminGoodsDetail.go")
	public String adminGoodsDetail(GoodsVO vo, Model model){
		System.out.println("Controller_adminGoodsDetail");
		GoodsVO goods = goodsService.adminGoodsDetail(vo);
		model.addAttribute("goods", goods);
		return "/adminPage/detailGoods.jsp";
	}
	
	
	@ModelAttribute("conditionMap")
	public Map<String,String> searchConditionMap(){
		System.out.println("검색기능 처리");
		
		Map<String,String> conditionMap = new HashMap<>();
		conditionMap.put("", "all");
		conditionMap.put("반찬/요리", "dish");
		conditionMap.put("샐러드/간편식/즉석식품", "fast");
		conditionMap.put("두유/요거트/음료", "drink");
		conditionMap.put("양념/소스/조미료", "source");
		conditionMap.put("베이커리/치즈/버터", "daily");
		conditionMap.put("간식/초콜릿", "snack");
		
		return conditionMap;
	}
	//고객용 상품 목록	
	@RequestMapping(value="/getGoodsList.go")
	public String getGoodsList(GoodsVO vo, Model model, HttpServletRequest request) {
		String val = request.getParameter("value");
		System.out.println(val);
		vo.setSearchCondition(val);
		if(vo.getSearchCondition() == null ||
				vo.getSearchCondition().equals("all") ) { vo.setCategory("all"); }
		else if(vo.getSearchCondition().equals("dish")) { vo.setCategory("dish"); }
		else if(vo.getSearchCondition().equals("fast")) { vo.setCategory("fast"); }
		else if(vo.getSearchCondition().equals("drink")) { vo.setCategory("drink"); }
		else if(vo.getSearchCondition().equals("source")) { vo.setCategory("source"); }
		else if(vo.getSearchCondition().equals("daily")) { vo.setCategory("daily"); }
		else if(vo.getSearchCondition().equals("snack")) { vo.setCategory("snack"); }
			
		List<GoodsVO> goodsList = goodsService.getGoodsList(vo);
		model.addAttribute("goodsList", goodsList);
		model.getAttribute("member");
		model.addAttribute("val", val);	
		return "./goods/getGoodsList.jsp";
	}
	//고객용 상품 상세페이지
	@RequestMapping("/getGoodsDetail.go")
	public String getGoodsDetail(GoodsVO vo, Model model, ReviewVO vor, HttpServletRequest request, HttpSession session) {
		System.out.println("글 상세 조회"+request.getParameter("seq"));
		model.getAttribute("member");
		
		
		vo.setSeq(Integer.parseInt(request.getParameter("seq")));

		
		vor.setGoods_seq(Integer.parseInt(request.getParameter("seq")));
		
	
		
		model.addAttribute("goods",goodsService.getGoods(vo));
		model.addAttribute("review",reviewService.getReviewList(vor));
		
	
				
		return "./goods/getGoodsReview.jsp";
	}
	
	//리뷰 메서드 
	@RequestMapping(value="/insertReview.re", method= RequestMethod.GET)
	public String insertPage(ReviewVO vor, HttpSession session, HttpServletRequest request) {
		session.setAttribute("goods_seq", request.getParameter("goods_seq")); 
		
		
		
		return "/goods/reviewLogin.jsp";
	}
	
	@RequestMapping(value="/insertReview.re", method = RequestMethod.POST)
	public String insertReview(HttpSession session, HttpServletRequest request, Model model) {

		if(session.getAttribute("test")==null) {
			session.setAttribute("goods_seq", request.getParameter("goods_seq")); 
			
		}
		System.out.println("session1"+session.getAttribute("goods_seq"));
		
		model.getAttribute("member");
		model.getAttribute("goods");
		
		
		return "./goods/insertReview.jsp";
	}
	
	
	@RequestMapping("/saveReview.re")
	public String saveReview(ReviewVO vor, HttpSession session) throws IOException{
		
		System.out.println("리뷰 등록 처리");
		vor.setUser_id(session.getAttribute("id").toString());
		vor.setGoods_seq(Integer.parseInt( session.getAttribute("goods_seq").toString()));
		System.out.println("vor.getGoods_seq(): "+vor.getGoods_seq());
		
		
		String fileSaveFolder = session.getServletContext().getRealPath("/ReviewUpload/"); 
		MultipartFile uploadFile = vor.getFile(); 
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename(); 
			System.out.println(fileName);
			uploadFile.transferTo(new File(fileSaveFolder+fileName));
			
			vor.setImage(fileName);
		}
		reviewService.insertReview(vor);
		
		String returnValue = "getGoodsDetail.go?seq="+vor.getGoods_seq();
		
		session.removeAttribute("goods_seq");
		session.removeAttribute("test");
		
		return returnValue;
	}
	
	@RequestMapping("/getMyReviewList.re")
	public String getMyReviewList(ReviewVO vor, Model model, HttpSession session) {
		model.getAttribute("member");
		
		
		vor.setUser_id(session.getAttribute("id").toString());
		System.out.println(vor.getUser_id());
		List<ReviewVO> review =reviewService.getMyReviewList(vor);
		model.addAttribute("reviewList",review);
		
		return "./myPage/reviewList.jsp";//새로운 페이지 넣어주기.
	}
	// 글 수정
	@RequestMapping("/updateReview.re")
	public String updateReview(ReviewVO vor) {
		System.out.println("글 수정 처리");	
		
		reviewService.updateReview(vor);
			
		return "redirect:/getMyReviewList.re";
	}
	// 글 수정
		@RequestMapping("/deleteReview.re")
		public String deleteReview(ReviewVO vor) {
			System.out.println("글 삭제 처리");	
			
			reviewService.deleteReview(vor);
				
			return "redirect:/getMyReviewList.re";
		}
	
	@RequestMapping("/plusReadcount.re")
	public String plusReadcount(@ModelAttribute("review") ReviewVO vor) {
		System.out.println("글 조회수 처리");	
		
		// int seq = Integer.parseInt(request.getParameter("seq")); vor.setSeq(seq);
		reviewService.plusReadcount(vor);
			
		return "redirect:getReviewList.re";
	}
}
