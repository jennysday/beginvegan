package com.vegan.user.basket.service;

import java.util.List;

import com.vegan.user.basket.dao.BasketVO;



public interface BasketService {

	List<BasketVO> getBasketList(BasketVO vo);

	void deleteBasket(BasketVO vo);

	void addBasket(BasketVO vo);
	
	void updateBasket(BasketVO vo);
}
