package com.vegan.admin.member.repository;

import java.sql.Timestamp;
import java.util.Date;

public class MemberVO {
	private int seq;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String email_get; //메일 수신 여부
	private String zipcode1; //우편번호1
	private String zipcode2; //우편번호2
	private String phone; //휴대폰
	private String addr1; //집주소
	private String addr2; //상세주소
	private String birth; //생년월일
	private Date member_date; //회원가입 날짜
	
	private String searchCondition; //검색 기능을 위한 필드
	private String searchKeyword; //검색 기능을 위한 필드
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail_get() {
		return email_get;
	}
	public void setEmail_get(String email_get) {
		this.email_get = email_get;
	}
	public String getZipcode1() {
		return zipcode1;
	}
	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}
	public String getZipcode2() {
		return zipcode2;
	}
	public void setZipcode2(String zipcode2) {
		this.zipcode2 = zipcode2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public Date getMember_date() {
		return member_date;
	}
	public void setMember_date(Timestamp member_date) {
		this.member_date = member_date;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	@Override
	public String toString() {
		return "seq : "+seq+", id : "+id+", pw : "+pw+", name : "+name+", email : "+email+", email_get : "+email_get
				+ ", zipcode : "+zipcode1+"-"+zipcode2+", phone : "+phone+", addr : "+addr1+"("+addr2+")"+", birth : "+birth+", date : "+member_date+"\n";
	}
	
}
