package com.mySpring.myapp.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.myapp.member.service.MemberService;
import com.mySpring.myapp.member.vo.MemberVO;

import com.mySpring.myapp.carwash.service.CarWashService;
import com.mySpring.myapp.carwash.model.CarWash;

import com.mySpring.myapp.board.service.BoardService;
import com.mySpring.myapp.board.vo.ArticleVO;
import com.mySpring.myapp.board.vo.ImageVO;

import com.mySpring.myapp.notice.service.NoticeService;
import com.mySpring.myapp.notice.vo.NoticeVO;

import com.mySpring.myapp.faq.service.FaqService;
import com.mySpring.myapp.faq.vo.FaqVO;

@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;

	@Autowired
	private CarWashService carWashService;

	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;

	@Autowired
    private NoticeService noticeService;

	@Autowired
    private FaqService faqService;

	// 어드민 메인
	@RequestMapping(value = "/admin.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(false); // false를 주어 세션이 없을 경우 null 반환
        ModelAndView mav = new ModelAndView();

        List articlesList = boardService.listArticles();
        mav.addObject("articlesList", articlesList);
        System.out.println("어드민 메인 이벤트리스트 로드");

        List noticesList = noticeService.listNotices();
        mav.addObject("noticesList", noticeService.listNotices());
        System.out.println("어드민 메인 공지사항리스트 로드");

        List faqList = faqService.listFaqs();
		mav.addObject("faqList", faqService.listFaqs());
        System.out.println("어드민 메인 faq리스트 로드");

		if(session != null){
			Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
			MemberVO member = (MemberVO) session.getAttribute("member");

			if (isLogOn != null && isLogOn && member != null) {

				mav.addObject("member", member);
				mav.addObject("isLogOn", true);


				mav.setViewName("adminAfter");
				System.out.println("/admin.do  로그인 후 adminAfter");
			} else {
				mav.setViewName("adminBefore");
				System.out.println("/admin.do  로그인 전 adminBefore");
			}
		}else {
			mav.setViewName("adminBefore");
			System.out.println("세션이 없으므로 어드민 로그인화면으로 설정");
		}

        return mav;
    }

	// 어드민 로그인
	@RequestMapping(value = "/member/adminLoginForm.do", method = RequestMethod.POST)
	public ModelAndView adminLoginForm(@ModelAttribute("member") MemberVO member,
	                                   RedirectAttributes rAttr,
	                                   HttpServletRequest request,
	                                   HttpServletResponse response) throws Exception {
	    ModelAndView mav = new ModelAndView();

	    memberVO = memberService.login(member);

	    if (memberVO != null) {

	        HttpSession oldSession = request.getSession(false);
	        if (oldSession != null) {
	            oldSession.invalidate();
	        }


	        HttpSession session = request.getSession(true);
	        session.setAttribute("member", memberVO);
	        session.setAttribute("isLogOn", true);
	        session.setAttribute("userId", memberVO.getId()); // userId 저장

			List articlesList = boardService.listArticles();
			mav.addObject("articlesList", articlesList);
			System.out.println("로그인하자마자 이벤트리스트 더해");

			List noticesList = noticeService.listNotices();
			mav.addObject("noticesList", noticeService.listNotices());
			System.out.println("로그인하자마자 공지사항리스트 더해");

			List faqList = faqService.listFaqs();
			mav.addObject("faqList", faqService.listFaqs());
			System.out.println("로그인하자마자 faq리스트 더해");

	        mav.addObject("member", memberVO);
	        mav.setViewName("adminAfter");
	    } else {
	        rAttr.addAttribute("result", "loginFailed");
	        mav.setViewName("adminBefore");
	    }
	    return mav;
	}


	// 어드민 로그아웃
	@RequestMapping(value = "/member/adminLogout.do", method = RequestMethod.GET)
	public ModelAndView adminLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		session.removeAttribute("userId"); // userId 제거
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
	@RequestMapping(value = {"/main.do", "/",}, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println("/main.do");
		ModelAndView mav = new ModelAndView();
		//beaver 강남구 특정 조건 리스트
		List<CarWash> carWashesListInGangnam = carWashService.selectCarWashesInGangnam();
		mav.addObject("carWashesListInGangnam",carWashesListInGangnam);
		mav.setViewName(viewName);
		return mav;
	}

	// 고객 마이페이지
	@RequestMapping(value =  "/myPage/myInfo.do", method = RequestMethod.GET)
	private ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
	    MemberVO member = (MemberVO) session.getAttribute("member");

		ModelAndView mav = new ModelAndView("myInfo");
		mav.addObject("member", member);
		mav.addObject("activeMenu", "myInfo");
		return mav;
	}

	//비밀번호 변경
	@PostMapping("/member/updatePassword")
	public ResponseEntity<Map<String, Object>> updatePassword(
	        @RequestBody Map<String, String> passwordMap, HttpSession session) {
	    String currentPassword = passwordMap.get("currentPassword");
	    String newPassword = passwordMap.get("newPassword");
	    String id = (String) session.getAttribute("userId");

	    Map<String, Object> response = new HashMap<>();

	    if (id == null) {
	        response.put("success", false);
	        response.put("message", "로그인이 필요합니다.");
	        return ResponseEntity.status(403).body(response);
	    }

	    boolean success = memberService.updatePassword(id, currentPassword, newPassword);
	    if (success) {
	        response.put("success", true);
	        response.put("message", "비밀번호가 성공적으로 변경되었습니다.");
	        return ResponseEntity.ok(response);
	    } else {
	        response.put("success", false);
	        response.put("message", "현재 비밀번호가 일치하지 않습니다.");
	        return ResponseEntity.status(400).body(response);
	    }
	}

	@RequestMapping(value =  "/myPage/benefit.do", method = RequestMethod.GET)
	private ModelAndView benefit(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
	    MemberVO member = (MemberVO) session.getAttribute("member");

		ModelAndView mav = new ModelAndView("benefit");
		mav.addObject("member", member);
		mav.addObject("activeMenu", "benefit");
		return mav;
	}

	//페이지 이동
	@RequestMapping("/myPage/{menu}.do")
	public String myPageMenu(@PathVariable String menu, Model model) {
	    model.addAttribute("activeMenu", menu); // 현재 메뉴 이름 전달
	    return "myPageMenu"; // 공통 JSP 파일로 이동
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
        session.setAttribute("userId", memberVO.getId()); // userId 저장
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
    @RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        session.removeAttribute("member");
        session.removeAttribute("isLogOn");
        session.removeAttribute("userId"); // userId 제거
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


    @PostMapping("/member/updateMemberInfo")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateMemberInfo(
            @RequestParam("field") String field,
            @RequestParam("value") String value,
            HttpSession session) {

        Map<String, Object> response = new HashMap<>();
        String userId = (String) session.getAttribute("userId");

        if (userId == null) {
            response.put("success", false);
            response.put("message", "로그인이 필요합니다.");
            return ResponseEntity.status(403).body(response);
        }

        try {
            memberService.updateMemberInfo(userId, field, value);
            response.put("success", true);
            response.put("message", "정보가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "수정 실패: " + e.getMessage());
        }

        return ResponseEntity.ok(response);
    }




}