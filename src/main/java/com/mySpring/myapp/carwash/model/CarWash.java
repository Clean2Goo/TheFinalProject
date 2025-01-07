package com.mySpring.myapp.carwash.model;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "CARWASHES") // 테이블 이름 매핑
public class CarWash {

    @Id
    @Column(name = "WASHID", nullable = false) // PK, NOT NULL
    private String washId;

    @Column(name = "USERID")
    private String userId;

    @Column(name = "WASHNAME", nullable = false) // NOT NULL
    private String washName;

    @Column(name = "WASHADDR", nullable = false) // NOT NULL
    private String washAddr;

    @Column(name = "WASHLAT", precision = 9, scale = 6)
    private Double washLat;

    @Column(name = "WASHLNG", precision = 9, scale = 6)
    private Double washLng;

    @Lob
    @Column(name = "WASHINFO")
    private String washInfo; // CLOB 매핑

    @Column(name = "WASHIMG", length = 500)
    private String washImg;

    @Column(name = "WASHTEL", length = 20)
    private String washTel; // 새 필드

    @Column(name = "OPENHRS", length = 255)
    private String openHrs;

    @Column(name = "WASHTYPE", length = 50)
    private String washType;

    @Column(name = "WASHABLECAR", length = 255)
    private String washableCar; // 새 필드

    @Column(name = "MAXCAR")
    private Integer maxCar;

    @Column(name = "VACANCY")
    private Integer vacancy;

    @Column(name = "NEWYN", length = 1)
    private String newYn; // 새 필드

    @Column(name = "FAVYN", length = 1)
    private String favYn; // 새 필드

    @Column(name = "RVWCOUNT")
    private Integer rvwCount; // 새 필드

    @Column(name = "RATING", precision = 2, scale = 1)
    private BigDecimal rating; // NUMBER(2,1) 매핑

    @Column(name = "CRTDATE")
    private java.sql.Date crtDate;

    // Getter와 Setter
    public String getWashId() {
        return washId;
    }

    public void setWashId(String washId) {
        this.washId = washId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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

    public Double getWashLat() {
        return washLat;
    }

    public void setWashLat(Double washLat) {
        this.washLat = washLat;
    }

    public Double getWashLng() {
        return washLng;
    }

    public void setWashLng(Double washLng) {
        this.washLng = washLng;
    }

    public String getWashInfo() {
        return washInfo;
    }

    public void setWashInfo(String washInfo) {
        this.washInfo = washInfo;
    }

    public String getWashImg() {
        return washImg;
    }

    public void setWashImg(String washImg) {
        this.washImg = washImg;
    }

    public String getWashTel() {
        return washTel;
    }

    public void setWashTel(String washTel) {
        this.washTel = washTel;
    }

    public String getOpenHrs() {
        return openHrs;
    }

    public void setOpenHrs(String openHrs) {
        this.openHrs = openHrs;
    }

    public String getWashType() {
        return washType;
    }

    public void setWashType(String washType) {
        this.washType = washType;
    }

    public String getWashableCar() {
        return washableCar;
    }

    public void setWashableCar(String washableCar) {
        this.washableCar = washableCar;
    }

    public Integer getMaxCar() {
        return maxCar;
    }

    public void setMaxCar(Integer maxCar) {
        this.maxCar = maxCar;
    }

    public Integer getVacancy() {
        return vacancy;
    }

    public void setVacancy(Integer vacancy) {
        this.vacancy = vacancy;
    }

    public String getNewYn() {
        return newYn;
    }

    public void setNewYn(String newYn) {
        this.newYn = newYn;
    }

    public String getFavYn() {
        return favYn;
    }

    public void setFavYn(String favYn) {
        this.favYn = favYn;
    }

    public Integer getRvwCount() {
        return rvwCount;
    }

    public void setRvwCount(Integer rvwCount) {
        this.rvwCount = rvwCount;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public java.sql.Date getCrtDate() {
        return crtDate;
    }

    public void setCrtDate(java.sql.Date crtDate) {
        this.crtDate = crtDate;
    }
}
