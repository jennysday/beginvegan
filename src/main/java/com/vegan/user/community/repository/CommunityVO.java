package com.vegan.user.community.repository;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

public class CommunityVO {
	
	@Autowired
	CommunityDAO dao;
	
	private int seq;
	private String category;
	private String writer;
	private String subject;
	private String content;
	private MultipartFile file; //업로드 파일
	private String cmnt_file; //파일 경로
	private Date cmnt_date;
	private int readcount; //조회수
	
	//댓글 관련 필드
	private int re_ref; //글 정렬(원글과 동일)
	private int re_lev; //댓글 들여쓰기
	private int re_seq; //댓글 오름차순 정렬
	
	//검색 관련 필드
	private String searchCondition; //검색 기능을 위한 필드
	private String searchKeyword; //검색 기능을 위한 필드
	
	//페이징 관련 필드
//	private int nowPage; //현재 페이지
//	private int maxPage; //최대 페이지 수
//	private int startPage; //첫 페이지 수
//	private int endPage; //마지막 페이지 수
//	private int maxSeq; //전체 글 수
//	private int startSeq; //첫 행
//	private int endSeq; //끝 행
	
//	public CommunityVO() {
//		//현재 페이지 수
//		this.nowPage = 1;
//		
//		//전체 글 수
//		this.maxSeq = dao.getListCount();
//		
//		//첫 행과 끝 행(1~10, 11~20 등)
//        this.startSeq = (getNowPage() - 1) * 10;
//        this.endSeq = getNowPage() * 10;
//        
//        if(getMaxSeq() > 0) { //글이 1개 이상인 경우
//			Pagination(new CommunityVO());
//		}
//	}
//	
//	public void Pagination(CommunityVO vo) {
//		// 글 목록
//		dao.getCmntList(vo);
//		
//		// 최대 페이지 수 
//		this.maxPage = (int)((double)getMaxSeq()/getEndSeq()+0.95);
//        if (getNowPage() > getMaxPage()) setNowPage(maxPage); //현재 페이지 번호가 전체 페이지 수보다 크면 현재 페이지 번호에 전체 페이지 수를 저장
//        
//        // 시작 페이지(1, 11, 21 등)
//        startPage = (((int)((double)getNowPage() / 10 + 0.9)) - 1) * 10 + 1;
// 
//        // 마지막 페이지(10, 20, 30 등)
//        endPage = getStartPage() + 10 - 1;
//        if (getEndPage() > getMaxPage()) setEndPage(maxPage); //마지막 페이지가 최대 페이지 수보다 크면 끝 페이지까지 보여주지 않고 최대 페이지까지 보여준다
//	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getCmnt_file() {
		return cmnt_file;
	}
	public void setCmnt_file(String cmnt_file) {
		this.cmnt_file = cmnt_file;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCmnt_date() {
		return cmnt_date;
	}
	public void setCmnt_date(Date cmnt_date) {
		this.cmnt_date = cmnt_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
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
//	public int getNowPage() {
//		return nowPage;
//	}
//
//	public void setNowPage(int nowPage) {
//		this.nowPage = nowPage;
//	}
//
//	public int getMaxPage() {
//		return maxPage;
//	}
//
//	public void setMaxPage(int maxPage) {
//		this.maxPage = maxPage;
//	}
//
//	public int getStartPage() {
//		return startPage;
//	}
//
//	public void setStartPage(int startPage) { 
//		this.startPage = startPage;
//	}
//
//	public int getEndPage() {
//		return endPage;
//	}
//
//	public void setEndPage(int endPage) { 
//		this.endPage = endPage;
//	}
//
//	public int getMaxSeq() {
//		return maxSeq;
//	}
//
//	public void setMaxSeq(int maxSeq) {
//		this.maxSeq = maxSeq;
//	}
//	
//	public int getStartSeq() {
//		return startSeq;
//	}
//
//	public void setStartSeq(int startSeq) {
//		this.startSeq = startSeq;
//	}
//
//	public int getEndSeq() {
//		return endSeq;
//	}
//
//	public void setEndSeq(int endSeq) {
//		this.endSeq = endSeq;
//	}
	
	@Override
	public String toString() {
		return "seq : "+seq+", category : "+category+", writer : "+writer+", subject : "+subject+", file : "+file+", cmnt_file : "+cmnt_file
				+ ", content : "+content+", cmnt_date : "+cmnt_date+", readcount : "+readcount+"\n"
				+ "[reply] ref : "+re_ref+", lev : "+re_lev+", seq : "+re_seq;
//				+ ", nowPage : "+nowPage+", maxPage : "+maxPage+", startPage : "+startPage+", endPage : "+endPage+", maxSeq : "+maxSeq+", startSeq : "+startSeq+", endSeq : "+endSeq
	}
	
}
