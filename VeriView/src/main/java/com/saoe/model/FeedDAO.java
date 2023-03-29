package com.saoe.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.model.member.MemberDTO;
import com.saoe.mybatis.SqlSessionManager;

public class FeedDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// (피드 설정, s_f_201)
	// 메뉴, 지역, 팔로우 별 변수를 받아 테이블을 다르게 select

	public List<FeedDTO> selectFeed() {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<FeedDTO> feedList = sqlSession.selectList("selectFeed");
		
		for(FeedDTO feed : feedList) {
			int review_no = feed.getReview_no();
			List<ReplyDTO> replyList = sqlSession.selectList("selectReplyList", review_no);
			feed.setReplyList(replyList); 
			List<ReviewPicDTO> reviewPicList = sqlSession.selectList("selectReviewPicList", review_no);
			feed.setReviewPicList(reviewPicList); 
		}
		
		sqlSession.close();

		return feedList;
	}
	public List<FeedDTO> selectUserFeed(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<FeedDTO> feedList = sqlSession.selectList("selectFeed");
		
		for(FeedDTO feed : feedList) {
			int review_no = feed.getReview_no();
			List<ReplyDTO> replyList = sqlSession.selectList("selectReplyList", review_no);
			feed.setReplyList(replyList); 
			List<ReviewPicDTO> reviewPicList = sqlSession.selectList("selectReviewPicList", review_no);
			feed.setReviewPicList(reviewPicList); 
		}
		
		sqlSession.close();
		
		return feedList;
	}
	
	public List<CategoryDTO> selectCate(){
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<CategoryDTO> cateList = sqlSession.selectList("selectCate");
		
		if(cateList != null) {
			for(CategoryDTO cate : cateList) {
				List<CategoryDTO> sub_cateList = sqlSession.selectList("selectSubCate", cate);
				cate.setSub_cateList(sub_cateList);
				
			}
		}
		
		sqlSession.close();
		
		return cateList;
	}

}
