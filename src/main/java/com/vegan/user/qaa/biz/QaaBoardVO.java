package com.vegan.user.qaa.biz;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class QaaBoardVO {
	
	private int seq;
	private String id;
	private String category;
	private String subject;
	private String content;
	private String image;
	private int re_ref;
	private int re_lev;
	private String status;
	

	private Date qaa_date;
	
	private MultipartFile uploadFile;
	


	
	
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}


	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getQaa_date() {
		return qaa_date;
	}
	public void setQaa_date(Date qaa_date) {
		this.qaa_date = qaa_date;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	
	
	

}
