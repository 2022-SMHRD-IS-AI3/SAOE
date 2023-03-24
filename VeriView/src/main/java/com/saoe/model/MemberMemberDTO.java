package com.saoe.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class MemberMemberDTO {
	
	private String id;
	private String acotr_id;
	private int member_follow_yn;
	private int member_block_yn;
	private int member_rep_yn;
	private String member_rep_content;
	private String member_follow_date;
	private String member_block_date;
	private String member_rep_date;
	
	

}
