package com.saoe.model.member;

import java.util.List;

import com.saoe.model.CategoryDTO;
import com.saoe.model.MemberMemberDTO;
import com.saoe.model.RestMemberDTO;
import com.saoe.model.ReviewMemberDTO;

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
	private String profile_message;
	private String join_date;
	private int member_score;
	private String grade;
	
	// 사용자의 관심사를 가져옴
	private List<CategoryDTO> categoryList;
	
	// 사용자의 활동 내역을 담음
	private List<MemberMemberDTO> memberMemberList;
	private List<ReviewMemberDTO> reviewMemberList;
	private List<RestMemberDTO> restMemberList;
	
	private int followerCnt;
	private int followingCnt;
}


