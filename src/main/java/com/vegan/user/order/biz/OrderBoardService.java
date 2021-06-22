package com.vegan.user.order.biz;

import java.util.List;



public interface OrderBoardService {
	//CRUD 기능의 메소드 구현
	
	void prepareOrder(OrderBoardVO vo);
	
	List <OrderBoardVO> getOrderTmpList(OrderBoardVO vo);
	
	void startOrder(OrderBoardVO vo);
	
	void insertOrder(OrderBoardVO vo);

	OrderBoardVO getMemberInfo(OrderBoardVO vo);

	List<OrderBoardVO> getOrderList(OrderBoardVO vo);
	
	void backOrder(OrderBoardVO vo);

	void prepareOrderOnly(OrderBoardVO vo);

	int updateOrderStatus(OrderBoardVO vo);
	
}
