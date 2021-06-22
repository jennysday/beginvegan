package com.vegan.admin.member.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate myBatis;

	//회원 가입
	public void insertMember(MemberVO vo) { 
		System.out.println("insertMember()가 실행됐습니다.");
		myBatis.insert("MemberDAOTemp.insertMember", vo);
	}
	
	//회원 로그인
	public String memberLogin(MemberVO vo) { 
		System.out.println("memberLogin()가 실행됐습니다.");
		return myBatis.selectOne("MemberDAOTemp.memberLogin", vo);
	}
	
	//회원 탈퇴
	public void memberOut(MemberVO vo) {
		System.out.println("memberOut()가 실행됐습니다.");
		myBatis.delete("MemberDAOTemp.memberOut", vo);
	}
	
	//아이디 중복확인
	public Integer idCheck(MemberVO vo) { 
		System.out.println("idCheck()가 실행됐습니다.");
		return myBatis.selectOne("MemberDAOTemp.idCheck", vo);
	}
	
	//우편번호 검색
	public List<ZipcodeVO> searchZipcode(ZipcodeVO vo) {
		System.out.println("searchZipcode()가 실행됐습니다.");
		return myBatis.selectList("ZipcodeDAOTemp.searchZipcode", vo);
	}
	
	//아이디 찾기
	public MemberVO findMemberId(MemberVO vo) { 
		System.out.println("findMemberId()가 실행됐습니다.");
		return myBatis.selectOne("MemberDAOTemp.findMemberId", vo);
	}
	
	//비밀번호 찾기
	public MemberVO findMemberPw(MemberVO vo) { 
		System.out.println("findMemberPw()가 실행됐습니다.");
		return myBatis.selectOne("MemberDAOTemp.findMemberPw", vo);
	}
	
	//회원 체크
	public MemberVO memberCheck(MemberVO vo) {
		System.out.println("memberCheck()가 실행됐습니다.");
		return myBatis.selectOne("MemberDAOTemp.memberCheck", vo);
	}
 
	//회원 목록 조회
	public List<MemberVO> getMemberList(MemberVO vo) { 
		System.out.println("getMemberList()가 실행됐습니다.");
		
		if(vo.getSearchCondition().equals("ID")) { //아이디를 선택한 경우 
			return myBatis.selectList("MemberDAOTemp.getMemberList_I", vo);
		}else if(vo.getSearchCondition().equals("NAME")) { //이름을 선택한 경우
			return myBatis.selectList("MemberDAOTemp.getMemberList_N", vo);
		}else { //아무것도 선택하지 않는 경우(아이디로 예외처리)
			return myBatis.selectList("MemberDAOTemp.getMemberList_I", vo);
		}
	}
 
	//회원 정보 상세 검색
	public MemberVO getMember(MemberVO vo) { 
		System.out.println("getMember()가 실행됐습니다.");
		return myBatis.selectOne("MemberDAOTemp.getMember", vo);
	}

	//회원 정보 수정
	public void updateMember(MemberVO vo) { 
		System.out.println("updateMember()가 실행됐습니다.");
		myBatis.update("MemberDAOTemp.updateMember", vo);
	}

	//회원 정보 탈퇴
	public void deleteMember(MemberVO vo) { 
		System.out.println("deleteMember()가 실행됐습니다.");
		myBatis.delete("MemberDAOTemp.deleteMember", vo);
	}
	
}
