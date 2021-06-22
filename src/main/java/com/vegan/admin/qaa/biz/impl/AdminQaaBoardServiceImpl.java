package com.vegan.admin.qaa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.admin.qaa.biz.AdminQaaBoardService;
import com.vegan.admin.qaa.biz.AdminQaaBoardVO;


@Service
public class AdminQaaBoardServiceImpl implements AdminQaaBoardService {
	
	@Autowired
	private AdminQaaBoardDAO boardDAO;
	
	@Override
	public void insertBoard(AdminQaaBoardVO vo) {
		System.out.println(vo.getRe_ref());
		boardDAO.insertBoard(vo);
		
	}

	@Override
	public List<AdminQaaBoardVO> getBoardList(AdminQaaBoardVO vo) {
		System.out.println("getBoardList");
		List<AdminQaaBoardVO> list= boardDAO.getBoardList(vo);
		return list;
	}

	@Override
	public AdminQaaBoardVO getBoard(AdminQaaBoardVO vo) {
		
		
		AdminQaaBoardVO board= boardDAO.getBoard(vo);
		System.out.println("board생성");
		
		
		try {
			if(boardDAO.checkReply(board)==0) {
				System.out.println("boardDAO.checkReply(vo)==0");
				board.setCheckReply(false);
			}else {
				System.out.println("boardDAO.checkReply(vo)!=0");
				board.setCheckReply(true);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return board;		
		
		
	}
	
	

	@Override
	public AdminQaaBoardVO getReply(AdminQaaBoardVO vo) {
		AdminQaaBoardVO board= boardDAO.getReply(vo);
		
		return board;
	}
	
	

	@Override
	public void updateBoard(AdminQaaBoardVO vo) {
		boardDAO.updateBoard(vo);
		
	}

	@Override
	public void deleteBoard(AdminQaaBoardVO vo) {
		boardDAO.deleteBoard(vo);
		
	}

	@Override
	public void deleteReply(AdminQaaBoardVO vo) {
		System.out.println("seqimpl: "+vo.getSeq());
		boardDAO.deleteReply(vo);
		
	}

	




}
