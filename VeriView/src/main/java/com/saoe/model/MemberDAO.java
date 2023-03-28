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
		
		int followerCnt = 0;
		int followingCnt = 0;
		for(MemberMemberDTO memberMember : memberMemberList) {
			if(memberMember.getId().equals(dto.getId()) && memberMember.getMember_follow_yn() == 1) {
				followerCnt++;
			}
			if(memberMember.getActor_id().equals(dto.getId()) && memberMember.getMember_follow_yn() == 1){
				followingCnt++;
			}
		}
		member.setFollowerCnt(followerCnt);
		member.setFollowingCnt(followingCnt);
		
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
	public int updateMember(MemberDTO updateMember) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.update("updateMember", updateMember);
		
		sqlSession.close();		
		
		return cnt;
	}
	
	public int followMember(MemberMemberDTO memberMember) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.update("followMember", memberMember);
		
		sqlSession.close();		
		
		return cnt;
	}
	
	public int blockMember(MemberMemberDTO memberMember) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.update("blockMember", memberMember);
		
		sqlSession.close();		
		
		return cnt;
	}

	// (회원 신고, s_f_505)
	public int reportMember(MemberMemberDTO memberMember) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.update("reportMember", memberMember);
		
		sqlSession.close();		
		
		return cnt;
	}
	
	public MemberDTO selectMember(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		MemberDTO user = sqlSession.selectOne("selectMember", id);
		
		List<MemberMemberDTO> memberMemberList = sqlSession.selectList("loginMember", id);
		user.setMemberMemberList(memberMemberList);
		List<ReviewMemberDTO> reviewMemberList = sqlSession.selectList("loginReview", id);
		user.setReviewMemberList(reviewMemberList);
		List<RestMemberDTO> restMemberList = sqlSession.selectList("loginRest", id);
		user.setRestMemberList(restMemberList);
		
		sqlSession.close();
		
		return user;
	}
	
	
	
	
	

}
