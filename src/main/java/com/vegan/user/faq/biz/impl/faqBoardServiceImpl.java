package com.vegan.user.faq.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.user.faq.biz.faqBoardService;
import com.vegan.user.faq.biz.faqBoardVO;


@Service
public class faqBoardServiceImpl implements faqBoardService {
	
	@Autowired
	private faqBoardDAO boardDAO;

	@Override
	public void insertBoard(faqBoardVO vo) {
		boardDAO.insertBoard(vo);
		
	}

	@Override
	public List<faqBoardVO> getBoardList(faqBoardVO vo) {
		List<faqBoardVO> list= boardDAO.getBoardList(vo);
		return list;
	}

	@Override
	public faqBoardVO getBoard(faqBoardVO vo) {
		faqBoardVO board= boardDAO.getBoard(vo);
		return board;
	}

	@Override
	public void updateBoard(faqBoardVO vo) {
		boardDAO.updateBoard(vo);
		
	}

	@Override
	public void deleteBoard(faqBoardVO vo) {
		boardDAO.deleteBoard(vo);
		
	}
	
	
}
	
	