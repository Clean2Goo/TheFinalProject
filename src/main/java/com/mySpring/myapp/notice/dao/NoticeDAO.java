package com.mySpring.myapp.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.notice.vo.NoticeVO;

public interface NoticeDAO {
    public List<NoticeVO> selectAllNoticesList() throws DataAccessException; // 공지사항 목록 조회
    public int insertNewNotice(Map<String, Object> noticeMap) throws DataAccessException; // 공지사항 등록
    public NoticeVO selectNotice(int noticeno) throws DataAccessException; // 특정 공지사항 조회
    public void updateNotice(Map<String, Object> noticeMap) throws DataAccessException; // 공지사항 수정
    public void deleteNotice(int noticeno) throws DataAccessException; // 공지사항 삭제
	public NoticeVO selectPrevNoticeDetails(int noticeno) throws DataAccessException;
	public NoticeVO selectNextNoticeDetails(int noticeno) throws DataAccessException;
}
