package com.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.vo.MemberVo;

@Service(value = "memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;

	public boolean signupCheck(String user_id) {
		boolean checkResult = false;
		
		List<MemberVo> memberVo = sqlSession.selectList("memberDao.signupCheck",user_id);
		
		if(memberVo.size() > 0) {
			checkResult = false;
		} else {
			checkResult = true;
		}
		return checkResult; 
	}

	public String signupSuccess(MemberVo membervo) {
		
		sqlSession.insert("memberDao.signupSuccess", membervo);
		
		return null;
	}
//
	public MemberVo login(MemberVo membervo) {
		MemberVo login = sqlSession.selectOne("memberDao.login", membervo);
		return login;
	}
	

    public boolean idCheck(MemberVo membervo) {
   
    	boolean idCheckResult = false;
    	
    	try {
    		MemberVo result = sqlSession.selectOne("memberDao.idCheck", membervo);
			if(result == null) {
				idCheckResult = false;
			} else {
				idCheckResult = true;
			}
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
        return idCheckResult;
    }
//
	public boolean loginCheck(MemberVo membervo) {
		
		boolean check = false;
		
		try {
			MemberVo result = sqlSession.selectOne("memberDao.loginCheck", membervo);

			if(result == null) {
				check = false;
			} else {
				check = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
//	public List<MemberVo> selectmemberlist(String search) {
//		return sqlSession.selectList("memberDao.selectmemberlist", search);
//	}
	
//	public List<MemberVo> selectmemberlist(Map<String, Object> map) {
//		return sqlSession.selectList("memberDao.selectmemberlist", map);
//	}
//
//	public MemberVo selectMemberdetail(String user_id) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("memberDao.selectMemberdetail", user_id);
//	}
//
//	public int deleteUserId(String user_id) {
//		// TODO Auto-generated method stub
//		return sqlSession.delete("memberDao.deleteUserId", user_id);
//	}
//
//	public void updateUser(MemberVo membervo) {
//		// TODO Auto-generated method stub
//		sqlSession.update("memberDao.updateUser", membervo);
//	}
//
//	public int selectTotalCount(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("memberDao.selectTotalCount", map);
//	}
//
//   
    
//    public List<MemberVo> selectMemberListPaging(int startIndex, int pageSize) {
//        Map<String, Integer> params = new HashMap<>();
//        params.put("startIndex", startIndex);
//        params.put("pageSize", pageSize);
//        return sqlSession.selectList("memberDao.selectMemberListPaging", params);
//    }
//
//  
//    public int getTotalMembers() {
//        return sqlSession.selectOne("memberDao.getTotalMembers");
//    }


	
}
