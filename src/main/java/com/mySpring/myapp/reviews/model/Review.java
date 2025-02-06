package com.mySpring.myapp.reviews.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "REVIEWS")
public class Review {

    @Id
    @Column(name = "RVWID")
    private String rwId;

    @Column(name = "RSVNID", nullable = false)
    private String rsvId;

    // 예약 건별 예약 ID (RESERVATIONS 테이블의 RSVNID)
    @Column(name = "RSVNID2", nullable = true)
    private String rsvId2;

    @Column(name = "USERID", nullable = false)
    private String userId;

    @Column(name = "RVWSCORE")
    private int rwvScore;

    @Column(name = "TITLE")
    private String title;

    @Column(name = "CONTENT")
    private String content;

    @Column(name = "RVWIMG")
    private String rwvImg;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CRTDATE")
    private Date crtDate;

    @Column(name = "WASHID", insertable = false, updatable = false)
    private String washId;

    @Transient
    private String washName;

    // Getters & Setters
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

    public String getRsvId2() {
        return rsvId2;
    }

    public void setRsvId2(String rsvId2) {
        this.rsvId2 = rsvId2;
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

    public String getWashId() {
        return washId;
    }

    public void setWashId(String washId) {
        this.washId = washId;
    }

    public String getWashName() {
        return washName;
    }

    public void setWashName(String washName) {
        this.washName = washName;
    }
}
