package com.vegan.user.community.service;

import java.util.List;

import com.vegan.user.community.repository.CommunityVO;

public interface CommunityService { //커뮤니티 게시판
	//CRUD 기능 메서드 구현
	public void insertCmnt(CommunityVO vo); //글 작성
	public void insertCmntReply(CommunityVO vo); //댓글 작성
	public void updateCmntReplySeq(CommunityVO vo); //댓글 seq 업데이트
	public List<CommunityVO> getCmntList(CommunityVO vo); //전체 글 조회
	public CommunityVO getCmnt(CommunityVO vo); //글 상세 조회
	public void updateReadcount(CommunityVO vo); //조회수 업데이트
	public void updateCmnt(CommunityVO vo); //글 수정
	public void deleteCmnt(CommunityVO vo); //글 삭제
}
