package com.mySpring.myapp.faq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.myapp.faq.dao.FaqDAO;
import com.mySpring.myapp.faq.vo.FaqVO;

@Service("FaqService")
@Transactional(propagation = Propagation.REQUIRED)
public class FaqServiceImpl implements FaqService {
    @Autowired
    private FaqDAO faqDAO;
    
    //faq목록조회
    @Override
    public List<FaqVO> listFaqs() throws Exception {
        return faqDAO.selectAllFaqs();
    }
    
    //faq추가
    @Override
    public int addNewFaq(Map<String, Object> faqMap) throws Exception {
        return faqDAO.insertFaq(faqMap);
    }
    
    //faq보기
    @Override
    public FaqVO viewFaq(int faqNo) throws Exception {
        return faqDAO.selectFaq(faqNo);
    }
    
    //faq수정
    @Override
    public void modFaq(Map<String, Object> faqMap) throws Exception {
        faqDAO.updateFaq(faqMap);
    }
    
    //faq삭제
    @Override
    public void removeFaq(int faqNo) throws Exception {
        faqDAO.deleteFaq(faqNo);
    }
}