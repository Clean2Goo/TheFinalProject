package com.mySpring.myapp.reservation.controller;

import com.mySpring.myapp.reservation.vo.ReservationVO;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ReservationController {

	ModelAndView listReservations(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView cancelReservation(String rsvnId, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
}
