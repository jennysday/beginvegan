package com.vegan.user.goods.review.db;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vegan.admin.goods.db.GoodsVO;

@Repository
public class ReviewDAOMyBatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertReview(ReviewVO vor) {
		System.out.println("리뷰입력처리");
		mybatis.insert("ReviewDAOTemp.insertReview", vor);
	}
			
	public void updateReview(ReviewVO vor) {
		System.out.println("리뷰수정처리");
		mybatis.update("ReviewDAOTemp.updateReview", vor);
	}
	
	public void deleteReview(ReviewVO vor) {
		System.out.println("리뷰삭제 처리");
		mybatis.delete("ReviewDAOTemp.deleteReview", vor);
	}
	
	public List<ReviewVO> getReviewList(ReviewVO vor) {
		System.out.println("리뷰상세기능 처리");
		return mybatis.selectList("ReviewDAOTemp.getReviewList",vor);
	}
	
	public void plusReadcount(ReviewVO vor) {
		System.out.println("리뷰조회수 처리");
		mybatis.update("ReviewDAOTemp.plusReadcount",vor);
	}

	public List<ReviewVO> getMyReviewList(ReviewVO vor) {
		return mybatis.selectList("ReviewDAOTemp.getMyReviewList",vor);
	}
	
}
