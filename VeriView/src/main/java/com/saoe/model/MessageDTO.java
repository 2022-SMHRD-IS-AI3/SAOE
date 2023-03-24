package com.saoe.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@Getter

public class MessageDTO {
	
	@NonNull public String send_id;
	@NonNull public String receive_id;
	public String message_date;
	@NonNull public String message_content;
	public int review_no;
	
}
