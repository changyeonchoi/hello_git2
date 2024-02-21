package com.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.HeartDao;
import com.main.vo.HeartVo;
import com.main.vo.ProductVo;

@Service(value = "heartservice")
public class HeartServiceImpl implements HeartService {

    @Resource(name = "heartDao")
    private HeartDao heartDao;

	@Override
	public int selectheartCount(Map<String, Object> heartcnt) {
		// TODO Auto-generated method stub
		return heartDao.selectheartCount(heartcnt);
	}

	@Override
	public void downHeart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		heartDao.downHeart(map);
	}

	@Override
	public void upHeart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		heartDao.upHeart(map);
	}

	@Override
	public int selectqnaheartCount(Map<String, Object> heartqnacnt) {
		// TODO Auto-generated method stub
		return heartDao.selectqnaheartCount(heartqnacnt);
	}

	@Override
	public void qnadownHeart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		heartDao.qnadownHeart(map);
	}

	@Override
	public void qnaupHeart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		heartDao.qnaupHeart(map);
	}

	@Override
	public int selectheartuserCount(Map<String, Object> heartcnt) {
		// TODO Auto-generated method stub
		return heartDao.selectheartuserCount(heartcnt);
	}

	@Override
	public List<ProductVo> selectheartProductList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<ProductVo> productList = null;
		
		productList = heartDao.selectheartProductList(map);
		
		return productList;
	}

	@Override
	public int selectheartqnaCount(Map<String, Object> heartcnt) {
		// TODO Auto-generated method stub
		return heartDao.selectheartqnaCount(heartcnt);
	}


}