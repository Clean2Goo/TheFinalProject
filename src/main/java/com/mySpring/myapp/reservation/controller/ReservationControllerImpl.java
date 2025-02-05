package com.mySpring.myapp.reservation.controller;

import com.mySpring.myapp.carwash.model.CarWash;
import com.mySpring.myapp.carwash.service.CarWashService;
import com.mySpring.myapp.member.service.MemberService;
import com.mySpring.myapp.member.vo.MemberVO;
import com.mySpring.myapp.reservation.service.ReservationService;
import com.mySpring.myapp.reservation.vo.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller("reservationController")
public class ReservationControllerImpl implements ReservationController {
	@Autowired
	private MemberService memberService;
	
    @Autowired
    private ReservationService reservationService;

    @Autowired
    private CarWashService carWashService;
    
	//로그인한 사용자 아이디에 따른 예약내역 조회
	@Override
	@RequestMapping(value = "/myPage/listReservations.do", method = RequestMethod.GET)
	public ModelAndView listReservations(HttpServletRequest request, HttpServletResponse response) throws Exception {

	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");

	    System.out.println("로그인한 사용자 ID: " + userId);

	    List<ReservationVO> reservations = reservationService.listReservations(userId);
	    
	    Date currentDate = new Date(); // 현재 시간
	    System.out.println("currentDate :" + currentDate);
	    
	    // 날짜 포맷 정의
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일HH:mm"); // 포맷에 맞춰 정의
	    
	 // 예약 상태 업데이트
	    for (ReservationVO reservation : reservations) {
	    	// 예약 상태가 "예약중"인 경우에만 처리
	        if ("예약중".equals(reservation.getStatus())) {
	            String rsvnDateTime = reservation.getfmtRsvnDate() + reservation.getRsvnTime(); // 세차날짜 + 세차시간
	            System.out.println("rsvnDateTime :" + rsvnDateTime);

	            try {
	                // 문자열을 Date로 변환
	                Date reservationDateTime = dateFormat.parse(rsvnDateTime);
	                // 1시간 후의 예약 시간 계산
	                Date oneHourLater = new Date(reservationDateTime.getTime() + 3600000); // 1시간 = 3600000 milliseconds

	                // 현재 시간이 예약 시간 + 1시간 이후인지 확인
	                if (currentDate.after(oneHourLater)) {
	                    // 상태를 "이용완료"로 변경
	                    reservationService.updateReservationStatusCompleted(reservation.getRsvnId(), "이용완료");
	                    System.out.println("예약 ID: " + reservation.getRsvnId() + "의 상태가 '이용완료'로 변경되었습니다.");
	                }
	            } catch (ParseException e) {
	                e.printStackTrace();
	                System.out.println("날짜 변환 오류: " + rsvnDateTime);
	            }
	        }
	    }
	    
	 // 상태 업데이트 후 다시 최신 예약 목록을 조회하여 보여줍니다.
	    reservations = reservationService.listReservations(userId); // 최신 데이터 조회
	    
	    ModelAndView mav = new ModelAndView("listReservations");
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
	//예약단계 1
	@RequestMapping(value = { "/carwash/reservationStep1.do"}, method = RequestMethod.POST)
	private ModelAndView reservationStep1(@RequestParam("washId") int washId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
	    
		CarWash CarWash = carWashService.selectCarWasheById(washId);
		
		ModelAndView mav = new ModelAndView();
		
	    if (memberVO != null) {
	        String viewName = (String) request.getAttribute("viewName");
	        System.out.println(viewName);
	        mav.setViewName(viewName);
	        mav.addObject("washId", washId);
	    } else {
	    	//rAttr.addAttribute("result","reservatinStep1"); 
	        mav.setViewName("redirect:/member/loginForm.do");
	    }
	    mav.addObject("carWashDetail", CarWash);
	    System.out.println("예약스텝1" + washId + " washName 추가받기");
		return mav;
		
		
	}

	 // 신규 기능 - 관리자용 예약 목록 조회
	@RequestMapping(value = "/admin/reservations.do", method = RequestMethod.GET)
	public ModelAndView listAdminReservations(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    HttpSession session = request.getSession();
	    MemberVO admin = (MemberVO) session.getAttribute("member");

	    if (admin == null) {
	        return new ModelAndView("redirect:/member/loginForm.do");
	    }

	    List<ReservationVO> adminReservations = reservationService.getReservationsByOwnerId(admin.getId());

	    ModelAndView mav = new ModelAndView("admin.reservations"); // 타일즈 이름과 일치시킴
	    mav.addObject("reservations", adminReservations);
	    return mav;
	}

	// ✅ 1. 올바른 URL 매핑으로 수정
	@RequestMapping(value = "/admin/updateStatus", method = RequestMethod.POST)
	@ResponseBody
	public String updateReservationStatus(@RequestParam("rsvnId") String rsvnId,
	                                      @RequestParam("status") String status) {
	    System.out.println("🔔 [요청 수신] rsvnId: " + rsvnId + ", status: " + status); // 디버깅 로그 추가
	    try {
	        reservationService.updateReservationStatus(rsvnId, status);
	        System.out.println("✅ [DB 업데이트 성공]");
	        return "success";
	    } catch (Exception e) {
	        System.out.println("❌ [DB 업데이트 실패]");
	        e.printStackTrace();
	        return "error";
	    }
	}





	
	
	@RequestMapping(value = "/carwash/reservationStep2.do", method = RequestMethod.POST)
	public ModelAndView reservationStep2(@RequestParam Map<String, String> params,
										HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(viewName);
	    mav.addAllObjects(params);
	    
	    ReservationVO reservation = new ReservationVO();
	    
	    reservation.setUserId(params.get("userId"));
	    reservation.setWashType(params.get("washType"));
	    reservation.setWashId(params.get("washId"));
	    reservation.setRsvnTime(params.get("rsvnTime"));
	    // 예약 날짜 설정
	    Date rsvnDate = new SimpleDateFormat("yyyy-MM-dd").parse(params.get("rsvnDate"));
	    reservation.setRsvnDate(rsvnDate);
	    // 예약 날짜를 원하는 형식으로 출력
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    
	    reservation.setCarTypeCost(params.get("carTypeCost"));
	    reservation.setStatus(params.get("status"));
	    reservation.setCancelYn(params.get("cancelYn"));
	    
	    System.out.println("예약 getWashId: " + reservation.getWashId());
	    System.out.println("예약 getUserId: " + reservation.getUserId());
	    System.out.println("예약 포맷 getRsvnDate: " + dateFormat.format(reservation.getRsvnDate()));
	    System.out.println("예약 getRsvnTime: " + reservation.getRsvnTime());
	    System.out.println("예약 getCarTypeCost: " + reservation.getCarTypeCost());
	    System.out.println("예약 WashType: " + reservation.getWashType());
	    System.out.println("예약 CancelYn: " + reservation.getCancelYn());
	    
	    return mav;

	}

	
	
	
	@RequestMapping(value = { "/carwash/carWashReserve.do"}, method = RequestMethod.POST)
	private ModelAndView carWashReserve(@RequestParam Map<String, String> params,
										HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		
		ReservationVO reservation = new ReservationVO();
		
		reservation.setUserId(params.get("userId"));
	    reservation.setWashType(params.get("washType"));
	    reservation.setWashId(params.get("washId"));
	    reservation.setRsvnTime(params.get("rsvnTime"));
	    // 예약 날짜 설정
	    Date rsvnDate = new SimpleDateFormat("yyyy-MM-dd").parse(params.get("rsvnDate"));
	    reservation.setRsvnDate(rsvnDate);
	    // 예약 날짜를 원하는 형식으로 출력
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    
	    reservation.setCarTypeCost(params.get("carTypeCost"));
	    reservation.setStatus(params.get("status"));
	    reservation.setCancelYn(params.get("cancelYn"));
	    
	    System.out.println("예약 getWashId: " + reservation.getWashId());
	    System.out.println("예약 getUserId: " + reservation.getUserId());
	    System.out.println("예약 포맷 getRsvnDate: " + dateFormat.format(reservation.getRsvnDate()));
	    System.out.println("예약 getRsvnTime: " + reservation.getRsvnTime());
	    System.out.println("예약 getCarTypeCost: " + reservation.getCarTypeCost());
	    System.out.println("예약 WashType: " + reservation.getWashType());
	    System.out.println("예약 CancelYn: " + reservation.getCancelYn());

	 // 유효성 검사 및 콘솔 로그 출력
	    if (reservation.getUserId() == null || reservation.getUserId().isEmpty()) {
	        System.out.println("유저 ID는 null 또는 비어 있습니다.");
	    } else {
	        System.out.println("유저 ID: " + reservation.getUserId());
	    }

	    if (reservation.getWashType() == null || reservation.getWashType().isEmpty()) {
	        System.out.println("세차 유형은 null 또는 비어 있습니다.");
	    } else {
	        System.out.println("세차 유형: " + reservation.getWashType());
	    }

	    if (reservation.getWashId() == null || reservation.getWashId().isEmpty()) {
	        System.out.println("세차장 ID는 null 또는 비어 있습니다.");
	    } else {
	        System.out.println("세차장 ID: " + reservation.getWashId());
	    }
	    if (reservation.getRsvnTime() == null || reservation.getRsvnTime().isEmpty()) {
	        System.out.println("예약 시간은 null 또는 비어 있습니다.");
	    } else {
	        System.out.println("예약 시간: " + reservation.getRsvnTime());
	    }

	    if (reservation.getRsvnDate() == null ) {
	        System.out.println("예약 날짜는 null 또는 비어 있습니다.");
	    } else {
	        System.out.println("예약 날짜: " + reservation.getRsvnDate());
	    }

	    
	    
	    
	    // 예약 정보 저장
	    reservationService.saveReservation(reservation);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addAllObjects(params); //디버깅 용도
		 
		 
		return mav;
	}


}
