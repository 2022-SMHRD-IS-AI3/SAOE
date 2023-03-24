package com.saoe.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class MemberDAO {
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// (회원가입, s_f_101)
	public int join(MemberDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("join", dto);
		
		sqlSession.close();
		
		return cnt;
	}
	
	// (로그인, s_f_102)
	public MemberDTO login(MemberDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		MemberDTO member = sqlSession.selectOne("login", dto);
		
		List<MemberMemberDTO> memberMemberList = sqlSession.selectList("loginMember", member);
		member.setMemberMemberList(memberMemberList);
		List<ReviewMemberDTO> reviewMemberList = sqlSession.selectList("loginReview", member);
		member.setReviewMemberList(reviewMemberList);
		List<RestMemberDTO> restMemberList = sqlSession.selectList("loginRest", member);
		member.setRestMemberList(restMemberList);
		
		sqlSession.close();		
		
		return member;
	}
	
	// (회원 탈퇴, s_f_104)
	public void dropMember() {
		
	}
	
	// (회원 정보 수정, s_f_501)
	public int updateMember() {
		
		return 0;
	}
	
	// (회원 신고, s_f_505)
	public int reportMember() {
		
		return 0;
	}
	
	
	
	
	

}
