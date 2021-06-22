package com.vegan.user.goods.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.user.goods.review.db.ReviewDAOMyBatis;
import com.vegan.user.goods.review.db.ReviewVO;

@Service
public class ReviewServceImpl implements ReviewService {

	@Autowired
	private ReviewDAOMyBatis reviewDAO;
	
	@Override
	public void insertReview(ReviewVO vor) {
		reviewDAO.insertReview(vor);
	}
	
	@Override
	public List<ReviewVO> getReviewList(ReviewVO vor) {
		List<ReviewVO> list = reviewDAO.getReviewList(vor);
		return list;
	}
	
	@Override
	public List<ReviewVO> getMyReviewList(ReviewVO vor) {
		List<ReviewVO> list = reviewDAO.getMyReviewList(vor);
		return list;
	}
	
	
	
	
	@Override
	public void updateReview(ReviewVO vor) {
		reviewDAO.updateReview(vor);
	}

	@Override
	public void deleteReview(ReviewVO vor) {
		reviewDAO.deleteReview(vor);
	}

	@Override
	public void plusReadcount(ReviewVO vor) {
		reviewDAO.plusReadcount(vor);
	}
	
}
