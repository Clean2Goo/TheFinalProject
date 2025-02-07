package com.mySpring.myapp.member.service;

import java.util.List;

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
        List membersList = null;
        membersList = memberDAO.selectAllMemberList();
        return membersList;
    }

    @Override
    public int addMember(MemberVO member) throws DataAccessException {
        return memberDAO.insertMember(member);
    }

    @Override
    public int removeMember(String id) throws DataAccessException {
        return memberDAO.deleteMember(id);
    }
    
    @Override
    public MemberVO login(MemberVO memberVO) throws Exception {
        return memberDAO.loginById(memberVO);
    }

    @Override
    public void updateMemberProfileImage(MemberVO member) {
        memberDAO.updateProfileImage(member); // DAO에서 처리
    }

    // 1. 비밀번호 확인
    public boolean checkPassword(String id, String currentPassword) {
        // memberDAO를 사용하여 사용자 정보를 조회하고 비밀번호 비교
        MemberVO member = memberDAO.getMemberById(id); // 회원 정보를 조회하는 메서드
        if (member != null && member.getPwd().equals(currentPassword)) {
            return true;
        }
        return false;
    }

    // 2. 비밀번호 변경
    public boolean changePassword(String id, String newPassword) {
        // memberDAO를 사용하여 사용자의 비밀번호를 새 비밀번호로 업데이트
        return memberDAO.updatePassword(id, newPassword);
    }
}
