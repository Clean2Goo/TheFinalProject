package com.mySpring.myapp.faq.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import com.mySpring.myapp.faq.vo.FaqVO;

public interface FaqDAO {
    public List<FaqVO> selectAllFaqs() throws DataAccessException;  // FAQ 목록 조회
    public int insertFaq(Map<String, Object> faqMap) throws DataAccessException;  // FAQ 등록
    public FaqVO selectFaq(int faqNo) throws DataAccessException;  // 특정 FAQ 조회
    public void updateFaq(Map<String, Object> faqMap) throws DataAccessException;  // FAQ 수정
    public void updateAnswer(Map<String, Object> faqMap) throws DataAccessException;  // FAQ 답변 등록 및 수정
    public void deleteFaq(int faqNo) throws DataAccessException;  // FAQ 삭제
    public int insertQuestion(FaqVO faqVO) throws DataAccessException;

}
