package com.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.dao.BannerDao;
import com.main.vo.BannerVo;

@Service(value = "bannerservice")
public class BannerServiceImpl implements BannerService {
	
	@Resource(name = "bannerDao")
	private BannerDao bannerDao;

	@Override
	public List<BannerVo> selectBannerList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<BannerVo> bannerList = null;
		
		bannerList = bannerDao.selectBannerList(map);
		
		return bannerList;
	}

}
