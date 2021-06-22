package com.vegan.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.admin.member.repository.MemberDAO;
import com.vegan.admin.member.repository.MemberVO;
import com.vegan.admin.member.repository.ZipcodeVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO member;
	
	@Override
	public void insertMember(MemberVO vo) {
		member.insertMember(vo);
	}
	
	@Override
	public String memberLogin(MemberVO vo) { 
		return member.memberLogin(vo);
	}	
	
	@Override
	public void memberOut(MemberVO vo) {
		member.memberOut(vo);
	}

	@Override
	public Integer idCheck(MemberVO vo) {
		return member.idCheck(vo);
	}
	
	@Override
	public List<ZipcodeVO> searchZipcode(ZipcodeVO vo) {
//		System.out.println("BoardServiceImpl : searchZipcode() 실행");
		return member.searchZipcode(vo);
	}
	
	@Override 
	public MemberVO memberCheck(MemberVO vo) {
		return member.memberCheck(vo);
	}	
	
	@Override
	public MemberVO findMemberId(MemberVO vo) {
		return member.findMemberId(vo);
	}
	
	@Override
	public MemberVO findMemberPw(MemberVO vo) {
		return member.findMemberPw(vo);
	}
	
	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {
		return member.getMemberList(vo);
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		return member.getMember(vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		member.updateMember(vo);
	}

	@Override
	public void deleteMember(MemberVO vo) {
		member.deleteMember(vo);
	}

}

