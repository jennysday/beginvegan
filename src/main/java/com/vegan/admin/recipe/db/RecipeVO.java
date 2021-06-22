package com.vegan.admin.recipe.db;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class RecipeVO {
	
	private	int recipe_number;
	private String recipe_category;
	private String recipe_name;
	private String recipe_ingredient;
	private String recipe_content;
	private String recipe_image01;
	private String recipe_image02;
	private String recipe_image03;
	private Date recipe_date;
	private MultipartFile file01;
	private MultipartFile file02;
	private MultipartFile file03;
	
	public int getRecipe_number() {
		return recipe_number;
	}
	public void setRecipe_number(int recipe_number) {
		this.recipe_number = recipe_number;
	}
	public String getRecipe_category() {
		return recipe_category;
	}
	public void setRecipe_category(String recipe_category) {
		this.recipe_category = recipe_category;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public String getRecipe_ingredient() {
		return recipe_ingredient;
	}
	public void setRecipe_ingredient(String recipe_ingredient) {
		this.recipe_ingredient = recipe_ingredient;
	}
	public String getRecipe_content() {
		return recipe_content;
	}
	public void setRecipe_content(String recipe_content) {
		this.recipe_content = recipe_content;
	}
	public String getRecipe_image01() {
		return recipe_image01;
	}
	public void setRecipe_image01(String recipe_image01) {
		this.recipe_image01 = recipe_image01;
	}
	public String getRecipe_image02() {
		return recipe_image02;
	}
	public void setRecipe_image02(String recipe_image02) {
		this.recipe_image02 = recipe_image02;
	}
	public String getRecipe_image03() {
		return recipe_image03;
	}
	public void setRecipe_image03(String recipe_image03) {
		this.recipe_image03 = recipe_image03;
	}
	public Date getRecipe_date() {
		return recipe_date;
	}
	public void setRecipe_date(Date recipe_date) {
		this.recipe_date = recipe_date;
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

}
