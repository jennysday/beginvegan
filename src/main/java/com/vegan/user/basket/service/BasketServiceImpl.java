package com.vegan.user.basket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.user.basket.dao.BasketDAO;
import com.vegan.user.basket.dao.BasketVO;


@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO boardDAO;

	@Override
	public List<BasketVO> getBasketList(BasketVO vo) {
		return boardDAO.getBasketList(vo);

	}

	@Override
	public void deleteBasket(BasketVO vo) {
		boardDAO.deleteBasket(vo);

	}
	
	@Override
	public void updateBasket(BasketVO vo) {
		boardDAO.updateBasket(vo);
	}

	@Override
	public void addBasket(BasketVO vo) {
		
		Integer amount = boardDAO.getAmount(vo); 
		//널값인지 아닌지 알 수 있게 최상위 부모가 오브젝트형인 숫자 자료형을 담을 수 있는 integer에 담아줌
		System.out.println("amount: "+amount);
		if (amount == null) { //장바구니에 없는 상품이라면
			System.out.println("amount == null");
			boardDAO.addBasket(vo);//장바구니에 상품 추가
		} else {//이미 장바구니에 추가 된 상품이라면
			vo.setAmount(vo.getAmount()+amount);//기존 수량 + 신규 수량
			boardDAO.updateAmount(vo);
		}
		
	}



}
