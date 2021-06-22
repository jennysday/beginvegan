package com.vegan.admin.qaa.biz;

import java.util.List;



public interface AdminQaaBoardService {
	//CRUD 기능의 메소드 구현
	
	// 글 등록
	void insertBoard(AdminQaaBoardVO vo);
	
	// 글 목록 조회
	List <AdminQaaBoardVO> getBoardList(AdminQaaBoardVO vo);
	
	// 글 상세 조회
	AdminQaaBoardVO getBoard(AdminQaaBoardVO vo);
	
	
	
	AdminQaaBoardVO getReply(AdminQaaBoardVO vo);
	
	// 글 수정
	void updateBoard(AdminQaaBoardVO vo);
	
	// 글 삭제
	void deleteBoard(AdminQaaBoardVO vo);
	
	//답변 삭제
	void deleteReply(AdminQaaBoardVO vo);
	
	
}
