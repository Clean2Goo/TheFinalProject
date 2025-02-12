package com.mySpring.myapp.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.myapp.member.vo.MemberVO;


public interface MemberDAO {
	 public List selectAllMemberList() throws DataAccessException;
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 public int deleteMember(String id) throws DataAccessException;
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	 void updateProfileImage(MemberVO member);
	 String checkPassword(String id); 
	 void updatePassword(MemberVO member);
	 void updateMemberInfo(Map<String, String> paramMap);


}
