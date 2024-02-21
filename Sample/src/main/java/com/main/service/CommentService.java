package com.main.service;

import java.util.List;
import java.util.Map;

import com.main.vo.CommentVo;

public interface CommentService {

	int insertComment(CommentVo commentvo);

	List<CommentVo> selectComment(Map<String, Object> map);

	int CmtTotalCount(Map<String, Object> Cmt);

}
