package com.saoe.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class ReviewDTO {
	
	// 게시글 테이블에서 가져옴
	private int review_no;
	@NonNull private String id;
	private String foreign_review_url = "";
	@NonNull private int code_no;
	@NonNull private String review_content;
	private int review_score;
	private int review_display;
	private String review_post_date;
	
	// 게시글 공감 테이블에서 count로 가져옴
	private int likeCnt;
	
	// 게시자 테이블에서 게시자의 닉네임과 프로필사진을 가져옴
	private String nick;
	private String profile;
		
	// 게시글 댓글을 담음
	private List<ReplyDTO> ReplyList;
	
	// 게시판 사진을 담음
	private List<ReviewPicDTO> reviewPicList;
	
}