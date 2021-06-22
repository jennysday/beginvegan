package com.vegan.user.qaa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.admin.qaa.biz.AdminQaaBoardVO;
import com.vegan.user.qaa.biz.QaaBoardService;
import com.vegan.user.qaa.biz.QaaBoardVO;


@Service
public class QaaBoardServiceImpl implements QaaBoardService {
	
	@Autowired
	private QaaBoardDAO boardDAO;
	
	@Override
	public void insertBoard(QaaBoardVO vo) {
		boardDAO.insertBoard(vo);

	}

	@Override
	public List<QaaBoardVO> getBoardList(QaaBoardVO vo) {
		List<QaaBoardVO> list= boardDAO.getBoardList(vo);
		return list;
	}

	@Override
	public QaaBoardVO getBoard(QaaBoardVO vo) {
		QaaBoardVO board= boardDAO.getBoard(vo);
		return board;
	}

	@Override
	public void updateBoard(QaaBoardVO vo) {
		boardDAO.updateBoard(vo);

	}

	@Override
	public void deleteBoard(QaaBoardVO vo) {
		boardDAO.deleteBoard(vo);

	}

	@Override
	public QaaBoardVO getReply(QaaBoardVO vo) {
		QaaBoardVO board= boardDAO.getReply(vo);
		return board;
	}



}
