package com.vegan.admin.recipe.db;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAOMyBatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//관리자 레시피 등록
	public void insertRecipe(RecipeVO vo) {
		System.out.println("Mybatis.insertRecipe");
		mybatis.insert("RecipeDAOTemp.insertRecipe", vo);
	}
	//관리자 레시피 목록
	public List<RecipeVO> adminRecipeList(RecipeVO vo){
		System.out.println("Mybatis.adminRecipeList");
		return mybatis.selectList("RecipeDAOTemp.adminRecipeList", vo);
	}
	//고객용 레시피 목록
	public List<RecipeVO> recipeList(RecipeVO vo){
		System.out.println("Mybatis.recipeList");
		return mybatis.selectList("RecipeDAOTemp.recipeList", vo);
	}
	//관리자 레시피 수정
	public void modifyRecipe(RecipeVO vo) {
		System.out.println("Mybatis.modifyRecipe");
		mybatis.update("RecipeDAOTemp.modifyRecipe", vo);
	}
	//관리자 레시피 삭제
	public void deleteRecipe(RecipeVO vo) {
		System.out.println("Mybatis.deleteRecipe");
		mybatis.delete("RecipeDAOTemp.deleteRecipe", vo);
	}
	//관리자 레시피 상세페이지
	public RecipeVO adminRecipeDetail(RecipeVO vo) {
		System.out.println("Mybatis.adminRecipeDetail");
		return mybatis.selectOne("RecipeDAOTemp.adminRecipeDetail",vo);
	}
	//고객용 레시피 상세페이지
	public RecipeVO recipeDetail(RecipeVO vo) {
		System.out.println("Mybatis.recipeDetail");
		return mybatis.selectOne("RecipeDAOTemp.recipeDetail",vo);
	}
}
