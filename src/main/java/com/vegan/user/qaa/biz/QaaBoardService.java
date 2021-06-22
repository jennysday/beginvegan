package com.vegan.user.qaa.biz;

import java.util.List;



public interface QaaBoardService {
	//CRUD 기능의 메소드 구현
	
	// 글 등록
	void insertBoard(QaaBoardVO vo);
	
	// 글 목록 조회
	List <QaaBoardVO> getBoardList(QaaBoardVO vo);
	
	// 글 상세 조회
	QaaBoardVO getBoard(QaaBoardVO vo);
	
	// 글 수정
	void updateBoard(QaaBoardVO vo);
	
	// 글 삭제
	void deleteBoard(QaaBoardVO vo);

	QaaBoardVO getReply(QaaBoardVO vo);
}
