package com.saoe.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.saoe.mybatis.SqlSessionManager;

public class FeedDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// (피드 설정, s_f_201)
	// 메뉴, 지역, 팔로우 별 변수를 받아 테이블을 다르게 select

	public List<FeedDTO> selectFeed(MemberDTO login) {

		List<FeedDTO> feedList = new ArrayList<FeedDTO>();

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<ReviewDTO> reviewList = new ReviewDAO().selectAllReview();

		for (ReviewDTO review : reviewList) {
			// 리뷰를 올린 회원 데이터를 가져옴
			MemberDTO member = sqlSession.selectOne("feedMember", review);

			// 리뷰한 식당 데이터를 가져옴
			RestaurantDTO restaurant = sqlSession.selectOne("feedRest", review);
			CategoryDTO category = sqlSession.selectOne("feedCate", restaurant);
			restaurant.setCategory(category);

			feedList.add(new FeedDTO(member, review, restaurant));

		}
		
		if (login != null) {
			for (FeedDTO feed : feedList) {
				MemberMemberDTO mm = new MemberMemberDTO(feed.getMember().getId(), login.getId());
				MemberMemberDTO memberMember = sqlSession.selectOne("feedMemberMember", mm);
				
				ReviewMemberDTO rm1 = new ReviewMemberDTO(feed.getReview().getReview_no(), login.getId());
				ReviewMemberDTO ReviewMember = sqlSession.selectOne("feedReviewMember", rm1);
				
				RestMemberDTO rm2 = new RestMemberDTO(feed.getRestaurant().getRest_no(), login.getId());
				RestMemberDTO restMember = sqlSession.selectOne("feedRestMember", rm2);
				
				feed.setMemberMember(memberMember);
				feed.setReviewMember(ReviewMember);
				feed.setRestMember(restMember);
			}
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
