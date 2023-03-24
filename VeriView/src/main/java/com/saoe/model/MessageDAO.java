package com.saoe.model;

import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class MessageDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// (쪽지목록, s_f_602)
	public void selectMessage() {
		
	}
	
	// (쪽지보내기, s_f_601)
	public int sendMessage() {
		
		return 0;
	}
	
	// (쪽지삭제, ??)

}
