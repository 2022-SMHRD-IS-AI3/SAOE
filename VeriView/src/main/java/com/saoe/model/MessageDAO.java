package com.saoe.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class MessageDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// (쪽지목록, s_f_602)
	public List<MessageDTO> selectMessage(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<MessageDTO> messageList = sqlSession.selectList("selectMessage", id);
		
		sqlSession.close();		
		
		return messageList;
	}
	
	// (쪽지보내기, s_f_601)
	public int sendMessage(MessageDTO msg) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("sendMessage", msg);
		
		return cnt;
	}
	
	// (쪽지삭제, ??)

}
