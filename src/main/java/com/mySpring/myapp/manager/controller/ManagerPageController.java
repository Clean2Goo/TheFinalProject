package com.mySpring.myapp.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerPageController {

    // Manager JSP 페이지 렌더링
    @GetMapping("/manager.do")
    public ModelAndView showManagerPage() {
        return new ModelAndView("manager"); // Tiles 또는 ViewResolver 설정에 따라 처리
    }
}
