package com.main.service;

import java.util.List;
import java.util.Map;

import com.main.vo.QnaVo;

public interface QnaService {

	List<QnaVo> selectQnaFashionList(Map<String, Object> map);

	int QnaTotalCount(Map<String, Object> keyword);

	int insertQnaFashion(QnaVo qnavo);

	QnaVo detailQnaFashion(Integer seq_id);

	void fashionqnaupdate(QnaVo qnavo);

	List<QnaVo> selectQnaAccessoryList(Map<String, Object> map);

	int insertQnaAccessory(QnaVo qnavo);

	void accessoryqnaupdate(QnaVo qnavo);

	QnaVo detailQnaAccessory(Integer seq_id);

	List<QnaVo> selectQnaMakeUpList(Map<String, Object> map);

	QnaVo detailQnaMakeUp(Integer seq_id);

	int insertQnaMakeUp(QnaVo qnavo);

	void makeupqnaupdate(QnaVo qnavo);


}
