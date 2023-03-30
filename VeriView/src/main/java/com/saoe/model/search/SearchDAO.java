package com.saoe.model.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class SearchDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<SearchDTO> search(String searchWord) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<SearchDTO> searchList = sqlSession.selectList("search", searchWord);
		
		sqlSession.close();
		
		return searchList;
	}

}
