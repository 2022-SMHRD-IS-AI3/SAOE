package com.saoe.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class CategoryDTO {
	
	private int code_no;
	private String main_cate;
	private String sub_cate;

}
