package com.main.service;

import java.util.List;
import java.util.Map;

import com.main.vo.BannerVo;
import com.main.vo.ProductVo;
import com.main.vo.SearchVo;

public interface SearchService {

	int selectSearchCount(Map<String, Object> keyword);

	List<ProductVo> selectSearchProductList(Map<String, Object> map);

	String selectCodeCount(List<ProductVo> productList);

	List<BannerVo> selectSearchBannerList(Map<String, Object> map);

	int insertKeyword(Map<String, Object> keyword);

	int updateKeyword(Map<String, Object> keyword);

	int selectKeywordCount(Map<String, Object> keyword);

	List<SearchVo> selectRankingList(SearchVo searchvo);

}
