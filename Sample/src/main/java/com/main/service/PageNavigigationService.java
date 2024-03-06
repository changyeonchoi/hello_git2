package com.main.service;

import java.util.Map;

import com.main.controller.PageNavigation;

public interface PageNavigigationService {
	//페이지 네비게이션 객체 생성
	public PageNavigation makePageNavigation(Map<String, Object> map);

}
