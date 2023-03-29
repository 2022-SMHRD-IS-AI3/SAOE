package com.saoe.model.member;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class MemberMemberDAO {
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int selectFollowerCnt(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.selectOne("selectFollowerCnt", id);
		
		sqlSession.close();
		
		return cnt;
	}

	public int selectFollowingCnt(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.selectOne("selectFollowingCnt", id);
		
		sqlSession.close();
		
		return cnt;
	}
}
