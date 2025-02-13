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
    
    // FAQ 목록 조회
    @Override
    public List<FaqVO> listFaqs() throws Exception {
        return faqDAO.selectAllFaqs();
    }
    
    // 새 FAQ 등록
    @Override
    public int addNewFaq(Map<String, Object> faqMap) throws Exception {
        return faqDAO.insertFaq(faqMap);
    }
    @Override
    public boolean deleteFaq(int faqNo, String userId) throws Exception {
        FaqVO faq = faqDAO.selectFaq(faqNo);
        if (faq != null && faq.getUserId().equals(userId)) {
            faqDAO.deleteFaq(faqNo);
            return true;
        }
        return false;
    }

    // 특정 FAQ 조회
    @Override
    public FaqVO viewFaq(int faqNo) throws Exception {
        return faqDAO.selectFaq(faqNo);
    }
    
    // FAQ 수정
    @Override
    public void modFaq(Map<String, Object> faqMap) throws Exception {
        faqDAO.updateFaq(faqMap);
    }
    
    // FAQ 삭제
    @Override
    public void removeFaq(int faqNo) throws Exception {
        faqDAO.deleteFaq(faqNo);
    }

    // FAQ 답변 등록 및 수정
    @Override
    public void updateAnswer(int faqNo, String answer) throws Exception {
        Map<String, Object> answerMap = Map.of(
            "faqNo", faqNo,
            "answer", answer
        );
        faqDAO.updateFaq(answerMap);
    }
    @Override
    public int addUserQuestion(FaqVO faqVO) throws Exception {
        return faqDAO.insertFaq(faqVO.toMap());
    }

}
