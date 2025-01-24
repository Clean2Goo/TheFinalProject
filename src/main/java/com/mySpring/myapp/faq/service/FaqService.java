package com.mySpring.myapp.faq.service;


import java.util.List;
import java.util.Map;

import com.mySpring.myapp.faq.vo.FaqVO;

public interface FaqService {
	
    public List<FaqVO> listFaqs() throws Exception; // faq 목록 조회
    public int addNewFaq(Map<String, Object> faqMap) throws Exception; // 새 faq 등록
    public FaqVO viewFaq(int faqNo) throws Exception; // 특정 faq 조회
    public void modFaq(Map<String, Object> faqMap) throws Exception; // faq 수정
    public void removeFaq(int faqNo) throws Exception; // faq 삭제
}