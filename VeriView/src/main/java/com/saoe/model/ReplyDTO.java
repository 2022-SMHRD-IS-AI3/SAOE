package com.saoe.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter


public class ReplyDTO {
	
	// 댓글 테이블에서 가져옴
	private int reply_no;
	private int review_no;
	private String reply_date;
	private String id;
	@NonNull private String reply_content;
	private int parent_no;
	

}
