package com.saoe.model;

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

public class ReviewPicDTO {
	
	private int review_pic_no;
	private int review_no;
	@NonNull private String review_pic_title;
	@NonNull private String review_pic_type;
	@NonNull private String review_pic_src;
	@NonNull private int review_pic_size;
	

}
