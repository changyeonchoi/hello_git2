package com.main.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.vo.ProductVo;



@Service(value = "heartDao")
public class HeartDao {

	@Autowired
	private SqlSession sqlSession;

	public int selectheartCount(Map<String, Object> heartcnt) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("heartDao.selectheartCount", heartcnt);
	}

	public void downHeart(Map<String, Object> map) {

	    sqlSession.delete("heartDao.downHeart", map);
	}

	public void upHeart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("heartDao.upHeart", map);
	}

	public void selectheart(Map<String, Object> response) {
		// TODO Auto-generated method stub
		sqlSession.selectOne("heartDao.selectheart", response);
	}

	public int selectqnaheartCount(Map<String, Object> heartqnacnt) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("heartDao.selectqnaheartCount", heartqnacnt);
	}

	public void qnadownHeart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.delete("heartDao.qnadownHeart", map);
	}

	public void qnaupHeart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("heartDao.qnaupHeart", map);
	}

	public int selectheartuserCount(Map<String, Object> heartcnt) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("heartDao.selectheartuserCount", heartcnt);
	}

	public List<ProductVo> selectheartProductList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("heartDao.selectheartProductList", map);
	}

	public int selectheartqnaCount(Map<String, Object> heartcnt) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("heartDao.selectheartqnaCount", heartcnt);
	}


	
}
