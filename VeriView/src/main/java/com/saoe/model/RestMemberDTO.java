package com.saoe.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class RestMemberDTO {
	
	private int rest_no;
	private String actor_id;
	private int rest_follow_yn;
	private int rest_gb;
	private int rest_block_yn;
	private String rest_follow_date;
	private String rest_gb_date;
	private String rest_block_date;

}
