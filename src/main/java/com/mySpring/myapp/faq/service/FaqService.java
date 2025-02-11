package com.mySpring.myapp.faq.service;

import java.util.List;
import java.util.Map;

import com.mySpring.myapp.faq.vo.FaqVO;

public interface FaqService {
    public List<FaqVO> listFaqs() throws Exception;                // FAQ 목록 조회
    public int addNewFaq(Map<String, Object> faqMap) throws Exception; // 새 FAQ 등록
    public FaqVO viewFaq(int faqNo) throws Exception;              // 특정 FAQ 조회
    public void modFaq(Map<String, Object> faqMap) throws Exception;  // FAQ 수정
    public void removeFaq(int faqNo) throws Exception;             // FAQ 삭제
    public void updateAnswer(int faqNo, String answer) throws Exception; // FAQ 답변 등록/수정
    public int addUserQuestion(FaqVO faqVO) throws Exception;

}
