package com.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.vo.QnaVo;

@Service(value = "qnaDao")
public class QnaDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int QnaTotalCount(Map<String, Object> keyword) {
		
		return sqlSession.selectOne("qnaDao.QnaTotalCount", keyword);
	}

	public List<QnaVo> selectQnaFashionList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaDao.selectQnaFashionList", map);
	}

	public int insertQnaFashion(QnaVo qnavo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qnaDao.insertQnaFashion", qnavo);
	}

	public QnaVo detailQnaFashion(Integer seq_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaDao.detailQnaFashion",seq_id);
	}

	public void fashionqnaupdate(QnaVo qnavo) {
		// TODO Auto-generated method stub
		sqlSession.update("qnaDao.fashionqnaupdate", qnavo);
	}

	public List<QnaVo> selectQnaAccessoryList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaDao.selectQnaAccessoryList", map);
	}

	public int insertQnaAccessory(QnaVo qnavo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qnaDao.insertQnaAccessory", qnavo);
	}

	public void accessoryqnaupdate(QnaVo qnavo) {
		// TODO Auto-generated method stub
		sqlSession.update("qnaDao.accessoryqnaupdate", qnavo);
	}

	public QnaVo detailQnaAccessory(Integer seq_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaDao.detailQnaAccessory",seq_id);
	}

	public List<QnaVo> selectQnaMakeUpList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaDao.selectQnaMakeUpList", map);
	}

	public QnaVo detailQnaMakeUp(Integer seq_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaDao.detailQnaMakeUp",seq_id);
	}

	public int insertQnaMakeUp(QnaVo qnavo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qnaDao.insertQnaMakeUp", qnavo);
	}

	public void makeupqnaupdate(QnaVo qnavo) {
		// TODO Auto-generated method stub
		sqlSession.update("qnaDao.makeupqnaupdate", qnavo);
	}

	public List<QnaVo> selectQnaList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaDao.selectQnaList", map);
	}

}
