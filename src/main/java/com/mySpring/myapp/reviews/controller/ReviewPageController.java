package com.mySpring.myapp.reviews.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewPageController {

    @GetMapping("/myReviews.do")
    public String myReviewsPage(Model model) {
        model.addAttribute("activeMenu", "myReviews");
    	return "myreviews/myReviews";  
    }

    @GetMapping("/admin/reviewManagement")
    public String reviewManagementPage() {
        return "admin.reviewManagement";  
    }
}
