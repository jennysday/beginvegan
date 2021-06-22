package com.vegan.user.order.biz.impl;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vegan.user.order.biz.OrderBoardVO;


@Repository
public class OrderBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void prepareOrder(OrderBoardVO vo) {
		
//		mybatis.update("OrderBoardDAOTemp.dropTableIfexist", vo);	
		mybatis.update("OrderBoardDAOTemp.createCheckOutTable", vo);	
		mybatis.update("OrderBoardDAOTemp.alterOrder_num", vo);
		mybatis.update("OrderBoardDAOTemp.updateOrder_num", vo);
		//mybatis.update("OrderBoardDAOTemp.renameCheckOutTable", vo);

		
	}
	
	
	public void prepareOrderOnly(OrderBoardVO vo) {
		mybatis.update("OrderBoardDAOTemp.createCheckOutTableOnlyThis", vo);
		mybatis.update("OrderBoardDAOTemp.alterOrder_numOnlyThis", vo);
		mybatis.update("OrderBoardDAOTemp.alterOrder_num", vo);
		mybatis.update("OrderBoardDAOTemp.updateOrder_numOnlyThis", vo);		
		mybatis.update("OrderBoardDAOTemp.updateOrder_num", vo);
		//mybatis.update("OrderBoardDAOTemp.renameCheckOutTable", vo);
		
	}
	
	//결제페이지에서 띄우기.
	public List<OrderBoardVO> getOrderTmpList(OrderBoardVO vo) {		
		return mybatis.selectList("OrderBoardDAOTemp.getOrderTmpList", vo);
	}
	
	public OrderBoardVO getMemberInfo(OrderBoardVO vo) {
		return mybatis.selectOne("OrderBoardDAOTemp.getMemberInfo", vo);
	}

	public void startOrder(OrderBoardVO vo) {
		
		//order_tradenum 넣기
		
	    Date now = new Date();
	    SimpleDateFormat vans = new SimpleDateFormat("yyyyMMdd");
	    String wdate = vans.format(now);
	    
	    String order_tradenum=null;

	    if(vo.getOrder_member_seq()/10==0) {
	    	if(vo.getOrder_member_orderNum()/10==0) {
	    		order_tradenum="S"+wdate+"_000"+vo.getOrder_member_seq()+"_000"+vo.getOrder_member_orderNum();
	    	}else if(vo.getOrder_member_orderNum()/10==1) {
	    		order_tradenum="S"+wdate+"_000"+vo.getOrder_member_seq()+"_00"+vo.getOrder_member_orderNum();
	    	}else if(vo.getOrder_member_orderNum()/10==2) {
	    		order_tradenum="S"+wdate+"_000"+vo.getOrder_member_seq()+"_0"+vo.getOrder_member_orderNum();
	    	}else {
	    		order_tradenum="S"+wdate+"_000"+vo.getOrder_member_seq()+"_"+vo.getOrder_member_orderNum();
	    	}
	    }else if(vo.getOrder_member_seq()/10==1) {
	    	if(vo.getOrder_member_orderNum()/10==0) {
	    		order_tradenum="S"+wdate+"_00"+vo.getOrder_member_seq()+"_000"+vo.getOrder_member_orderNum();
	    	}else if(vo.getOrder_member_orderNum()/10==1) {
	    		order_tradenum="S"+wdate+"_00"+vo.getOrder_member_seq()+"_00"+vo.getOrder_member_orderNum();
	    	}else if(vo.getOrder_member_orderNum()/10==2) {
	    		order_tradenum="S"+wdate+"_00"+vo.getOrder_member_seq()+"_0"+vo.getOrder_member_orderNum();
	    	}else {
	    		order_tradenum="S"+wdate+"_00"+vo.getOrder_member_seq()+"_"+vo.getOrder_member_orderNum();
	    	}
	    }else if(vo.getOrder_member_seq()/10==2) {
	    	if(vo.getOrder_member_orderNum()/10==0) {
	    		order_tradenum="S"+wdate+"_0"+vo.getOrder_member_seq()+"_000"+vo.getOrder_member_orderNum();
	    	}else if(vo.getOrder_member_orderNum()/10==1) {
	    		order_tradenum="S"+wdate+"_0"+vo.getOrder_member_seq()+"_00"+vo.getOrder_member_orderNum();
	    	}else if(vo.getOrder_member_orderNum()/10==2) {
	    		order_tradenum="S"+wdate+"_0"+vo.getOrder_member_seq()+"_0"+vo.getOrder_member_orderNum();
	    	}else {
	    		order_tradenum="S"+wdate+"_0"+vo.getOrder_member_seq()+"_"+vo.getOrder_member_orderNum();
	    	}
	    }else {
	    	if(vo.getOrder_member_orderNum()/10==0) {
	    		order_tradenum="S"+wdate+"_"+vo.getOrder_member_seq()+"_000"+vo.getOrder_member_orderNum();
	    	}else if(vo.getOrder_member_orderNum()/10==1) {
	    		order_tradenum="S"+wdate+"_"+vo.getOrder_member_seq()+"_00"+vo.getOrder_member_orderNum();
	    	}else if(vo.getOrder_member_orderNum()/10==2) {
	    		order_tradenum="S"+wdate+"_"+vo.getOrder_member_seq()+"_0"+vo.getOrder_member_orderNum();
	    	}else {
	    		order_tradenum="S"+wdate+"_"+vo.getOrder_member_seq()+"_"+vo.getOrder_member_orderNum();
	    	}
	    }
	 
	    vo.setOrder_tradenum(order_tradenum);
 
	    mybatis.update("OrderBoardDAOTemp.insertInfo", vo);	

	}
	
	public void insertOrder(OrderBoardVO vo) {

		mybatis.insert("OrderBoardDAOTemp.copyTemp", vo);	
		mybatis.update("OrderBoardDAOTemp.goodsAmountDecrease", vo);
		mybatis.update("OrderBoardDAOTemp.dropCheckOutTable", vo);
		
		mybatis.delete("OrderBoardDAOTemp.deleteBasket", vo);

	}

	public List<OrderBoardVO> getOrderList(OrderBoardVO vo) {
		return mybatis.selectList("OrderBoardDAOTemp.getOrderList", vo);
	}
	
	public void backOrder(OrderBoardVO vo) {
		mybatis.update("OrderBoardDAOTemp.dropCheckOutTable", vo);
		
	}

	public int updateOrderStatus(OrderBoardVO vo) {
		return mybatis.update("OrderBoardDAOTemp.updateOrderStatus", vo);
	}


	
}

