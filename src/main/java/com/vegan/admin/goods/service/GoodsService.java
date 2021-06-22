package com.vegan.admin.goods.service;

import java.util.List;

import com.vegan.admin.goods.db.GoodsVO;

public interface GoodsService {

	//관리자 상품 등록
	void insertGoods(GoodsVO vo);
		
	//관리자 상품 목록
	List<GoodsVO> adminGoodsList(GoodsVO vo);
		
	//관리자 상품 수정
	void modifyGoods(GoodsVO vo);
		
	//관리자 상품 삭제
	void deleteGoods(GoodsVO vo);
		
	//관리자 상품 상세페이지
	GoodsVO adminGoodsDetail(GoodsVO vo);
	
	//고객용 상품 목록 조회
	List<GoodsVO> getGoodsList(GoodsVO vo);
	
	//고객용 상품 상세 조회
	GoodsVO getGoods(GoodsVO vo);
	
}
