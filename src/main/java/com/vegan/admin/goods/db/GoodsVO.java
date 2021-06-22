package com.vegan.admin.goods.db;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class GoodsVO {
	
	private int seq;
	private String category;
	private String name;
	private String shortco;
	private String content;
	private int amount;
	private int price;
	private String image01;
	private String image02;
	private String image03;
	private int best;
	private Date goods_date;
	private MultipartFile file01;
	private MultipartFile file02;
	private MultipartFile file03;
	private String searchCondition;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShortco() {
		return shortco;
	}
	public void setShortco(String shortco) {
		this.shortco = shortco;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage01() {
		return image01;
	}
	public void setImage01(String image01) {
		this.image01 = image01;
	}
	public String getImage02() {
		return image02;
	}
	public void setImage02(String image02) {
		this.image02 = image02;
	}
	public String getImage03() {
		return image03;
	}
	public void setImage03(String image03) {
		this.image03 = image03;
	}
	public int getBest() {
		return best;
	}
	public void setBest(int best) {
		this.best = best;
	}
	public Date getGoods_date() {
		return goods_date;
	}
	public void setGoods_date(Date goods_date) {
		this.goods_date = goods_date;
	}
	public MultipartFile getFile01() {
		return file01;
	}
	public void setFile01(MultipartFile file01) {
		this.file01 = file01;
	}
	public MultipartFile getFile02() {
		return file02;
	}
	public void setFile02(MultipartFile file02) {
		this.file02 = file02;
	}
	public MultipartFile getFile03() {
		return file03;
	}
	public void setFile03(MultipartFile file03) {
		this.file03 = file03;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
}
