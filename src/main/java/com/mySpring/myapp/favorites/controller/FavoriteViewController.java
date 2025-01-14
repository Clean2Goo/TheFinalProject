package com.mySpring.myapp.favorites.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FavoriteViewController {

    @GetMapping("/favorites.do")
    public ModelAndView showFavoritesPage() {
        return new ModelAndView("favorites"); // favorites.jsp 반환
    }
}
