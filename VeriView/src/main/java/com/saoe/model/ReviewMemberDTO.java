package com.saoe.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class ReviewMemberDTO {
	
	private int review_no;
	private String actor_id;
	private int review_gb;
	private int review_scrap_yn;
	private int review_block_yn;
	private int review_rep_yn;
	private String review_rep_content;
	private String review_gb_date;
	private String review_scrap_date;
	private String review_block_date;
	private String review_rep_date;

}
