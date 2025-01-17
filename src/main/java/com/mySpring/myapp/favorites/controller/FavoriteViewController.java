package com.mySpring.myapp.favorites.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FavoriteViewController {

//    @GetMapping("/favorites.do")
//    public ModelAndView showFavoritesPage() {
//        return new ModelAndView("favorites"); // favorites.jsp 반환
//    }
    
    @RequestMapping(value = {"/favorites.do"}, method = RequestMethod.GET)
	private ModelAndView favorites(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("favorites");
		return mav;
	}
}
