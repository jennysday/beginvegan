package com.vegan.user.faq.biz;

import java.util.List;



public interface faqBoardService {
	//CRUD 기능의 메소드 구현
	
	// 글 등록
	void insertBoard(faqBoardVO vo);
	
	// 글 목록 조회
	List <faqBoardVO> getBoardList(faqBoardVO vo);
	
	// 글 상세 조회
	faqBoardVO getBoard(faqBoardVO vo);

	// 글 수정
	void updateBoard(faqBoardVO vo);
	
	// 글 삭제
	void deleteBoard(faqBoardVO vo);
	

	
}
