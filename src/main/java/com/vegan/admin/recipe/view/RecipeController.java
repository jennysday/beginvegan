 package com.vegan.admin.recipe.view;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.vegan.admin.recipe.db.RecipeVO;
import com.vegan.admin.recipe.service.RecipeService;

@Controller
@SessionAttributes("recipe")
public class RecipeController {

	@Autowired
	private RecipeService recipeService;

	// 관리자 레시피 등록
	@RequestMapping(value = "/insertRecipe.go", method = RequestMethod.POST)
	public String insertRecipe(RecipeVO vo, HttpSession session) throws IOException {

		System.out.println("레시피 등록 처리");
		String fileSaveFolder = session.getServletContext().getRealPath("/RecipeUpload/");
		MultipartFile uploadImage01 = vo.getFile01();
		MultipartFile uploadImage02 = vo.getFile02();
		MultipartFile uploadImage03 = vo.getFile03();

		if (!uploadImage01.isEmpty()) {
			String fileName = uploadImage01.getOriginalFilename();
			uploadImage01.transferTo(new File(fileSaveFolder + fileName));
			vo.setRecipe_image01(fileName);
		}
		if (!uploadImage02.isEmpty()) {
			String fileName = uploadImage02.getOriginalFilename();
			uploadImage02.transferTo(new File(fileSaveFolder + fileName));
			vo.setRecipe_image02(fileName);
		}
		if (!uploadImage03.isEmpty()) {
			String fileName = uploadImage03.getOriginalFilename();
			uploadImage03.transferTo(new File(fileSaveFolder + fileName));
			vo.setRecipe_image03(fileName);
		}

		recipeService.insertRecipe(vo);
		return "redirect:adminRecipeList.go";
	}

	// 관리자 레시피 목록
	@RequestMapping(value = "/adminRecipeList.go", method = RequestMethod.GET)
	public String adminRecipeList(RecipeVO vo, Model model) {
		System.out.println("Controller.adminRecipeList();");
		List<RecipeVO> list = recipeService.adminRecipeList(vo);
		model.addAttribute("list", list);
		return "/adminPage/listRecipe.jsp";
	}

	// 고객용 레시피 목록
	@RequestMapping(value = "/recipeList.go", method = RequestMethod.GET)
	public String recipeList(RecipeVO vo, Model model) {
		System.out.println("Controller.recipeList();");
		List<RecipeVO> list = recipeService.recipeList(vo);
		model.addAttribute("list", list);
		return "/life/recipeList.jsp";
	}

	// 관리자 레시피 수정
	@RequestMapping(value = "/modifyRecipe.go", method = RequestMethod.POST)
	public String modifyRecipe(@ModelAttribute("recipe") RecipeVO vo, HttpServletRequest request) {
		System.out.println("Controller_modifyRecipe");
		
		HttpSession session = request.getSession();
		String fileSaveFolder = session.getServletContext().getRealPath("/RecipeUpload/");
		
		MultipartFile uploadImage01 = vo.getFile01();
		MultipartFile uploadImage02 = vo.getFile02();
		MultipartFile uploadImage03 = vo.getFile03();

		if (!uploadImage01.isEmpty()) {
			String fileName = uploadImage01.getOriginalFilename();
			try {
				uploadImage01.transferTo(new File(fileSaveFolder + fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setRecipe_image01(fileName);
		}
		if (!uploadImage02.isEmpty()) {
			String fileName = uploadImage02.getOriginalFilename();
			try {
				uploadImage02.transferTo(new File(fileSaveFolder + fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setRecipe_image02(fileName);
		}
		if (!uploadImage03.isEmpty()) {
			String fileName = uploadImage03.getOriginalFilename();
			try {
				uploadImage03.transferTo(new File(fileSaveFolder + fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setRecipe_image03(fileName);
		}
		 
		recipeService.modifyRecipe(vo);
		return "redirect:adminRecipeList.go";
	}
	// 관리자 레시피 삭제
	@RequestMapping(value = "/deleteRecipe.go", method = RequestMethod.GET)
	public String deleteRecipe(@ModelAttribute("recipe") RecipeVO vo) {
		System.out.println("Controller_deleteRecipe");
		recipeService.deleteRecipe(vo);
		return "redirect:adminRecipeList.go";
	}

	// 관리자 레시피 상세페이지
	@RequestMapping("/adminRecipeDetail.go")
	public String adminRecipeDetail(RecipeVO vo, Model model) {
		System.out.println("Controller_adminRecipeDetail");
		RecipeVO recipe = recipeService.adminRecipeDetail(vo);
		model.addAttribute("recipe", recipe);
		return "/adminPage/detailRecipe.jsp";
	}

	// 고객용 레시피 상세페이지
	@RequestMapping("/recipeDetail.go")
	public String recipeDetail(RecipeVO vo, Model model) {
		System.out.println("Controller_recipeDetail");
		RecipeVO recipe = recipeService.recipeDetail(vo);
		model.addAttribute("recipe", recipe);
		return "/life/recipeDetail.jsp";
	}
}
