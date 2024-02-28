package com.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.vo.BannerVo;
import com.main.vo.ProductVo;
import com.main.vo.SearchVo;

@Service(value = "searchDao")
public class SearchDao {
	
	@Autowired
	private SqlSession sqlSession;

	public int selectSearchCount(Map<String, Object> keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("searchDao.selectSearchCount", keyword);
	}

	public List<ProductVo> selectSearchProductList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("searchDao.selectSearchProductList", map);
	}

	public String selectCodeCount(List<ProductVo> productList) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("searchDao.selectCodeCount", productList);
	}

	public List<BannerVo> selectSearchBannerList(String codeCount) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("searchDao.selectSearchBannerList", codeCount);
	}

	public List<BannerVo> selectSearchBannerList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("searchDao.selectSearchBannerList", map);
	}

	public int insertKeyword(Map<String, Object> keyword) {
		// TODO Auto-generated method stub
		return sqlSession.insert("searchDao.insertKeyword", keyword);
	}

	public int updateKeyword(Map<String, Object> keyword) {
		// TODO Auto-generated method stub
		return sqlSession.update("searchDao.updateKeyword", keyword);
	}

	public int selectKeywordCount(Map<String, Object> keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("searchDao.selectKeywordCount", keyword);
	}

	public List<SearchVo> selectRankingList(SearchVo searchvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("searchDao.selectRankingList", searchvo);
	}

}
