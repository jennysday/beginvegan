package com.vegan.admin.member.service;

import java.util.List;

import com.vegan.admin.member.repository.MemberVO;
import com.vegan.admin.member.repository.ZipcodeVO;

public interface MemberService { //회원 관리
	public void insertMember(MemberVO vo); //회원 가입
	public String memberLogin(MemberVO vo); //회원 로그인
	public void memberOut(MemberVO vo); //회원 탈퇴
	public Integer idCheck(MemberVO vo); //아이디 중복확인
	public MemberVO findMemberId(MemberVO vo); //아이디 찾기
	public MemberVO findMemberPw(MemberVO vo); //비밀번호 찾기
	public List<ZipcodeVO> searchZipcode(ZipcodeVO vo); //우편번호 검색
	public MemberVO memberCheck(MemberVO vo); //사용자 체크
	public List<MemberVO> getMemberList(MemberVO vo); //회원 목록 조회
	public MemberVO getMember(MemberVO vo); //회원 정보 상세 검색
	public void updateMember(MemberVO vo); //회원 정보 수정
	public void deleteMember(MemberVO vo); //회원 정보 탈퇴
}