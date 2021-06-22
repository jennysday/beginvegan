package com.vegan.admin.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.admin.goods.db.GoodsDAOMyBatis;
import com.vegan.admin.goods.db.GoodsVO;
	
@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired 
	private GoodsDAOMyBatis goodsDAO;
	
	//관리자 상품 등록
	@Override
	public void insertGoods(GoodsVO vo) {
		System.out.println("Impl_insertGoods");
		goodsDAO.insertGoods(vo);
	}
	//관리자 상품 목록
	@Override
	public List<GoodsVO> adminGoodsList(GoodsVO vo) {
		System.out.println("Impl_adminGoodsList");
		List<GoodsVO> list =goodsDAO.adminGoodsList(vo);
		return list;
	}
	//관리자 상품 수정
	@Override
	public void modifyGoods(GoodsVO vo) {
		System.out.println("Impl_modifyGoods");
		goodsDAO.modifyGoods(vo);
	}
	//관리자 상품 삭제
	@Override
	public void deleteGoods(GoodsVO vo) {
		System.out.println("Impl_deleteGoods");
		goodsDAO.deleteGoods(vo);
	}
	//관리자 상품 상세페이지
	@Override
	public GoodsVO adminGoodsDetail(GoodsVO vo) {
		System.out.println("Impl_adminGoodsDetail");
		GoodsVO goods = goodsDAO.adminGoodsDetail(vo);
		return goods;
	}
	//고객용 상품 목록
	@Override
	public List<GoodsVO> getGoodsList(GoodsVO vo) {
		List<GoodsVO> list =goodsDAO.getGoodsList(vo);
		return list;
	}
	//고객용 상품 상세페이지
	@Override
	public GoodsVO getGoods(GoodsVO vo) {
		GoodsVO goods = goodsDAO.getGoods(vo);
		
		return goods;
	}
}
