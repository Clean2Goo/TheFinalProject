package com.mySpring.myapp.faq.vo;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

public class FaqVO {
    private String faqId;
    private String userId;
    private String question;
    private String answer;
    private Date crtDate;
    private int faqNo;
    private String faqImg;
    private String title;

    // Getter and Setter methods
    public String getFaqId() {
        return faqId;
    }

    public void setFaqId(String faqId) {
        this.faqId = faqId;
    }
    public String getTitle() {
    	return title;
    }
    public void setTitle(String title) {
    	this.title=title;
    }
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Date getCrtDate() {
        return crtDate;
    }

    public void setCrtDate(Date crtDate) {
        this.crtDate = crtDate;
    }

    public int getFaqNo() {
        return faqNo;
    }

    public void setFaqNo(int faqNo) {
        this.faqNo = faqNo;
    }

    public String getFaqImg() {
        return faqImg;
    }

    public void setFaqImg(String faqImg) {
        this.faqImg = faqImg;
    }

    // toMap 메서드 추가
    public Map<String, Object> toMap() {
        Map<String, Object> map = new HashMap<>();
        map.put("faqId", this.faqId);
        map.put("userId", this.userId);
        map.put("question", this.question);
        map.put("answer", this.answer);
        map.put("crtDate", this.crtDate);
        map.put("faqNo", this.faqNo);
        map.put("faqImg", this.faqImg);
        return map;
    }

    @Override
    public String toString() {
        return "FaqVO{" +
                "faqId='" + faqId + '\'' +
                ", userId='" + userId + '\'' +
                ", title='" + title + '\'' + 
                ", question='" + question + '\'' +
                ", answer='" + answer + '\'' +
                ", crtDate=" + crtDate +
                ", faqNo=" + faqNo +
                ", faqImg='" + faqImg + '\'' +
                '}';
    }
}
