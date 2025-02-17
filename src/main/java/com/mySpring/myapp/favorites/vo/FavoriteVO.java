package com.mySpring.myapp.favorites.vo;

import java.util.Date;

public class FavoriteVO {
    private String favId;   // 즐겨찾기 ID
    private String userId;  // 사용자 ID
    private String washId;  // 세차장 ID
    private Date crtDate;   // 생성 날짜

    // CARWASHES 테이블에서 추가로 가져올 데이터
    private String washName; // 세차장 이름
    private String washAddr; // 세차장 주소
    private String washTel;  // 세차장 전화번호
    private String washImg;  // 세차장 이미지

    // 기본 생성자
    public FavoriteVO() {}

    // 매개변수 생성자
    public FavoriteVO(String favId, String userId, String washId, Date crtDate, String washName, String washAddr, String washTel, String washImg) {
        this.favId = favId;
        this.userId = userId;
        this.washId = washId;
        this.crtDate = crtDate;
        this.washName = washName;
        this.washAddr = washAddr;
        this.washTel = washTel;
        this.washImg = washImg;
    }

    // Getter & Setter
    public String getFavId() {
        return favId;
    }

    public void setFavId(String favId) {
        this.favId = favId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getWashId() {
        return washId;
    }

    public void setWashId(String washId) {
        this.washId = washId;
    }

    public Date getCrtDate() {
        return crtDate;
    }

    public void setCrtDate(Date crtDate) {
        this.crtDate = crtDate;
    }

    public String getWashName() {
        return washName;
    }

    public void setWashName(String washName) {
        this.washName = washName;
    }

    public String getWashAddr() {
        return washAddr;
    }

    public void setWashAddr(String washAddr) {
        this.washAddr = washAddr;
    }

    public String getWashTel() {
        return washTel;
    }

    public void setWashTel(String washTel) {
        this.washTel = washTel;
    }

    public String getWashImg() {
        return washImg;
    }

    public void setWashImg(String washImg) {
        this.washImg = washImg;
    }

    @Override
    public String toString() {
        return "FavoriteVO [favId=" + favId + ", userId=" + userId + ", washId=" + washId + ", crtDate=" + crtDate +
               ", washName=" + washName + ", washAddr=" + washAddr + ", washTel=" + washTel + ", washImg=" + washImg + "]";
    }
}
