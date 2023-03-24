package com.saoe.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@RequiredArgsConstructor
@Getter

public class RestaurantDTO {
	
	private int rest_no;
	private String rest_name;
	private int code_no;
	private String rest_content;
	private int rest_score;
	private String p_date;
	private String rest_detail;
	
	// 음식점 사진
	private String rest_profile;
	
	// 음식점 
	

}
