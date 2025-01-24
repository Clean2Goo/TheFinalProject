package com.mySpring.myapp.faq.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.faq.vo.FaqVO;

public interface FaqDAO {
	  public List<FaqVO> selectAllFaqs() throws DataAccessException; // faq 목록 조회
	    public int insertFaq(Map<String, Object> faqMap) throws DataAccessException; // faq 등록
	    public FaqVO selectFaq(int faqNo) throws DataAccessException; // 특정 faq 조회
	    public void updateFaq(Map<String, Object> faqMap) throws DataAccessException; // faq 수정
	    public void deleteFaq(int faqNo) throws DataAccessException; // faq 삭제
	}


