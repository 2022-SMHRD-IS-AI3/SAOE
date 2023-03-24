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

public class MemberDTO {
	
	@NonNull private String id;
	@NonNull private String pw;
	private String name;
	private String nick;
	private String tel;
	private String addr;
	private String birth;
	private String gender;
	private String profile;
	private String join_date;
	private int member_score;
	private String grade;
	
	// 사용자의 활동 내역을 담음
	private List<ReviewMemberDTO> reviewMemberList;
	private List<MemberMemberDTO> memberMemberList;
	private List<RestMemberDTO> restMemberList;
}


