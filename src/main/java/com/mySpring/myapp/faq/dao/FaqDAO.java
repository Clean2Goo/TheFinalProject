package com.mySpring.myapp.faq.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import com.mySpring.myapp.faq.vo.FaqVO;

public interface FaqDAO {
    List<FaqVO> selectAllFaqs() throws DataAccessException;  // FAQ 목록 조회
    int insertFaq(Map<String, Object> faqMap) throws DataAccessException;  // FAQ 등록
    FaqVO selectFaq(int faqNo) throws DataAccessException;  // 특정 FAQ 조회
    void updateFaq(Map<String, Object> faqMap) throws DataAccessException;  // FAQ 수정
    void updateAnswer(Map<String, Object> faqMap) throws DataAccessException;  // FAQ 답변 등록 및 수정
    void deleteFaq(int faqNo) throws DataAccessException;  // FAQ 삭제
    int insertQuestion(FaqVO faqVO) throws DataAccessException;  // 질문 등록

    // 본인 확인 후 삭제를 위한 메서드 추가
    FaqVO selectFaqByUserId(int faqNo, String userId) throws DataAccessException;  // 특정 사용자의 FAQ 조회
}
