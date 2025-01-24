package com.mySpring.myapp.faq.vo;

import java.sql.Date;

public class FaqVO {
           
    private String userId;     
    private String question;   
    private String answer;     
    private Date crtDate;      
    private int faqNo;         
    private String faqImg;     

    // Getter and Setter
  

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

    @Override
    public String toString() {
    	return "FaqVO{" +
                "userId='" + userId + '\'' +
                ", question='" + question + '\'' +
                ", answer='" + answer + '\'' +
                ", crtDate=" + crtDate +
                ", faqNo=" + faqNo +
                ", faqImg='" + faqImg + '\'' +
                '}';
    }
}
