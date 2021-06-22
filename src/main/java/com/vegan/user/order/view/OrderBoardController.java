package com.vegan.user.order.view;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.vegan.user.order.biz.OrderBoardService;
import com.vegan.user.order.biz.OrderBoardVO;


@Controller
@SessionAttributes("order")
public class OrderBoardController {
	
	@Autowired
	private OrderBoardService boardService;
	

	@RequestMapping(value="/prepareOrderOnly.od", method = RequestMethod.POST)
	public String insertOrderListOnlyThis (OrderBoardVO vo, Model model, HttpSession session, HttpServletRequest request) {

		
		if(session.getAttribute("test") == null) {
			session.setAttribute("seq", request.getParameter("seq"));
			session.setAttribute("id", request.getParameter("id"));
			session.setAttribute("order_goods_num", request.getParameter("order_goods_num"));
			session.setAttribute("order_goods_count", request.getParameter("order_goods_count"));
			
			
		}
		vo.setOrder_member_id(session.getAttribute("id").toString());
		vo.setOrder_goods_num(Integer.parseInt(session.getAttribute("order_goods_num").toString()));
		vo.setOrder_goods_count(Integer.parseInt(session.getAttribute("order_goods_count").toString()));
		
		
		
		
		boardService.prepareOrderOnly(vo);
		
		
	
		

		return "/getOrderTmpList.od";	
	}
	
	@RequestMapping(value="/prepareOrderOnly.od", method = RequestMethod.GET)
	public String getLoginOrderOnlyThis (HttpSession session, HttpServletRequest request) {
		session.setAttribute("order_goods_num", request.getParameter("order_goods_num"));
		session.setAttribute("order_goods_count", request.getParameter("order_goods_count"));
			
		return "/myPage/orderOnlyThisLogin.jsp";
	}
	
	@RequestMapping("/prepareOrder.od")
	public String insertOrderList(OrderBoardVO vo, Model model, HttpSession session) {
			
		String user_id = session.getAttribute("id").toString();

		vo.setOrder_member_id(user_id);
		boardService.prepareOrder(vo);
		

		return "/getOrderTmpList.od";	
	}
	
	@RequestMapping("/getOrderTmpList.od")
	public String getOrderTmpList(OrderBoardVO vo, Model model, HttpSession session) {
		
		String user_id = session.getAttribute("id").toString();
		vo.setOrder_member_id(user_id);
		
		model.addAttribute("checkout", boardService.getOrderTmpList(vo));
		model.addAttribute("checkout_member", boardService.getMemberInfo(vo));
		
		
		session.removeAttribute("test");
		session.removeAttribute("order_goods_num");
		session.removeAttribute("order_goods_count");
		
		return "/myPage/goods_buy.jsp";
	}
	
	@RequestMapping("/startOrder.od")
	public String startOrder(@ModelAttribute("checkout_member") OrderBoardVO vo, HttpSession session) {
		
		String user_id = session.getAttribute("id").toString();
		vo.setOrder_member_id(user_id);

		boardService.startOrder(vo);
		boardService.insertOrder(vo);
		
		
		return "/myPage/goods_order_ok.jsp";
	}
	
	//결제내역 목록
	@RequestMapping(value="/orderList.od", method = RequestMethod.POST)
	public String getOrderList(OrderBoardVO vo, HttpSession session, Model model) {
		System.out.println("2");
		model.getAttribute("member");
		vo.setOrder_member_seq((int) session.getAttribute("seq"));
		System.out.println("3");

		model.addAttribute("orderList", boardService.getOrderList(vo));
		
		return "myPage/goods_my_order.jsp";
	}
	
	@RequestMapping(value="/orderList.od", method = RequestMethod.GET)
	public String getLogin() {
		
		return "/myPage/orderLogin.jsp";
	}
	
	@RequestMapping("/backOrder.od") 
	public String backOrder(OrderBoardVO vo, Model model, HttpSession session){
		model.getAttribute("member");
		
//		String user_id = session.getAttribute("id").toString();
//		vo.setOrder_member_id(user_id);
		
		vo.setOrder_member_id(session.getAttribute("id").toString());
		boardService.backOrder(vo);
		return "/getGoodsList.go";
		
	}
	
	@ResponseBody
	@RequestMapping("/updateOrderStatus.do")
	public Map<String, Object> updateOrderStatus(Model model, HttpSession session, @RequestBody OrderBoardVO vo) {
		model.getAttribute("member");
		Map<String, Object> respData = new HashMap<>();
		vo.setOrder_member_seq(Integer.parseInt( session.getAttribute("seq").toString()));
	
		boardService.updateOrderStatus(vo);

		respData.put("OK", true);

		
		return respData;
	}
}

