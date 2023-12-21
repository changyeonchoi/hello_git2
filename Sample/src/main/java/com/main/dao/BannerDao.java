package com.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.vo.BannerVo;


@Service(value = "bannerDao")
public class BannerDao {

	@Autowired
	private SqlSession sqlSession;

	public List<BannerVo> selectBannerList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bannerDao.selectBannerList", map);
	}
	
	
}
