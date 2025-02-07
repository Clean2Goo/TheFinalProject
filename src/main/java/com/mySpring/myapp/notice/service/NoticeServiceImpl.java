package com.mySpring.myapp.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.myapp.notice.dao.NoticeDAO;
import com.mySpring.myapp.notice.vo.NoticeVO;

@Service("noticeService")
@Transactional(propagation = Propagation.REQUIRED)
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeDAO noticeDAO;

    @Override
    public List<NoticeVO> listNotices() throws Exception {
        return noticeDAO.selectAllNoticesList();
    }

    @Override
    public int addNewNotice(Map<String, Object> noticeMap) throws Exception {
        return noticeDAO.insertNewNotice(noticeMap);
    }

    @Override
    public NoticeVO viewNotice(int noticeno) throws Exception {
        return noticeDAO.selectNotice(noticeno);
    }

    @Override
    public void modNotice(Map<String, Object> noticeMap) throws Exception {
        noticeDAO.updateNotice(noticeMap);
    }

    @Override
    public void removeNotice(int noticeno) throws Exception {
        noticeDAO.deleteNotice(noticeno);
    }
    
	public NoticeVO getPrevNoticeDetails(int noticeno) {
        return noticeDAO.selectPrevNoticeDetails(noticeno);
    }
    
    public NoticeVO getNextNoticeDetails(int noticeno) {
        return noticeDAO.selectNextNoticeDetails(noticeno);
    }

}
