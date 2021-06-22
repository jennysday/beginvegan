package com.vegan.admin.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.admin.recipe.db.RecipeDAOMyBatis;
import com.vegan.admin.recipe.db.RecipeVO;

@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired 
	private RecipeDAOMyBatis recipeDAO;
	
	//관리자 레시피 등록
	@Override
	public void insertRecipe(RecipeVO vo) {
		recipeDAO.insertRecipe(vo);
	}
	//관리자 레시피 목록
	@Override
	public List<RecipeVO> adminRecipeList(RecipeVO vo) {
		List<RecipeVO> list =recipeDAO.adminRecipeList(vo);
		return list;
	}
	//고객용 레시피 목록
	@Override
	public List<RecipeVO> recipeList(RecipeVO vo) {
		List<RecipeVO> list =recipeDAO.recipeList(vo);
		return list;
	}
	//관리자 레시피 수정
	@Override
	public void modifyRecipe(RecipeVO vo) {
		recipeDAO.modifyRecipe(vo);
	}
	//관리자 레시피 삭제
	@Override
	public void deleteRecipe(RecipeVO vo) {
		recipeDAO.deleteRecipe(vo);
	}
	//관리자 레시피 상세페이지
	@Override
	public RecipeVO adminRecipeDetail(RecipeVO vo) {
		RecipeVO receipe = recipeDAO.adminRecipeDetail(vo);
		return receipe;
	}
	//고객용 레시피 상세페이지
	@Override
	public RecipeVO recipeDetail(RecipeVO vo) {
		RecipeVO receipe = recipeDAO.recipeDetail(vo);
		return receipe;
	}
}
