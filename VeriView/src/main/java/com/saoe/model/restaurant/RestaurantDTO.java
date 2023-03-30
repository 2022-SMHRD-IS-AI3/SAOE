package com.saoe.model.restaurant;

import com.saoe.model.category.CategoryDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter

public class RestaurantDTO {
	
	private int rest_no;
	private int code_no;
	private String rest_name;
	private String rest_profile;
	private String rest_tel;
	private String rest_addr;
	private int rest_naver_score;
	private int rest_kakao_score;
	private int rest_google_score;
	private String rest_content;
	private int rest_score;
	private String rest_post_date;
	
	// 식당 테이블에서 카테고리 번호를 가져옴
	private CategoryDTO category;
	
	// 음식점 사진 테이블에서 사진들을 가져옴
	
	
	
	

}
