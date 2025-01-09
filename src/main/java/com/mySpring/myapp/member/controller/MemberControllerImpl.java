package com.mySpring.myapp.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.myapp.member.service.MemberService;
import com.mySpring.myapp.member.vo.MemberVO;

@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;

	// 어드민 메인
	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
    public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
        ModelAndView mav = new ModelAndView();
        if (isLogOn != null && isLogOn) {
        	 // 로그인정보 가져오기
            MemberVO member = (MemberVO) session.getAttribute("member");
            mav.addObject("member", member); 
            
            mav.setViewName("adminAfter");
        } else {
            mav.setViewName("adminBefore");
        }
        return mav;
    }
	// 어드민 로그인
	@Override
	@RequestMapping(value = "/member/adminLoginForm.do", method = RequestMethod.POST)
	public ModelAndView adminLoginForm(@ModelAttribute("member") MemberVO member,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
		
		if (memberVO != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("member", memberVO);
	        session.setAttribute("isLogOn", true);
	        
		      mav.addObject("member", memberVO);
		      System.out.println("될꺼냐");
		      mav.setViewName("adminAfter");
	    } else {
	        rAttr.addAttribute("result", "loginFailed");
	        mav.setViewName("adminBefore");
	    }
//		if(memberVO != null) {
//		    HttpSession session = request.getSession();
//		    session.setAttribute("member", memberVO);
//		    session.setAttribute("isLogOn", true);
//		    String action = (String)session.getAttribute("action");
//		    session.removeAttribute("action");
//		    if(action!= null) {
//		       mav.setViewName("redirect:"+action);
//		       System.out.println("액션없음");
//		    }else {
//		      List membersList = memberService.listMembers();
//		      mav.addObject("membersList", membersList);
//		      System.out.println(" 어드민 로그인하면서 멤버정보가져와");
//		      System.out.println(membersList);
//		      
//		       mav.setViewName("adminAfter");
//		       System.out.println(" 어드민 로그인되서 adminAfter");
//		    }
//		}else {
//		   rAttr.addAttribute("result","loginFailed");
//		   System.out.println("어드민 로그인 실패로 adminBefore");
//		   mav.setViewName("adminBefore");
//		}
		return mav;
	}
	
	// 어드민 로그아웃
	@Override
	@RequestMapping(value = "/member/adminLogout.do", method =  RequestMethod.GET)
	public ModelAndView adminLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		System.out.println(" 어드민 로그아웃으로 다시 어드민 로그인전 화면 간다");
		mav.setViewName("redirect:/admin.do");
		return mav;
	}
	
	// 어드민 가입
		@Override
		@RequestMapping(value="/member/adminAddMember.do" ,method = RequestMethod.POST)
		public ModelAndView adminAddMember(@ModelAttribute("member") MemberVO member,
				                  HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			int result = 0;
			result = memberService.addMember(member);
			//가입 후 로그인 화면으로 이동
			ModelAndView mav = new ModelAndView("redirect:/admin.do");
			System.out.println("어드민 가입했다");
			return mav;
		}
	
	//어드민 회원목록
	@Override
	@RequestMapping(value="/member/adminListMembers.do" ,method = RequestMethod.GET)
	public ModelAndView adminListMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println("listviewName: " + viewName);
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}
	
	//어드민 회원 삭제
	@Override
	@RequestMapping(value="/member/removeMember.do" ,method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id,
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
//		String user_id = request.getParameter("id");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/adminListMembers.do");
		return mav;
	}
	
	
	
	// 고객 메인
	@RequestMapping(value = { "/","/main.do"}, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	// 고객 마이페이지
	@RequestMapping(value =  "/member/myPage.do", method = RequestMethod.GET)
	private ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
	    MemberVO member = (MemberVO) session.getAttribute("member");

		ModelAndView mav = new ModelAndView("myPage");
		mav.addObject("member", member);
		return mav;
	}
	
	// !고객은 회원목록 조회 불가능
//	@Override
//	@RequestMapping(value="/member/listMembers.do" ,method = RequestMethod.GET)
//	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String viewName = (String)request.getAttribute("viewName");
//		System.out.println("listviewName: " + viewName);
//		List membersList = memberService.listMembers();
//		ModelAndView mav = new ModelAndView(viewName);
//		mav.addObject("membersList", membersList);
//		return mav;
//	}

	// 고객 가입
	@Override
	@RequestMapping(value="/member/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.addMember(member);
		//가입 후 로그인 화면으로 이동
		ModelAndView mav = new ModelAndView("redirect:/member/loginForm.do");
		System.out.println("고객 가입했다");
		return mav;
	}
	
	
	/*
	@RequestMapping(value = { "/member/loginForm.do", "/member/memberForm.do" }, method =  RequestMethod.GET)
	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	*/
	
	// 고객 로그인
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	memberVO = memberService.login(member);
	if(memberVO != null) {
	    HttpSession session = request.getSession();
	    session.setAttribute("member", memberVO);
	    session.setAttribute("isLogOn", true);
	    //mav.setViewName("redirect:/member/listMembers.do");
	    String action = (String)session.getAttribute("action");
	    session.removeAttribute("action");
	    if(action!= null) {
	       mav.setViewName("redirect:"+action);
	    }else {
	       mav.setViewName("redirect:/main.do");
	    }

	}else {
	   rAttr.addAttribute("result","loginFailed");
	   mav.setViewName("redirect:/member/loginForm.do");
	}
	return mav;
	}

	// 고객 로그아웃
	@Override
	@RequestMapping(value = "/member/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}

	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
							  @RequestParam(value= "action", required=false) String action,
						       HttpServletRequest request,
						       HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}


	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}
	


}
