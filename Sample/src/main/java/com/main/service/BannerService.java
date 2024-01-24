package com.main.service;

import java.util.List;
import java.util.Map;

import com.main.vo.BannerVo;

public interface BannerService {

	List<BannerVo> selectBannerList(Map<String, Object> map);

	List<BannerVo> selectCouponList(Map<String, Object> map);

}
