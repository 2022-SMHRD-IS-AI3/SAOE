package com.saoe.model.rank;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class RankingDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<RankingDTO> selectRanking(){
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<RankingDTO> rankingList = sqlSession.selectList("selectRanking");
		
		sqlSession.close();
		
		return rankingList;
		
	}

}
