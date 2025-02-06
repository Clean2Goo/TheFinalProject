package com.mySpring.myapp;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller("AboutController")
@RequestMapping("/about")

public class AboutController {

	//aboutPage
//	  @GetMapping
//	    public String viewAboutPage() {
//		 return "about";
//	  }
//	    @GetMapping("")
//	    public String about() {
//	        return "/about.do"; // tiles_about.xml에 정의된 about 적용
//	    }
//
//	    @GetMapping("/ceo")
//	    public String ceo() {
//	        return "/about/ceo.do"; // tiles_about.xml에 정의된 ceo 적용
//	    }
//
//	    @GetMapping("/history")
//	    public String history() {
//	        return "/about/history.do"; // tiles_about.xml에 정의된 history 적용
//	    }
	  
	    // 회사소개페이지
	    @RequestMapping(value = "/info.do", method = {RequestMethod.GET, RequestMethod.POST})
	    public ModelAndView about(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        String viewName = (String) request.getAttribute("viewName");
	        System.out.println("View Name: " + viewName); // 디버깅 로그 추가
	        ModelAndView mav = new ModelAndView(viewName);
	        return mav;
	    }
   
	    // ceo인사말페이지
	    @RequestMapping(value = "/ceo.do", method = {RequestMethod.GET, RequestMethod.POST})
	    public ModelAndView ceo(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        String viewName = (String) request.getAttribute("viewName");
	        System.out.println("View Name: " + viewName); // 디버깅 로그 추가
	        ModelAndView mav = new ModelAndView(viewName);
	        return mav;
	    }
	    
	    // 회사연페이지
	    @RequestMapping(value = "/history.do", method = {RequestMethod.GET, RequestMethod.POST})
	    public ModelAndView history(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        String viewName = (String) request.getAttribute("viewName");
	        System.out.println("View Name: " + viewName); // 디버깅 로그 추가
	        ModelAndView mav = new ModelAndView(viewName);
	        return mav;
	    }
}
