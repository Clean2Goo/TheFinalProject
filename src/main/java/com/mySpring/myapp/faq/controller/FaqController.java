package com.mySpring.myapp.faq.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.mySpring.myapp.faq.service.FaqService;
import com.mySpring.myapp.faq.vo.FaqVO;
import com.mySpring.myapp.member.vo.MemberVO;




	@Controller("FaqController")
	@RequestMapping("/faq")

	public class FaqController {

		    @Autowired
		    private FaqService faqService;

		    // 고객-자주묻는질문 목록
		    @RequestMapping(value = "/listFaqs.do", method = {RequestMethod.GET, RequestMethod.POST})
		    public ModelAndView listFaqs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		    	String viewName = (String) request.getAttribute("viewName");
		        System.out.println("View Name: " + viewName); // 디버깅 로그 추가
		        ModelAndView mav = new ModelAndView(viewName);
		        mav.addObject("faqList", faqService.listFaqs());
		        return mav;
		    }

		    // 고객-자주묻는질문 상세 보기
		    @RequestMapping(value = "/viewFaq.do", method = RequestMethod.GET)
		    public ModelAndView viewFaq(@RequestParam("faqNo") int faqNo, HttpServletRequest request,
		                                   HttpServletResponse response) throws Exception {
		        String viewName = (String) request.getAttribute("viewName");
		        ModelAndView mav = new ModelAndView(viewName);
		        mav.addObject("faq", faqService.viewFaq(faqNo));
		        return mav;
		    }       

	
		    
		 // 어드민-faq 목록
		    @RequestMapping(value = "/adminListFaqs.do", method = {RequestMethod.GET, RequestMethod.POST})
		    public ModelAndView adminListFaqs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		    	String viewName = (String) request.getAttribute("viewName");
		    	System.out.println("View Name: " + viewName); // 디버깅 로그 추가
		    	ModelAndView mav = new ModelAndView(viewName);
		    	mav.addObject("faqList", faqService.listFaqs());
		    	return mav;
		    }

		    // 어드민-faq 작성 화면
		    @RequestMapping(value = "/adminWriteFaqForm.do", method = RequestMethod.GET)
		    public ModelAndView adminWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		        String viewName = (String) request.getAttribute("viewName");
		        ModelAndView mav = new ModelAndView(viewName);
		        return mav;
		    }

		    // 어드민-faq 작성
		    @RequestMapping(value = "/addNewFaq.do", method = RequestMethod.POST)
		    public ModelAndView addNotice(@RequestParam Map<String, Object> faqMap, HttpServletRequest request) throws Exception {
		        HttpSession session = request.getSession();
		        MemberVO memberVO = (MemberVO) session.getAttribute("member");

		        // 작성자 ID 추가 및 관리자 권한 확인
		        if (memberVO == null || !"systemOperator".equalsIgnoreCase(memberVO.getUserType())) {
		            ModelAndView mav = new ModelAndView("redirect:/faq/adminListFaqs.do");
		            mav.addObject("errorMessage", "관리자 권한이 필요합니다.");
		            return mav;
		        }

		        String id = memberVO.getId();
		        faqMap.put("id", id);

		        try {
		            faqService.addNewFaq(faqMap);
		        } catch (Exception e) {
		            e.printStackTrace();
		            ModelAndView mav = new ModelAndView("redirect:/faq/adminListFaqs.do");
		            mav.addObject("errorMessage", "FAQ 등록 중 오류가 발생했습니다.");
		            return mav;
		        }

		        // 등록 후 faq 목록으로 리다이렉트
		        return new ModelAndView("redirect:/faq/adminListFaqs.do");
		    }

		    // 어드민-faq 상세 보기
		    @RequestMapping(value = "/adminViewfaq.do", method = RequestMethod.GET)
		    public ModelAndView adminViewFaq(@RequestParam("faqNo") int faqNo, HttpServletRequest request,
		                                   HttpServletResponse response) throws Exception {
		        String viewName = (String) request.getAttribute("viewName");
		        ModelAndView mav = new ModelAndView(viewName);
		        mav.addObject("faq", faqService.viewFaq(faqNo));
		        return mav;
		    }


		    // 어드민-faq 삭제
		    @RequestMapping(value = "/adminDeleteFaq.do", method = RequestMethod.POST)
		    public ModelAndView adminDeleteFaq(@RequestParam("faqNo") int faqNo) throws Exception {
		        try {
		            faqService.removeFaq(faqNo);
		        } catch (Exception e) {
		            e.printStackTrace();
		            ModelAndView mav = new ModelAndView("redirect:/faq/adminListFaqs.do");
		            mav.addObject("errorMessage", "faq 삭제 중 오류가 발생했습니다.");
		            return mav;
		        }
		        System.out.println("어드민 faq 삭제");
		        return new ModelAndView("redirect:/faq/adminListFaqs.do");
		    }
	
	
	}



