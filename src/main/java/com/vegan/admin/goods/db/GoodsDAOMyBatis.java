package com.vegan.admin.goods.db;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsDAOMyBatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
		//관리자 상품 등록
		public void insertGoods(GoodsVO vo) {
			System.out.println("Mybatis.insertGoods");
			mybatis.insert("GoodsDAOTemp.insertGoods", vo);
		}
		//관리자 상품 목록
		public List<GoodsVO> adminGoodsList(GoodsVO vo){
			System.out.println("Mybatis.adminGoodsList");
			return mybatis.selectList("GoodsDAOTemp.adminGoodsList", vo);
		}
		//관리자 상품 수정
		public void modifyGoods(GoodsVO vo) {
			System.out.println("Mybatis.modifyGoods");
			mybatis.update("GoodsDAOTemp.modifyGoods", vo);
		}
		//관리자 상품 삭제
		public void deleteGoods(GoodsVO vo) {
			System.out.println("Mybatis.deleteGoods");
			mybatis.delete("GoodsDAOTemp.deleteGoods", vo);
		}
		//관리자 상품 상세페이지
		public GoodsVO adminGoodsDetail(GoodsVO vo) {
			System.out.println("Mybatis.adminGoodsDetail");
			return mybatis.selectOne("GoodsDAOTemp.adminGoodsDetail",vo);
		}
		//고객용 상품 상세페이지
		public GoodsVO getGoods(GoodsVO vo) {
			System.out.println("상세기능 처리");
			return mybatis.selectOne("GoodsDAOTemp.getGoods",vo);
			
		}
		//고객용 상품 목록
		public List<GoodsVO> getGoodsList(GoodsVO vo){
			System.out.println("목록처리");
		
			if(vo.getCategory().equals("all")) {
				return mybatis.selectList("GoodsDAOTemp.getGoodsList_A", vo);
			} else if(vo.getCategory().equals("dish")) {
				return mybatis.selectList("GoodsDAOTemp.getGoodsList_DI", vo);
			}else if(vo.getCategory().equals("fast")) {
				return mybatis.selectList("GoodsDAOTemp.getGoodsList_F", vo);
			}  else if(vo.getCategory().equals("drink")) {
				return mybatis.selectList("GoodsDAOTemp.getGoodsList_DR", vo);
			} else if(vo.getCategory().equals("source")) {
				return mybatis.selectList("GoodsDAOTemp.getGoodsList_S", vo);
			} else if(vo.getCategory().equals("daily")) {
				return mybatis.selectList("GoodsDAOTemp.getGoodsList_DA", vo);
			} else if(vo.getCategory().equals("snack")) {
				return mybatis.selectList("GoodsDAOTemp.getGoodsList_SN", vo);
			} 
			
			System.out.println("해당 데이터 카테고리가 없습니다.");
			return null;		
		}
}


















