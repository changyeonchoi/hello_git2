//package com.main.dao;
//
//import java.util.Map;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//@Service(value = "qnaDao")
//public class QnaDao {
//	
//	@Autowired
//	private SqlSession sqlSession;
//
//	public int selectTotalCount(Map<String, Object> keyword) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("qnaDao.selectTotalCount", keyword);
//	}
//
//}
