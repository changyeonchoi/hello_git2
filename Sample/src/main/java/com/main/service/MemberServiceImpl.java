package com.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.MemberDao;
import com.main.vo.MemberVo;


@Service(value = "memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name = "memberDao")
	private MemberDao memberDao;

	@Override
	public boolean signupCheck(String user_id) {
		boolean checkResult = false;
		
		checkResult = memberDao.signupCheck(user_id);
		
		return checkResult;
	}

	@Override
	public String signupSuccess(MemberVo membervo) {

		memberDao.signupSuccess(membervo);
		
		return null;
	}

//	@Override
	public MemberVo login(MemberVo membervo) {
		
		return memberDao.login(membervo);
	}
//	
    @Override
    public boolean idCheck(MemberVo membervo) {
        return memberDao.idCheck(membervo);
    }
//
	@Override
	public boolean loginCheck(MemberVo membervo) {
		
		boolean check = memberDao.loginCheck(membervo);

		return check;
	}
	
//	@Override
//	public List<MemberVo> selectMemberList(String search){
//		List<MemberVo> memberList = null;
//		
//		memberList = memberDao.selectmemberlist(search);
//		
//		return memberList;
//	}
	
//	@Override
//	public List<MemberVo> selectMemberList(Map<String, Object> map){
//		List<MemberVo> memberList = null;
//		
//		memberList = memberDao.selectmemberlist(map);
//		
//		return memberList;
//	}
//
//	@Override
//	public MemberVo selectMemberdetail(String user_id) {
//		
//		return memberDao.selectMemberdetail(user_id);
//	}
//
//	@Override
//	public int deleteUserId(String user_id) {
//		
//		return memberDao.deleteUserId(user_id);
//	}
//
//    @Override
//    public void updateUser(MemberVo membervo) {
//        // 받아온 사용자 정보를 가지고 업데이트 로직을 수행합니다.
//        // 여기에서는 MemberRepository를 사용하여 데이터베이스에 업데이트하는 예시를 보여줍니다.
//    	memberDao.updateUser(membervo);
//    }
//
//	@Override
//	public int selectTotalCount(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return memberDao.selectTotalCount(map);
//	}
}