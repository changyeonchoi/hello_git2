package com.main.service;

import java.util.List;
import java.util.Map;

import com.main.vo.OrderVo;
import com.main.vo.ProductVo;

public interface ProductService {

	///////////공통///////////////
	int selectTotalCount(Map<String, Object> keyword);
	
	////////fahison////////////
	List<ProductVo> selectProductList(Map<String, Object> map);

	int insertfashion(ProductVo fashionvo);

	ProductVo selectfashiondetail(Integer seq_id);

	String deletefashion(Integer seq_id);

	void updatefashion(ProductVo productvo);


	/////////makeup//////////////

	void updatemakeup(ProductVo productvo);

	List<ProductVo> selectFashionList(Map<String, Object> map);

	List<ProductVo> selectMakeupList(Map<String, Object> map);

	List<ProductVo> selectAccessoryList(Map<String, Object> map);

	int insertOrder(OrderVo ordervo);

	int ordercount(Map<String, Object> keyword);

	List<OrderVo> OrderList(Map<String, Object> map);
}
