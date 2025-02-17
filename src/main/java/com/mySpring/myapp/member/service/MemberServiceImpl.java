package com.mySpring.myapp.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.myapp.member.dao.MemberDAO;
import com.mySpring.myapp.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDAO memberDAO;

    @Override
    public List listMembers() throws DataAccessException {
        System.out.println("Service: listMembers() called");
        List membersList = memberDAO.selectAllMemberList();
        System.out.println("Service: listMembers() - membersList size: " + (membersList != null ? membersList.size() : "null"));
        return membersList;
    }

    @Override
    public int addMember(MemberVO member) throws DataAccessException {
        System.out.println("Service: addMember() called with member: " + member);
        int result = memberDAO.insertMember(member);
        System.out.println("Service: addMember() - result: " + result);
        return result;
    }

    @Override
    public int removeMember(String id) throws DataAccessException {
        System.out.println("Service: removeMember() called with id: " + id);
        int result = memberDAO.deleteMember(id);
        System.out.println("Service: removeMember() - result: " + result);
        return result;
    }

    @Override
    public MemberVO login(MemberVO memberVO) throws Exception {
        System.out.println("Service: login() called with memberVO: " + memberVO);
        MemberVO result = memberDAO.loginById(memberVO);
        System.out.println("Service: login() - result: " + result);
        return result;
    }

    @Override
    public void updateMemberProfileImage(MemberVO member) {
        System.out.println("Service: updateMemberProfileImage() called with member: " + member);
        memberDAO.updateProfileImage(member);
        System.out.println("Service: updateMemberProfileImage() completed");
    }

    @Override
    public boolean updatePassword(String id, String currentPassword, String newPassword) {
        System.out.println("Service: updatePassword() called with id: " + id + ", currentPassword: " + currentPassword + ", newPassword: " + newPassword);

        String dbPassword = memberDAO.checkPassword(id);
        System.out.println("Service: updatePassword() - dbPassword from DB: " + dbPassword);

        if (dbPassword != null && dbPassword.equals(currentPassword)) {
            System.out.println("Service: updatePassword() - current password matches. Proceeding to update.");
            MemberVO member = new MemberVO();
            member.setId(id);
            member.setNewPassword(newPassword);

            System.out.println("Service: updatePassword() - updating password for member: " + member);
            memberDAO.updatePassword(member);
            System.out.println("Service: updatePassword() - password update successful.");
            return true;
        } else {
            System.out.println("Service: updatePassword() - current password does not match.");
            return false;
        }
    }
    @Autowired
    private SqlSession sqlSession;

    public void updateMemberInfo(String userId, String field, String value) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userId", userId);
        paramMap.put("value", value);

        switch (field) {
            case "email":
                paramMap.put("field", "email");
                break;
            case "phone":
                paramMap.put("field", "phone");
                break;
            case "dob":
                paramMap.put("field", "dob");
                break;
            default:
                throw new IllegalArgumentException("허용되지 않은 필드입니다.");
        }

        sqlSession.update("mapper.member.updateMemberInfo", paramMap);
    }


}