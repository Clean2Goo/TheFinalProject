package com.mySpring.myapp.favorites.vo;

import java.util.Date;

public class FavoriteVO {
    private String favId;   // 즐겨찾기 ID
    private String userId;  // 사용자 ID
    private String washId;  // 세차장 ID
    private Date crtDate;   // 생성 날짜

    // 기본 생성자
    public FavoriteVO() {}

    // 매개변수 생성자
    public FavoriteVO(String favId, String userId, String washId, Date crtDate) {
        this.favId = favId;
        this.userId = userId;
        this.washId = washId;
        this.crtDate = crtDate;
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

    @Override
    public String toString() {
        return "FavoriteVO [favId=" + favId + ", userId=" + userId + ", washId=" + washId + ", crtDate=" + crtDate + "]";
    }
}
