package com.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.vo.CommentVo;

@Service(value = "commentDao")
public class CommentDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int insertComment(CommentVo commentvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("commentDao.insertComment", commentvo);
	}

	public List<CommentVo> selectComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("commentDao.selectComment", map);
	}

	public int CmtTotalCount(Map<String, Object> Cmt) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("commentDao.CmtTotalCount", Cmt);
	}

}
