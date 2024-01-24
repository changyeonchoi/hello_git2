package com.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.ProductDao;
import com.main.vo.ProductVo;


@Service(value = "productservice")
public class ProductServiceImpl implements ProductService {

	@Resource(name = "productDao")
	private ProductDao productDao;

	////////////////////////////////공통
	@Override
	public int selectTotalCount(Map<String, Object> keyword) {
		// TODO Auto-generated method stub
		return productDao.selectTotalCount(keyword);
	}
	
	////////////////////////////fashion
	@Override
	public List<ProductVo> selectProductList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<ProductVo> productList = null;
		
		productList = productDao.selectProductList(map);
		
		return productList;
	}

	@Override
	public int insertfashion(ProductVo fashionvo) {
		// TODO Auto-generated method stub
		return productDao.insertfashion(fashionvo);
	}

	@Override
	public ProductVo selectfashiondetail(Integer seq_id) {
		// TODO Auto-generated method stub
		return productDao.selectfashiondetail(seq_id);
	}

	@Override
	public String deletefashion(Integer seq_id) {
		// TODO Auto-generated method stub
		return productDao.deletefashion(seq_id);
	}

	@Override
	public void updatefashion(ProductVo productvo) {
		// TODO Auto-generated method stub
		productDao.updatefashion(productvo);
	}

	@Override
	public void updatemakeup(ProductVo productvo) {
		// TODO Auto-generated method stub
		productDao.updatemakeup(productvo);
	}

	@Override
	public List<ProductVo> selectFashionList(Map<String, Object> map) {
		List<ProductVo> fashionList = null;
		
		fashionList = productDao.selectFashionList(map);
		
		return fashionList;
	}

	@Override
	public List<ProductVo> selectMakeupList(Map<String, Object> map) {
		List<ProductVo> makeupList = null;
		
		makeupList = productDao.selectMakeupList(map);
		
		return makeupList;
	}

	@Override
	public List<ProductVo> selectAccessoryList(Map<String, Object> map) {
		List<ProductVo> accessoryList = null;
		
		accessoryList = productDao.selectAccessoryList(map);
		
		return accessoryList;
	}
	
	
}