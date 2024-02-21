package com.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.CommentDao;
import com.main.vo.CommentVo;

@Service(value = "commentservice")
public class CommentServiceImpl implements CommentService{

	@Resource(name = "commentDao")
	private CommentDao commentDao;
	
	@Override
	public int insertComment(CommentVo commentvo) {
		// TODO Auto-generated method stub
		return commentDao.insertComment(commentvo);
	}

	@Override
	public List<CommentVo> selectComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return commentDao.selectComment(map);
	}

	@Override
	public int CmtTotalCount(Map<String, Object> Cmt) {
		// TODO Auto-generated method stub
		return commentDao.CmtTotalCount(Cmt);
	}

}
