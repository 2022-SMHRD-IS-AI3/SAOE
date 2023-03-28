package com.saoe.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter

public class FeedDTO {

	// 게시자 테이블에서 게시자의 닉네임과 프로필사진을 가져옴
	@NonNull private MemberDTO member;
	
	// 리뷰 데이터를 담음
	@NonNull private ReviewDTO review;
	
	// 리뷰한 식당을 담음
	@NonNull private RestaurantDTO restaurant;
	
	
	// 리뷰 상태를 가져옴
	private MemberMemberDTO memberMember;
	
	private ReviewMemberDTO reviewMember;
	
	private RestMemberDTO restMember;

}
