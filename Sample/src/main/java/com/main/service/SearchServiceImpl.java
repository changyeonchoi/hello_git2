package com.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.SearchDao;
import com.main.vo.BannerVo;
import com.main.vo.ProductVo;
import com.main.vo.SearchVo;

@Service(value = "searchservice")
public class SearchServiceImpl implements SearchService{

	@Resource(name = "searchDao")
	private SearchDao searchDao;
	
	@Override
	public int selectSearchCount(Map<String, Object> keyword) {
		// TODO Auto-generated method stub
		return searchDao.selectSearchCount(keyword);
	}

	@Override
	public List<ProductVo> selectSearchProductList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<ProductVo> productList = null;
		
		productList = searchDao.selectSearchProductList(map);
		
		return productList;
	}

	@Override
	public String selectCodeCount(List<ProductVo> productList) {
		// TODO Auto-generated method stub
		return searchDao.selectCodeCount(productList);
	}

	@Override
	public List<BannerVo> selectSearchBannerList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<BannerVo> bannerList = null;
		
		bannerList = searchDao.selectSearchBannerList(map);
		
		return bannerList;
	}

	@Override
	public int insertKeyword(Map<String, Object> keyword) {
		// TODO Auto-generated method stub
		return searchDao.insertKeyword(keyword);
	}

	@Override
	public int updateKeyword(Map<String, Object> keyword) {
		// TODO Auto-generated method stub
		return searchDao.updateKeyword(keyword);
	}

	@Override
	public int selectKeywordCount(Map<String, Object> keyword) {
		// TODO Auto-generated method stub
		return searchDao.selectKeywordCount(keyword);
	}

	@Override
	public List<SearchVo> selectRankingList(SearchVo searchvo) {
		// TODO Auto-generated method stub
		List<SearchVo> RankingList = null;
		
		RankingList = searchDao.selectRankingList(searchvo);
		
		return RankingList;
	}



}
