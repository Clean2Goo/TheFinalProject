package com.mySpring.myapp.faq.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.mySpring.myapp.faq.vo.FaqVO;

@Repository("faqDAO")
public class FaqDAOImpl implements FaqDAO {

    @Autowired
    private SqlSession sqlSession;

    // FAQ 목록 조회
    @Override
    public List<FaqVO> selectAllFaqs() throws DataAccessException {
        return sqlSession.selectList("com.mySpring.myapp.faq.dao.FaqDAO.selectAllFaqs");
    }

    // FAQ 등록
    @Override
    public int insertFaq(Map<String, Object> faqMap) throws DataAccessException {
        int faqNo = selectNewFaqNo();
        faqMap.put("faqNo", faqNo);
        sqlSession.insert("com.mySpring.myapp.faq.dao.FaqDAO.insertFaq", faqMap);
        return faqNo;
    }

    // 특정 FAQ 조회
    @Override
    public FaqVO selectFaq(int faqNo) throws DataAccessException {
        return sqlSession.selectOne("com.mySpring.myapp.faq.dao.FaqDAO.selectFaq", faqNo);
    }

    // FAQ 수정 (질문 또는 답변)
    @Override
    public void updateFaq(Map<String, Object> faqMap) throws DataAccessException {
        sqlSession.update("com.mySpring.myapp.faq.dao.FaqDAO.updateFaq", faqMap);
    }

    // FAQ 답변 등록 및 수정
    @Override
    public void updateAnswer(Map<String, Object> faqMap) throws DataAccessException {
        sqlSession.update("com.mySpring.myapp.faq.dao.FaqDAO.updateAnswer", faqMap);
    }

    // FAQ 삭제
    @Override
    public void deleteFaq(int faqNo) throws DataAccessException {
        sqlSession.delete("com.mySpring.myapp.faq.dao.FaqDAO.deleteFaq", faqNo);
    }

    // 새 FAQ 번호 생성
    private int selectNewFaqNo() throws DataAccessException {
        return sqlSession.selectOne("com.mySpring.myapp.faq.dao.FaqDAO.selectNewFaqNo");
    }
    @Override
    public int insertQuestion(FaqVO faqVO) throws DataAccessException {
        return sqlSession.insert("com.mySpring.myapp.faq.dao.FaqDAO.insertFaq", faqVO.toMap());
    }

}
