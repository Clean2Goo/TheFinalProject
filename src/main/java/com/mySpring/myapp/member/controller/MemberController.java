package com.mySpring.myapp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.myapp.member.vo.MemberVO;

public interface MemberController {
    public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView adminListMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView adminAddMember(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView adminLoginForm(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;

    public ModelAndView adminLogout(HttpServletRequest request, HttpServletResponse response) throws Exception;

    

    // **생년월일, 이메일, 휴대전화 정보 수정 추가**
    ResponseEntity<?> updateMemberInfo(String field, String value, HttpSession session);
}
