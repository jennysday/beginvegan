package com.vegan.admin.faq.biz;

import java.util.List;



public interface AdminFaqBoardService {
	//CRUD 기능의 메소드 구현
	
	// 글 등록
	void insertBoard(AdminFaqBoardVO vo);
	
	// 글 목록 조회
	List <AdminFaqBoardVO> getBoardList(AdminFaqBoardVO vo);
	
	// 글 상세 조회
	AdminFaqBoardVO getBoard(AdminFaqBoardVO vo);

	// 글 수정
	void updateBoard(AdminFaqBoardVO vo);
	
	// 글 삭제
	void deleteBoard(AdminFaqBoardVO vo);
	

	
}
