package com.vegan.user.goods.review.service;

import java.util.List;

import com.vegan.user.goods.review.db.ReviewVO;

public interface ReviewService {

	//리뷰 등록
	void insertReview(ReviewVO vor);
	
	//리뷰 조회
	List<ReviewVO> getReviewList(ReviewVO vor);

	//리뷰 수정
	void updateReview(ReviewVO vor);
	
	//리뷰 삭제 
	void deleteReview(ReviewVO vor);
	
	//조회수 증가
	void plusReadcount(ReviewVO vor);

	List<ReviewVO> getMyReviewList(ReviewVO vor);
}
