package com.mySpring.myapp.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mySpring.myapp.notice.vo.NoticeVO;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<NoticeVO> selectAllNoticesList() throws DataAccessException {
    	return sqlSession.selectList("com.mySpring.myapp.notice.dao.NoticeDAO.selectAllNoticesList");

    }



    @Override
    public int insertNewNotice(Map<String, Object> noticeMap) throws DataAccessException {
        int noticeno = selectNewNoticeno();
        noticeMap.put("noticeno", noticeno);
        sqlSession.insert("com.mySpring.myapp.notice.dao.NoticeDAO.insertNotice", noticeMap);

        return noticeno;
    }

    @Override
    public NoticeVO selectNotice(int noticeno) throws DataAccessException {
        return sqlSession.selectOne("com.mySpring.myapp.notice.dao.NoticeDAO.selectNotice", noticeno); // 수정됨
    }


    @Override
    public void updateNotice(Map<String, Object> noticeMap) throws DataAccessException {
        sqlSession.update("mapper.notice.updateNotice", noticeMap);
    }

    @Override
    public void deleteNotice(int noticeno) throws DataAccessException {
        sqlSession.delete("com.mySpring.myapp.notice.dao.NoticeDAO.deleteNotice", noticeno);
    }


    private int selectNewNoticeno() throws DataAccessException {
        return sqlSession.selectOne("com.mySpring.myapp.notice.dao.NoticeDAO.selectNewNoticeno");
    }

}
