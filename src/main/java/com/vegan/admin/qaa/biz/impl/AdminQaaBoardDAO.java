package com.vegan.admin.qaa.biz.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vegan.admin.qaa.biz.AdminQaaBoardVO;

@Repository
public class AdminQaaBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertBoard(AdminQaaBoardVO vo) {
		mybatis.insert("AdminQaaBoardDAOTemp.insertBoard", vo);
		mybatis.update("AdminQaaBoardDAOTemp.updateStatus", vo);
	}

	public void updateBoard(AdminQaaBoardVO vo) {
		System.out.println(vo.getContent()+", "+vo.getSeq());
		mybatis.update("AdminQaaBoardDAOTemp.updateBoard", vo);
	}

	public void deleteBoard(AdminQaaBoardVO vo) {
		mybatis.delete("AdminQaaBoardDAOTemp.deleteBoard", vo);
	}
	
	public void deleteReply(AdminQaaBoardVO vo) {
		mybatis.update("AdminQaaBoardDAOTemp.updateStatus2", vo);
		mybatis.delete("AdminQaaBoardDAOTemp.deleteReply", vo);
		
	}

	public int checkReply(AdminQaaBoardVO vo) throws Exception {

		System.out.println("result" + mybatis.selectOne("AdminQaaBoardDAOTemp.checkReply", vo));
		return mybatis.selectOne("AdminQaaBoardDAOTemp.checkReply", vo);
	}

	public AdminQaaBoardVO getBoard(AdminQaaBoardVO vo) {
		return mybatis.selectOne("AdminQaaBoardDAOTemp.getBoard", vo);

	}

	public AdminQaaBoardVO getReply(AdminQaaBoardVO vo) {
		return mybatis.selectOne("AdminQaaBoardDAOTemp.getReply", vo);

	}

	public List<AdminQaaBoardVO> getBoardList(AdminQaaBoardVO vo) {



		return mybatis.selectList("AdminQaaBoardDAOTemp.getBoardList", vo);

		
//		if(vo.getFilterCategory().equals("전체")) { 
//			return
//		mybatis.selectList("AdminQaaBoardDAOTemp.getBoardList", vo); }else
//		if(vo.getFilterStatus().equals("전체")) { return
//		mybatis.selectList("AdminQaaBoardDAOTemp.getBoardList", vo); }else
//		 
//		
//
//		
//		if(vo.getFilterCategory()!=null) {
//			//System.out.println("getFilterCate: "+vo.getFilterCategory()); return
//		 mybatis.selectList("AdminQaaBoardDAOTemp.getBoardList_catfilter", vo); }else
//		 if(vo.getFilterStatus()!=null) { return
//		 mybatis.selectList("AdminQaaBoardDAOTemp.getBoardList_statusfilter", vo);
//		 }else if(vo.getSearchCondition().equals("SUBJECT")) { return
//		 mybatis.selectList("AdminQaaBoardDAOTemp.getBoardList_S", vo); }else
//		 if(vo.getSearchCondition().equals("CONTENT")) { return
//		 mybatis.selectList("AdminQaaBoardDAOTemp.getBoardList_C", vo); }else
//		 if(vo.getSearchCondition().equals("ID")) { return
//		 mybatis.selectList("AdminQaaBoardDAOTemp.getBoardList_I", vo); }else { return
//		 mybatis.selectList("AdminQaaBoardDAOTemp.getBoardList_T", vo); }
		 

	}



}
