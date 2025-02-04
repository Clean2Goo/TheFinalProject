package com.mySpring.myapp.notice.service;

import java.util.List;
import java.util.Map;

import com.mySpring.myapp.notice.vo.NoticeVO;

public interface NoticeService {
    public List<NoticeVO> listNotices() throws Exception; // 공지사항 목록 조회
    public int addNewNotice(Map<String, Object> noticeMap) throws Exception; // 새 공지사항 등록
    public NoticeVO viewNotice(int noticeno) throws Exception; // 특정 공지사항 조회
    public void modNotice(Map<String, Object> noticeMap) throws Exception; // 공지사항 수정
    public void removeNotice(int noticeno) throws Exception; // 공지사항 삭제
    public NoticeVO getPrevNoticeDetails(int noticeno) throws Exception;
    public NoticeVO getNextNoticeDetails(int noticeno) throws Exception;
}
