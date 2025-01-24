package com.mySpring.myapp.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mySpring.myapp.member.service.MemberService;
import com.mySpring.myapp.member.vo.MemberVO;

import com.mySpring.myapp.carwash.service.CarWashService;
import com.mySpring.myapp.carwash.model.CarWash;


@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;

	@Autowired
	private CarWashService carWashService;


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
		      System.out.println("되는군");
		      mav.setViewName("adminAfter");
	    } else {
	        rAttr.addAttribute("result", "loginFailed");
	        mav.setViewName("adminBefore");
	    }
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
	
	// 비밀번호 변경 페이지
	@RequestMapping(value = "/myPage/modPwd.do", method = RequestMethod.GET)
	public ModelAndView modPwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    HttpSession session = request.getSession();
	    MemberVO member = (MemberVO) session.getAttribute("member");

	    ModelAndView mav = new ModelAndView("myPage/modPwd");
	    mav.addObject("member", member);
	    return mav;
	}
	
	//페이지 이동
	@RequestMapping("/myPage/{menu}.do")
	public String myPageMenu(@PathVariable String menu, Model model) {
	    model.addAttribute("activeMenu", menu); // 현재 메뉴 이름 전달
	    return "myPageMenu"; // 공통 JSP 파일로 이동
	}

    // 프로필 이미지 업데이트 처리 메서드
    @RequestMapping("/updateProfileImage")
    public ModelAndView updateProfileImage(
            @RequestParam("profileImage") MultipartFile profileImage,
            @RequestParam("id") String id,
            HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 1. ServletContext 가져오기
        ServletContext context = request.getSession().getServletContext();  // 수정된 부분

        // 2. 파일을 저장할 실제 경로 가져오기
        String realPath = context.getRealPath("/resources/assets/images/");

        // 3. 이미지 디렉토리가 없으면 생성
        File uploadDir = new File(realPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // 4. 파일이 존재하면 저장
        if (!profileImage.isEmpty()) {
            // 업로드된 파일의 파일명
            String fileName = profileImage.getOriginalFilename();

            // 파일을 저장할 경로
            File file = new File(uploadDir, fileName);

            // 파일 저장
            profileImage.transferTo(file);

            // MemberVO 객체에 이미지 파일 경로 저장
            MemberVO member = new MemberVO();
            member.setId(id);
            member.setImg("/resources/assets/images/" + fileName);

            // DB에 이미지 경로 업데이트
            memberService.updateMemberProfileImage(member);
        }

        // 프로필 이미지 업데이트 성공 메시지와 함께 myPage로 리다이렉트
        ModelAndView modelAndView = new ModelAndView("redirect:/myPage");
        return modelAndView;
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



}
