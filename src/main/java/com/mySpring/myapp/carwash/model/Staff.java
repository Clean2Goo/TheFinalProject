package com.mySpring.myapp.carwash.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;

@Entity
@Table(name = "STAFF") // 테이블 이름 매핑
public class Staff {

    @Id
    @Column(name = "STAFFID", nullable = false) // PK 자동생성 시퀀스,트리거 설정 해놓음
    private String staffId;
    //기존 직원 추가 쿼리문 첨부
    //INSERT INTO staff (userid, washid,role,staffinfo,experience,workyn,rating)
    //VALUES ('staff01', 1031715982,'직원','친절하게 모시겠습니다.',8,'Y',5);
    //기재된 컬럼값만 작성하여 직원추가 가능

    @Column(name = "USERID") //FK
    private String userId;

    @Column(name = "WASHID") //FK
    private String washId;

    @Column(name = "ROLE")
    private String role;

    @Column(name = "STAFFINFO")
    private String staffInfo;

    @Column(name = "EXPERIENCE")
    private String experience;

    @Column(name = "WORKYN")
    private String workYn;

    @Column(name = "RATING", precision = 2, scale = 1)
    private String rating;

    @Column(name = "HIREDATE") // 고용 날짜
    private java.sql.Date hireDate;

    @Column(name = "STAFFIMG") // 스태프 프로필이미지 추가
    private String staffImg;

    @Transient // JPA에서 관리하지 않을 필드
    private String userName;

    @ManyToOne // 다대일 관계 설정
    @JoinColumn(name = "WASHID", insertable = false, updatable = false) // 외래키 매핑
    private CarWash carWash;

    // Getter와 Setter
    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStaffInfo() {
        return staffInfo;
    }

    public void setStaffInfo(String staffInfo) {
        this.staffInfo = staffInfo;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getWorkYn() {
        return workYn;
    }

    public void setWorkYn(String workYn) {
        this.workYn = workYn;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String details) {
        this.rating = details;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    public CarWash getCarWash() {
        return carWash;
    }

    public void setCarWash(CarWash carWash) {
        this.carWash = carWash;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getStaffImg() {
        return staffImg;
    }

    public void setStaffImg(String staffImg) {
        this.staffImg = staffImg;
    }

}
