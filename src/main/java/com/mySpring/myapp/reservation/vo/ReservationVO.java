package com.mySpring.myapp.reservation.vo;

import java.util.Date;

public class ReservationVO {
    private String rsvnId;         // 예약 ID
    private String userId;         // 사용자 ID
    private String washType;       // 세차 타입
    private String washId;         // 세차장 ID
    private String staffId;        // 직원 ID (선택적)
    private String requestId;      // 출장요청 ID (선택적)
    private Date rsvnDate;         // 예약 날짜
    private String rsvnTime;       // 예약 시간
    private String carTypeCost;    // 차량 타입 + 가격
    private String status;          // 예약 상태 - 예약중/ 이용완료/ 예약취소
    private String cancelYn;       // 취소 여부
    private Date crtDate;          // 생성 날짜

	private String userName; // 전문가 직원이름
	private String washName; // 카워시 세차장명


    private String fmtRsvnDate; // 포맷된 세차일시 추가


    public String getRsvnId() {
        return rsvnId;
    }

    public void setRsvnId(String rsvnId) {
        this.rsvnId = rsvnId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getWashType() {
        return washType;
    }

    public void setWashType(String washType) {
        this.washType = washType;
    }

    public String getWashId() {
        return washId;
    }

    public void setWashId(String washId) {
        this.washId = washId;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public Date getRsvnDate() {
        return rsvnDate;
    }

    public void setRsvnDate(Date rsvnDate) {
        this.rsvnDate = rsvnDate;
    }

    public String getRsvnTime() {
        return rsvnTime;
    }

    public void setRsvnTime(String rsvnTime) {
        this.rsvnTime = rsvnTime;
    }

    public String getCarTypeCost() {
        return carTypeCost;
    }

    public void setCarTypeCost(String carTypeCost) {
        this.carTypeCost = carTypeCost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCancelYn() {
        return cancelYn;
    }

    public void setCancelYn(String cancelYn) {
        this.cancelYn = cancelYn;
    }

    public Date getCrtDate() {
        return crtDate;
    }

    public void setCrtDate(Date crtDate) {
        this.crtDate = crtDate;
    }

	public String getUserName() {
        return userName;
    }

    public void setUserhName(String userName) {
        this.userName = userName;
    }

	public String getWashName() {
        return washName;
    }

    public void setWashName(String washName) {
        this.washName = washName;
    }

    public String getfmtRsvnDate() {
        return fmtRsvnDate;
    }

    public void setfmtRsvnDate(String fmtRsvnDate) {
        this.fmtRsvnDate = fmtRsvnDate;
    }

}
