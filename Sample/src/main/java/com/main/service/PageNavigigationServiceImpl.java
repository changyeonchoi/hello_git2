package com.main.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.main.controller.PageNavigation;

@Service(value = "pagenavigigationservice")
public class PageNavigigationServiceImpl implements PageNavigigationService{

	@Override
	public PageNavigation makePageNavigation(Map<String, Object> map) {
	    
		int totalCount = (Integer) map.get("totalCount");
		int pageNo = (Integer) map.get("pageNo");
		int listSize = (Integer) map.get("listSize");
		int naviSize = (Integer) map.get("naviSize");
		
		PageNavigation navigation = new PageNavigation();
		navigation.setListSize(listSize);
		navigation.setNaviSize(naviSize);
		navigation.setTotalCount(totalCount);
		
		int totalPageCount = (totalCount-1)/listSize+1;
		navigation.setTotalPageCount(totalPageCount);
		navigation.setPageNo(pageNo);
		boolean firstRange = pageNo <= naviSize;
		navigation.setFirstRange(firstRange);
		boolean lastRange = (totalPageCount - 1) / naviSize * naviSize < pageNo;
		navigation.setLastRange(lastRange);
		return navigation;

	}

}
