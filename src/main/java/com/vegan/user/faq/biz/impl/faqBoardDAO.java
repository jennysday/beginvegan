package com.vegan.user.faq.biz.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vegan.user.faq.biz.faqBoardVO;

@Repository
public class faqBoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertBoard(faqBoardVO vo) {
		mybatis.insert("faqBoardDAOTemp.insertBoard", vo);
	}

	public void updateBoard(faqBoardVO vo) {

		mybatis.update("faqBoardDAOTemp.updateBoard", vo);
	}

	public void deleteBoard(faqBoardVO vo) {
		mybatis.delete("faqBoardDAOTemp.deleteBoard", vo);
	}
	


	public faqBoardVO getBoard(faqBoardVO vo) {
		return mybatis.selectOne("faqBoardDAOTemp.getBoard", vo);

	}


	public List<faqBoardVO> getBoardList(faqBoardVO vo) {
		return mybatis.selectList("faqBoardDAOTemp.getBoardList", vo);
		
	}



}
