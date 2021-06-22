package com.vegan.admin.recipe.service;

import java.util.List;

import com.vegan.admin.recipe.db.RecipeVO;

public interface RecipeService {
	
	//관리자 레시피 등록
	void insertRecipe(RecipeVO vo);
	
	//관리자 레시피 목록
	List<RecipeVO> adminRecipeList(RecipeVO vo);
	
	//고객용 레시피 목록
	List<RecipeVO> recipeList(RecipeVO vo);
	
	//관리자 레시피 수정
	void modifyRecipe(RecipeVO vo);
	
	//관리자 레시피 삭제
	void deleteRecipe(RecipeVO vo);
	
	//관리자 레시피 상세페이지
	RecipeVO adminRecipeDetail(RecipeVO vo);
	
	//고객용 레시피 상세페이지
	RecipeVO recipeDetail(RecipeVO vo);
}
