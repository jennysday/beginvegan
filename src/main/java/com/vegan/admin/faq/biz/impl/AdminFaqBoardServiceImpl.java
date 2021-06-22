package com.vegan.admin.faq.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.admin.faq.biz.AdminFaqBoardService;
import com.vegan.admin.faq.biz.AdminFaqBoardVO;


@Service
public class AdminFaqBoardServiceImpl implements AdminFaqBoardService {
	
	@Autowired
	private AdminFaqBoardDAO boardDAO;

	@Override
	public void insertBoard(AdminFaqBoardVO vo) {
		boardDAO.insertBoard(vo);
		
	}

	@Override
	public List<AdminFaqBoardVO> getBoardList(AdminFaqBoardVO vo) {
		List<AdminFaqBoardVO> list= boardDAO.getBoardList(vo);
		return list;
	}

	@Override
	public AdminFaqBoardVO getBoard(AdminFaqBoardVO vo) {
		AdminFaqBoardVO board= boardDAO.getBoard(vo);
		return board;
	}

	@Override
	public void updateBoard(AdminFaqBoardVO vo) {
		boardDAO.updateBoard(vo);
		
	}

	@Override
	public void deleteBoard(AdminFaqBoardVO vo) {
		boardDAO.deleteBoard(vo);
		
	}
	
	
}
	
	