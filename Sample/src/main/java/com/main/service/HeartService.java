package com.main.service;

import java.util.List;
import java.util.Map;

import com.main.vo.HeartVo;
import com.main.vo.ProductVo;

public interface HeartService {

	int selectheartCount(Map<String, Object> heartcnt);

	void downHeart(Map<String, Object> map);

	void upHeart(Map<String, Object> map);

	int selectqnaheartCount(Map<String, Object> heartqnacnt);
	
	void qnadownHeart(Map<String, Object> map);

	void qnaupHeart(Map<String, Object> map);

	int selectheartuserCount(Map<String, Object> heartcnt);

	List<ProductVo> selectheartProductList(Map<String, Object> map);

	int selectheartqnaCount(Map<String, Object> heartcnt);
}
