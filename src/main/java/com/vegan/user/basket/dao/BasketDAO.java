package com.vegan.user.basket.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class BasketDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<BasketVO> getBasketList(BasketVO vo) {
		return mybatis.selectList("basketMapper.getBasketList", vo);

	}

	public void deleteBasket(BasketVO vo) {
		mybatis.delete("basketMapper.deleteBasket", vo);

	}

	public void addBasket(BasketVO vo) {
		mybatis.insert("basketMapper.addBasket", vo);
	}

	public Integer getAmount(BasketVO vo) {
		return mybatis.selectOne("basketMapper.getAmount", vo);
	}

	public void updateAmount(BasketVO vo) {
		mybatis.update("basketMapper.updateAmount", vo);
	}
	
	public void updateBasket(BasketVO vo) {
		mybatis.update("basketMapper.updateAmount", vo);
	}

}
