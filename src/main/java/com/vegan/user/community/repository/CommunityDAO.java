package com.vegan.user.community.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAO {
	
	@Autowired
	private SqlSessionTemplate myBatis;

	//커뮤니티 글 작성
	public void insertCmnt(CommunityVO vo) { 
		System.out.println("insertCmnt()가 실행됐습니다.");
		myBatis.insert("CommunityDAOTemp.insertCmnt", vo);
	}

	//커뮤니티 댓글 작성
	public void insertCmntReply(CommunityVO vo) { 
		System.out.println("insertCmntReply()가 실행됐습니다.");
		myBatis.insert("CommunityDAOTemp.insertCmntReply", vo);
	}

	//커뮤니티 댓글 작성
	public void updateCmntReplySeq(CommunityVO vo) { 
		System.out.println("updateCmntReplySeq()가 실행됐습니다.");
		myBatis.update("CommunityDAOTemp.updateCmntReplySeq", vo);
	}
	
	//커뮤니티 글 목록 조회
	public List<CommunityVO> getCmntList(CommunityVO vo) { 
//		System.out.println("getCmntList()가 실행됐습니다.");
		
		//select 필터링
		if(vo.getCategory().equals("전체")) {
			return myBatis.selectList("CommunityDAOTemp.getCmntList_S", vo);
		}else if(vo.getCategory().equals("레시피")) {
			return myBatis.selectList("CommunityDAOTemp.getCmntList_RP", vo);
		}else if(vo.getCategory().equals("식당 정보")) {
			return myBatis.selectList("CommunityDAOTemp.getCmntList_RT", vo);
		}
		//검색
		else if(vo.getSearchCondition().equals("SUBJECT")) { //제목을 선택한 경우 
			return myBatis.selectList("CommunityDAOTemp.getCmntList_S", vo);
		}else if(vo.getSearchCondition().equals("CONTENT")) { //내용을 선택한 경우
			return myBatis.selectList("CommunityDAOTemp.getCmntList_C", vo);
		}else { //아무것도 선택하지 않는 경우(제목으로 예외처리)
			return myBatis.selectList("CommunityDAOTemp.getCmntList_S", vo);
		} 
	}
	
	//글의 총 개수 
//	public Integer getListCount() {
//		return myBatis.selectOne("CommunityDAOTemp.getListCount");
//	}
 
	public void updateReadcount(CommunityVO vo) {
		System.out.println("updateReadcount()가 실행됐습니다.");
		myBatis.update("CommunityDAOTemp.updateReadcount", vo);
	}
	
	//커뮤니티 글 상세 조회
	public CommunityVO getCmnt(CommunityVO vo) { 
//		System.out.println("getCmnt()가 실행됐습니다.");
		return myBatis.selectOne("CommunityDAOTemp.getCmnt", vo);
	}

	//커뮤니티 글 수정
	public void updateCmnt(CommunityVO vo) { 
		System.out.println("updateCmnt()가 실행됐습니다.");
		myBatis.update("CommunityDAOTemp.updateCmnt", vo);
	}

	//커뮤니티 글 삭제
	public void deleteCmnt(CommunityVO vo) { 
		System.out.println("deleteCmnt()가 실행됐습니다.");
		myBatis.delete("CommunityDAOTemp.deleteCmnt", vo);
	}
	
}
