package com.mySpring.myapp.reviews.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "REVIEWS")
public class Review {

    @Id
    @Column(name = "RVWID") // 리뷰 ID
    private String rwId;

    @Column(name = "RSVNID") // 예약 ID
    private String rsvId;

    @Column(name = "USERID", nullable = false) // 작성자 ID
    private String userId;

    @Column(name = "RVWSCORE") // 리뷰 점수
    private int rwvScore;

    @Column(name = "TITLE") // 리뷰 제목
    private String title;

    @Column(name = "CONTENT") // 리뷰 내용
    private String content;

    @Column(name = "RVWIMG") // 리뷰 이미지
    private String rwvImg;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CRTDATE") // 리뷰 작성일
    private Date crtDate;

    @Transient // DB와 매핑되지 않음
    private String washName; // 세차장 이름

    // Getters and Setters
    public String getRwId() {
        return rwId;
    }

    public void setRwId(String rwId) {
        this.rwId = rwId;
    }

    public String getRsvId() {
        return rsvId;
    }

    public void setRsvId(String rsvId) {
        this.rsvId = rsvId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getRwvScore() {
        return rwvScore;
    }

    public void setRwvScore(int rwvScore) {
        this.rwvScore = rwvScore;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRwvImg() {
        return rwvImg;
    }

    public void setRwvImg(String rwvImg) {
        this.rwvImg = rwvImg;
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
}
