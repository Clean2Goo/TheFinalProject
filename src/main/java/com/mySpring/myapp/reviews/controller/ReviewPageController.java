package com.mySpring.myapp.reviews.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewPageController {

    @GetMapping("/myReviews.do")
    public String myReviewsPage() {
        return "myreviews/myReviews";
    }
}
