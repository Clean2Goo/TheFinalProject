package com.mySpring.myapp.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mySpring.myapp.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List selectAllMemberList() throws DataAccessException {
        List<MemberVO> membersList = null;
        membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
        return membersList;
    }

    @Override
    public int insertMember(MemberVO memberVO) throws DataAccessException {
        int result = sqlSession.insert("mapper.member.insertMember", memberVO);
        return result;
    }

    @Override
    public int deleteMember(String id) throws DataAccessException {
        int result = sqlSession.delete("mapper.member.deleteMember", id);
        return result;
    }
    
    @Override
    public MemberVO loginById(MemberVO memberVO) throws DataAccessException {
        MemberVO vo = sqlSession.selectOne("mapper.member.loginById", memberVO);
        return vo;
    }
    
    @Override
    public void updateProfileImage(MemberVO member) {
        // MyBatis 쿼리를 사용해 프로필 이미지를 업데이트합니다.
        sqlSession.update("mapper.member.updateProfileImage", member);
    }
    
    // 1. 사용자 정보 조회 (아이디로)
    public MemberVO getMemberById(String id) {
        return sqlSession.selectOne("mapper.member.getMemberById", id);
    }

    // 2. 비밀번호 확인 (현재 비밀번호가 맞는지 확인)
    public boolean checkPassword(String id, String currentPassword) {
        // 비밀번호를 확인하는 쿼리
        MemberVO member = sqlSession.selectOne("mapper.member.checkPassword", id);
        if (member != null && member.getPwd().equals(currentPassword)) {
            return true;  // 비밀번호 일치
        }
        return false;  // 비밀번호 불일치
    }

    // 3. 비밀번호 업데이트
    public boolean updatePassword(String id, String newPassword) {
        // 비밀번호를 새 비밀번호로 업데이트하는 쿼리
        int result = sqlSession.update("mapper.member.updatePassword", newPassword);
        return result > 0;  // 업데이트 성공 여부
    }
}
