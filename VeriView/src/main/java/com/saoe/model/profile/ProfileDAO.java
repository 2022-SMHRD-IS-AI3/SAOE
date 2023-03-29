package com.saoe.model.profile;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class ProfileDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public ProfileDTO selectProfile(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		ProfileDTO profile = sqlSession.selectOne("selectProfile", id);
		
		sqlSession.close();

		return profile;
	}
	
	public List<ProfileFeedDTO> selectProfileFeed(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ProfileFeedDTO> profileFeedList = sqlSession.selectList("selectProfileFeed", id);
			
		sqlSession.close();

		return profileFeedList;
	}
	
	public List<ProfileFollowDTO> selectProfileFollower(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ProfileFollowDTO> profileFollowerList = sqlSession.selectList("selectProfileFollower", id);
			
		sqlSession.close();

		return profileFollowerList;
	}

	public List<ProfileFollowDTO> selectProfileFollowing(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<ProfileFollowDTO> profileFollowingList = sqlSession.selectList("selectProfileFollowing", id);
		
		sqlSession.close();
		
		return profileFollowingList;
	}
	
	public List<ProfileBlockDTO> selectProfileBlock(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<ProfileBlockDTO> profileBlockList = sqlSession.selectList("selectProfileBlock", id);
		
		sqlSession.close();
		
		return profileBlockList;
	}
	
	public List<ProfileReportDTO> selectProfileReport(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<ProfileReportDTO> profileReportList = sqlSession.selectList("selectProfileReport", id);
		
		sqlSession.close();
		
		return profileReportList;
	}
}
