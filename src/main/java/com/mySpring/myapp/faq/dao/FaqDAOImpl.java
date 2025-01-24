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

    
    //faq 목록 조회
    @Override
    public List<FaqVO> selectAllFaqs() throws DataAccessException {
    	return sqlSession.selectList("com.mySpring.myapp.faq.dao.FaqDAO.selectAllFaqs");
    
    }

    //faq 등록
    @Override
    public int insertFaq(Map<String, Object> faqMap) throws DataAccessException {
        int faqNo = selectNewFaqNo();
        faqMap.put("faqNo", faqNo);
        sqlSession.insert("com.mySpring.myapp.faq.dao.FaqDAO.insertFaq", faqMap);
        System.out.println("Calling selectAllFaqs..."); //여기까지는 나오는게 맞음 콘솔에 있음 ㅡ 
        return faqNo;
    }
    
    //특정 faq 조회
    @Override
    public FaqVO selectFaq(int faqNo) throws DataAccessException {
        return sqlSession.selectOne("com.mySpring.myapp.faq.dao.FaqDAO.selectFaq", faqNo); 
    }

    //faq 수정
    @Override
    public void updateFaq(Map<String, Object> faqMap) throws DataAccessException {
        sqlSession.update("mapper.faq.updateFaq", faqMap);
    }

    //faq 삭제
    @Override
    public void deleteFaq(int faqNo) throws DataAccessException {
        sqlSession.delete("com.mySpring.myapp.faq.dao.FaqDAO.deleteFaq", faqNo);
    }

    //새 faq 번호생성
    private int selectNewFaqNo() throws DataAccessException {
        return sqlSession.selectOne("com.mySpring.myapp.faq.dao.FaqDAO.selectNewFaqNo");
    }

}

