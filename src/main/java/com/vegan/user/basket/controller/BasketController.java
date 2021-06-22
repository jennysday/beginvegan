package com.vegan.user.basket.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vegan.user.basket.dao.BasketVO;
import com.vegan.user.basket.service.BasketService;

@Controller
@SessionAttributes("basket")
public class BasketController {

	@Autowired
	BasketService boardService;

	
	@RequestMapping(value="/basketList.do", method = RequestMethod.POST)
	public String getBasketList(BasketVO vo, Model model, HttpSession session) {
		model.getAttribute("member");
		
		
		vo.setMemberSeq(Integer.parseInt(session.getAttribute("seq").toString()));
		
	
		model.addAttribute("basketList", boardService.getBasketList(vo));
	
	
		System.out.println("Basketlist post 방식");
		return "basket/goods_basket.jsp";
	}
	
	@RequestMapping(value="/basketList.do", method = RequestMethod.GET)
	public String getLogin(BasketVO vo) {

		System.out.println("Basketlist get 방식");
		
		return "/basket/basketLogin.jsp";
	}


	@RequestMapping("/deleteBasket.do")
	public String deleteBasket(HttpSession session, BasketVO vo, Model model) {
		
		model.getAttribute("member");
		vo.setMemberSeq(Integer.parseInt(session.getAttribute("seq").toString()) );


		boardService.deleteBasket(vo);

		return "./basketList.do";
	}


	@RequestMapping(value="/addBasket.do", method = RequestMethod.POST)
	public String addBasket(BasketVO vo, Model model, HttpSession session, HttpServletRequest request) {
		
		if(session.getAttribute("test") == null) {
			
			session.setAttribute("seq", request.getParameter("seq"));
			session.setAttribute("goodsSeq", request.getParameter("goodsSeq"));
			session.setAttribute("amount", request.getParameter("amount"));
			session.setAttribute("goodsAmount", request.getParameter("goodsAmount"));
		}
		
		vo.setMemberSeq(Integer.parseInt(session.getAttribute("seq").toString()) );
		vo.setAmount(Integer.parseInt(session.getAttribute("amount").toString()) );
		vo.setGoodsAmount(Integer.parseInt(session.getAttribute("goodsAmount").toString()));		
		vo.setGoodsSeq(Integer.parseInt(session.getAttribute("goodsSeq").toString()) );

		boardService.addBasket(vo);
		
		session.removeAttribute("test");
		session.removeAttribute("pw");
		session.removeAttribute("goodsSeq");
		session.removeAttribute("goodsAmount");
		session.removeAttribute("amount");
		//바꾸기 return "상품 리스트로"
		return "/basketList.do";
	}
	
	@RequestMapping(value="/addBasket.do", method = RequestMethod.GET)
	public String getBasketLogin(HttpSession session, HttpServletRequest request) {
		session.setAttribute("goodsSeq", request.getParameter("goodsSeq"));
		session.setAttribute("amount", request.getParameter("amount"));
		session.setAttribute("goodsAmount", request.getParameter("goodsAmount"));
		
		
		return "/basket/addBasketLogin.jsp";
	}

	@ResponseBody
	@RequestMapping("/updateBasket.do")
	public Map<String, Object> updateBasket(HttpSession session, @RequestBody BasketVO vo, Model model) {
		
		model.getAttribute("member");
		Map<String, Object> respData = new HashMap<>();

		// @RequestBody: JSON -> JAVA VO
		// @ResponseBody: JAVA VO -> JSON
//		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		vo.setMemberSeq(Integer.parseInt( session.getAttribute("seq").toString()));

		boardService.updateBasket(vo);

		respData.put("OK", true);


		return respData;
	}

}
