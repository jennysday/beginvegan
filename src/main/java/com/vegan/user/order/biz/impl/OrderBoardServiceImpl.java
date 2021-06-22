package com.vegan.user.order.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.user.order.biz.OrderBoardService;
import com.vegan.user.order.biz.OrderBoardVO;


@Service
public class OrderBoardServiceImpl implements OrderBoardService {
	
	@Autowired
	private OrderBoardDAO boardDAO;

	@Override
	public void prepareOrder(OrderBoardVO vo) {
		boardDAO.prepareOrder(vo);

	}
	
	@Override
	public void prepareOrderOnly(OrderBoardVO vo) {
		boardDAO.prepareOrderOnly(vo);

	}

	@Override
	public List<OrderBoardVO> getOrderTmpList(OrderBoardVO vo) {
		List<OrderBoardVO> list= boardDAO.getOrderTmpList(vo);
		return list;
	}
	
	@Override
	public OrderBoardVO getMemberInfo(OrderBoardVO vo) {
		OrderBoardVO board= boardDAO.getMemberInfo(vo);
		return board;
	}
	

	@Override
	public void startOrder(OrderBoardVO vo) {
		boardDAO.startOrder(vo);
		
	}

	@Override
	public void insertOrder(OrderBoardVO vo) {
		boardDAO.insertOrder(vo);
		
	}



	@Override
	public List<OrderBoardVO> getOrderList(OrderBoardVO vo) {
		List<OrderBoardVO> list= boardDAO.getOrderList(vo);
		return list;
	}
	
	@Override
	public int updateOrderStatus(OrderBoardVO vo) {
		return boardDAO.updateOrderStatus(vo);
	}


	@Override
	public void backOrder(OrderBoardVO vo) {
		boardDAO.backOrder(vo);
		
	}


	
	

}
