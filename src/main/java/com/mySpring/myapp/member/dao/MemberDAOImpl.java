package com.mySpring.myapp.member.dao;

import java.util.List;
import java.util.Map;

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
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException{
		  MemberVO vo = sqlSession.selectOne("mapper.member.loginById",memberVO);
		return vo;
	}
	
	@Override
    public void updateProfileImage(MemberVO member) {
        // MyBatis 쿼리를 사용해 프로필 이미지를 업데이트합니다.
        sqlSession.update("mapper.member.updateProfileImage", member);
    }
	@Override
    public String checkPassword(String id) {
        return sqlSession.selectOne("mapper.member.checkPassword", id);
    }

    @Override
    public void updatePassword(MemberVO member) {
        sqlSession.update("mapper.member.updatePassword", member);
    }
    @Override
    public void updateMemberInfo(Map<String, String> paramMap) {
        sqlSession.update("mapper.member.updateMemberInfo", paramMap);
    }

}
