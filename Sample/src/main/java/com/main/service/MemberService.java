package com.main.service;

import java.util.List;
import java.util.Map;

import com.main.vo.MemberVo;


public interface MemberService {

	boolean signupCheck(String user_id);
	
	String signupSuccess(MemberVo membervo);

	MemberVo login(MemberVo membervo);

	boolean idCheck(MemberVo membervo);
	
//	boolean idCheck(MemberVo membervo);

	boolean loginCheck(MemberVo membervo);
	
//	public List<MemberVo> selectMemberList(String search);
	
//	public List<MemberVo> selectMemberList(Map<String, Object> map);

//	MemberVo selectMemberdetail(String user_id);

//	int deleteUserId(String user_id);

//	void updateUser(MemberVo membervo);

//	int selectTotalCount(Map<String, Object> map);

}
