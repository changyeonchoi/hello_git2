package com.main.controller;

import java.util.Map;

public class PageNavigation {
	
	// 새로운 게시물의 수
	private int newCount;
	// 총 게시물의 수
	private int totalCount;
	// 총 페이지 수
	private int totalPageCount;
	// 페이지 번호
	private int pageNo;
	// 게시판 페이징 처리시 '이전' 페이지가 있는지를 판별하는 변수
	private boolean firstRange;
	// 게시판 페이징 처리시 '다음' 페이지가 있는지를 판별하는 변수
	private boolean lastRange;
	// 한 페이지에 표시 될 게시물의 갯수
	private int listSize;
	// 페이징 처리시 한 구간의 페이지 갯수
	private int naviSize;
	
	private int startRow;
	
	private int endRow;
	
    public PageNavigation() {
        // 필드들의 기본값 또는 초기화 코드 작성
        this.newCount = 0;
        this.totalCount = 0;
        this.totalPageCount = 0;
        this.pageNo = 0;
        this.firstRange = false;
        this.lastRange = false;
        this.listSize = 0;
        this.naviSize = 0;
    }

	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public PageNavigation(Map<String, Object> map) {
	        int pageNo = (Integer) map.get("pageNo");
	        int listSize = (Integer) map.get("listSize");
	        this.startRow = (pageNo - 1) * listSize + 1;
	        this.endRow = pageNo * listSize;
	}
	public int getNewCount() {
		return newCount;
	}
	public void setNewCount(int newCount) {
		this.newCount = newCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public boolean isFirstRange() {
		return firstRange;
	}
	public void setFirstRange(boolean firstRange) {
		this.firstRange = firstRange;
	}
	public boolean isLastRange() {
		return lastRange;
	}
	public void setLastRange(boolean lastRange) {
		this.lastRange = lastRange;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getNaviSize() {
		return naviSize;
	}
	public void setNaviSize(int naviSize) {
		this.naviSize = naviSize;
	}

    
	@Override
	public String toString() {
	    StringBuffer sbHtml = new StringBuffer();

	    int startPageNo = (pageNo - 1) / naviSize * naviSize + 1;
	    int endPageNo = startPageNo + naviSize - 1;
	    if (endPageNo > totalPageCount) {
	        endPageNo = totalPageCount;
	    }

	    if (!this.isFirstRange()) {
	        sbHtml.append("<a class='pagination' id='prePage' href='' onclick='goPage(" + (startPageNo - 1) + "); return false;'>&lt;</a>");
	    }

	    sbHtml.append("<span class='pagination'>");
	    for (int i = startPageNo; i <= endPageNo; i++) {
	        sbHtml.append(" <a class='page-number' href='' onclick='goPage(" + i + "); return false;'>" + i + "</a>");
	    }
	    sbHtml.append("</span>");

	    if (!this.isLastRange()) {
	        sbHtml.append("<a class='pagination' id='nextPage' href='' onclick='goPage(" + (endPageNo + 1) + "); return false;'>&gt;</a>");
	    }

	    return sbHtml.toString();
	}
	
}
