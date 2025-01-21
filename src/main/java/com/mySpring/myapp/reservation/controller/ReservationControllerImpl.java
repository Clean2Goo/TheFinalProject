package com.mySpring.myapp.reservation.controller;

import com.mySpring.myapp.reservation.service.ReservationService;
import com.mySpring.myapp.reservation.vo.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller("reservationController")
public class ReservationControllerImpl implements ReservationController {

    @Autowired
    private ReservationService reservationService;


	//로그인한 사용자 아이디에 따른 예약내역 조회
	@Override
	@RequestMapping(value = "/myPage/listReservations.do", method = RequestMethod.GET)
	public ModelAndView listReservations(HttpServletRequest request, HttpServletResponse response) throws Exception {

	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");

	    System.out.println("로그인한 사용자 ID: " + userId);

	    List<ReservationVO> reservations = reservationService.listReservations(userId);
	    ModelAndView mav = new ModelAndView();
		mav.setViewName("listReservations");
	    mav.addObject("reservations", reservations);
		mav.addObject("activeMenu", "listreservations");
	    return mav;
	}

	//예약내역 취소
	@Override
    @RequestMapping(value="/myPage/cancelReservation.do", method=RequestMethod.POST)
    public ModelAndView cancelReservation(@RequestParam("rsvnId") String rsvnId,HttpServletRequest request,HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        reservationService.cancelReservation(rsvnId);
        System.out.println("예약취소!");
        return new ModelAndView("redirect:/myPage/listReservations.do");
    }



	//beaver 예약 단계별 화면 작업예정
	@RequestMapping(value = { "/carwash/reservStep1.do"}, method = RequestMethod.GET)
	private ModelAndView reservStep1(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value = { "/carwash/reservStep2.do"}, method = RequestMethod.GET)
	private ModelAndView reservStep2(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value = { "/carwash/reservStep3.do"}, method = RequestMethod.GET)
	private ModelAndView reservStep3(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}


}
