package com.main.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.QnaDao;
import com.main.vo.QnaVo;

@Service(value = "qnaservice")
public class QnaServiceImpl implements QnaService{
	
	@Resource(name = "qnaDao")
	private QnaDao qnaDao;

	@Override
	public int QnaTotalCount(Map<String, Object> keyword) {
		// TODO Auto-generated method stub
		return qnaDao.QnaTotalCount(keyword);
		
	}

	@Override
	public List<QnaVo> selectQnaFashionList(Map<String, Object> map) {
		List<QnaVo> qnaList = null;
//		try {
			qnaList = qnaDao.selectQnaFashionList(map);
//		} catch(Exception e) {
//			if(e instanceof SQLException) {
//				new DBException("DB EXCEPT", e);
//			}else {
//				new QnaException("Exception", e);
//			}
//		}
		return qnaList;
	}

	@Override
	public int insertQnaFashion(QnaVo qnavo) {
		// TODO Auto-generated method stub
		return qnaDao.insertQnaFashion(qnavo);
	}

	@Override
	public QnaVo detailQnaFashion(Integer seq_id) {
		// TODO Auto-generated method stub
		return qnaDao.detailQnaFashion(seq_id);
	}

	@Override
	public void fashionqnaupdate(QnaVo qnavo) {
		// TODO Auto-generated method stub
		qnaDao.fashionqnaupdate(qnavo);
	}

	@Override
	public List<QnaVo> selectQnaAccessoryList(Map<String, Object> map) {
		List<QnaVo> qnaList = null;
		
		qnaList = qnaDao.selectQnaAccessoryList(map);
		
		return qnaList;
	}

	@Override
	public int insertQnaAccessory(QnaVo qnavo) {
		// TODO Auto-generated method stub
		return qnaDao.insertQnaAccessory(qnavo);
	}

	@Override
	public void accessoryqnaupdate(QnaVo qnavo) {
		// TODO Auto-generated method stub
		qnaDao.accessoryqnaupdate(qnavo);
	}

	@Override
	public QnaVo detailQnaAccessory(Integer seq_id) {
		// TODO Auto-generated method stub
		return qnaDao.detailQnaAccessory(seq_id);
	}

	@Override
	public List<QnaVo> selectQnaMakeUpList(Map<String, Object> map) {
		List<QnaVo> qnaList = null;
		
		qnaList = qnaDao.selectQnaMakeUpList(map);
		
		return qnaList;
	}

	@Override
	public QnaVo detailQnaMakeUp(Integer seq_id) {
		// TODO Auto-generated method stub
		return qnaDao.detailQnaMakeUp(seq_id);
	}

	@Override
	public int insertQnaMakeUp(QnaVo qnavo) {
		// TODO Auto-generated method stub
		return qnaDao.insertQnaMakeUp(qnavo);
	}

	@Override
	public void makeupqnaupdate(QnaVo qnavo) {
		// TODO Auto-generated method stub
		qnaDao.makeupqnaupdate(qnavo);
	}

	@Override
	public List<QnaVo> selectQnaList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<QnaVo> qnaList = null;
		
		qnaList = qnaDao.selectQnaList(map);
		
		return qnaList;
	}

}
