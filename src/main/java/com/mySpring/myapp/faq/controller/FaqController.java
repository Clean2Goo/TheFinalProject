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

    // 고객 - 자주 묻는 질문 목록
    @RequestMapping(value = "/listFaqs.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView listFaqs(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("listFaqs 요청 수신");
        
        String viewName = (String) request.getAttribute("viewName");
        System.out.println("View Name: " + viewName);

        ModelAndView mav = new ModelAndView(viewName);
        mav.addObject("faqList", faqService.listFaqs());

        System.out.println("FAQ 목록 조회 완료");
        return mav;
    }

    // 고객 - 자주 묻는 질문 상세 보기
    @RequestMapping(value = "/viewFaq.do", method = RequestMethod.GET)
    public ModelAndView viewFaq(@RequestParam("faqNo") int faqNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("viewFaq 요청 수신 - faqNo: " + faqNo);

        String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView(viewName);
        mav.addObject("faq", faqService.viewFaq(faqNo));

        System.out.println("FAQ 상세 보기 완료 - faqNo: " + faqNo);
        return mav;
    }

    // 일반 유저 - 질문 등록 화면
    @RequestMapping(value = "/userQuestionForm.do", method = RequestMethod.GET)
    public ModelAndView userQuestionForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("userQuestionForm 요청 수신");

        String viewName = (String) request.getAttribute("viewName");
        return new ModelAndView(viewName);
    }

 // 일반 유저 - 질문 등록 처리
    @RequestMapping(value = "/addUserQuestion.do", method = RequestMethod.POST)
    public ModelAndView addUserQuestion(@RequestParam("title") String title, @RequestParam("question") String question, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO) session.getAttribute("member");

        if (memberVO == null) {
            return new ModelAndView("redirect:/member/loginForm.do");
        }

        FaqVO faqVO = new FaqVO();
        faqVO.setUserId(memberVO.getId());
        faqVO.setTitle(title);  // 제목 추가
        faqVO.setQuestion(question);
        faqVO.setAnswer("답변 대기 중");

        try {
        	Map<String, Object> faqMap = faqVO.toMap();
        	faqMap.put("title", title);
        	faqService.addNewFaq(faqMap);

        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView mav = new ModelAndView("redirect:/faq/listFaqs.do");
            mav.addObject("errorMessage", "질문 등록 중 오류가 발생했습니다.");
            return mav;
        }

        return new ModelAndView("redirect:/faq/listFaqs.do");
    }
    
 // 본인 질문 삭제 처리
    @RequestMapping(value = "/deleteFaq.do", method = RequestMethod.POST)
    public ModelAndView deleteFaq(@RequestParam("faqNo") int faqNo, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO) session.getAttribute("member");

        if (memberVO == null) {
            return new ModelAndView("redirect:/member/loginForm.do").addObject("errorMessage", "로그인이 필요합니다.");
        }

        try {
            boolean isDeleted = faqService.deleteFaq(faqNo, memberVO.getId());
            if (isDeleted) {
                return new ModelAndView("redirect:/faq/listFaqs.do").addObject("successMessage", "질문이 삭제되었습니다.");
            } else {
                return new ModelAndView("redirect:/faq/listFaqs.do").addObject("errorMessage", "삭제 권한이 없습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("redirect:/faq/listFaqs.do").addObject("errorMessage", "삭제 중 오류가 발생했습니다.");
        }
    }


    // 어드민 - FAQ 목록
    @RequestMapping(value = "/adminListFaqs.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView adminListFaqs(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("adminListFaqs 요청 수신");

        String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView(viewName);
        mav.addObject("faqList", faqService.listFaqs());

        System.out.println("어드민 FAQ 목록 조회 완료");
        return mav;
    }

 // 어드민 - 질문 등록 화면
    @RequestMapping(value = "/adminQuestionForm.do", method = RequestMethod.GET)
    public ModelAndView adminQuestionForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("adminQuestionForm 요청 수신");

        String viewName = (String) request.getAttribute("viewName");
        return new ModelAndView(viewName);
    }
    
    // 어드민 - FAQ 작성 화면
    @RequestMapping(value = "/adminWriteFaqForm.do", method = RequestMethod.GET)
    public ModelAndView adminWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("adminWriteForm 요청 수신");

        String viewName = (String) request.getAttribute("viewName");
        return new ModelAndView(viewName);
    }

 // 어드민 - 답변 작성
    @RequestMapping(value = "/addAnswer.do", method = RequestMethod.POST)
    public ModelAndView addAnswer(@RequestParam("faqNo") int faqNo, @RequestParam("answer") String answer, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO) session.getAttribute("member");

        if (memberVO == null || !"systemOperator".equals(memberVO.getUserType())) {
            return new ModelAndView("redirect:/faq/listFaqs.do").addObject("errorMessage", "답변 권한이 없습니다.");
        }

        try {
            FaqVO faq = faqService.viewFaq(faqNo);
            faq.setAnswer(answer);
            faqService.modFaq(faq.toMap());
            System.out.println("답변 등록 성공 - faqNo: " + faqNo);
        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("redirect:/faq/listFaqs.do").addObject("errorMessage", "답변 등록 중 오류가 발생했습니다.");
        }

        return new ModelAndView("redirect:/faq/listFaqs.do").addObject("successMessage", "답변이 성공적으로 등록되었습니다.");
    }



    // 어드민 - FAQ 상세 보기
    @RequestMapping(value = "/adminViewfaq.do", method = RequestMethod.GET)
    public ModelAndView adminViewFaq(@RequestParam("faqNo") int faqNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("adminViewFaq 요청 수신 - faqNo: " + faqNo);

        String viewName = (String) request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView(viewName);
        mav.addObject("faq", faqService.viewFaq(faqNo));

        System.out.println("어드민 FAQ 상세 보기 완료 - faqNo: " + faqNo);
        return mav;
    }

    // 어드민 - FAQ 삭제
    @RequestMapping(value = "/adminDeleteFaq.do", method = RequestMethod.POST)
    public ModelAndView adminDeleteFaq(@RequestParam("faqNo") int faqNo) throws Exception {
        System.out.println("adminDeleteFaq 요청 수신 - faqNo: " + faqNo);

        try {
            faqService.removeFaq(faqNo);
            System.out.println("FAQ 삭제 성공 - faqNo: " + faqNo);
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView mav = new ModelAndView("redirect:/faq/adminListFaqs.do");
            mav.addObject("errorMessage", "FAQ 삭제 중 오류가 발생했습니다.");
            return mav;
        }

        return new ModelAndView("redirect:/faq/adminListFaqs.do");
    }
}
