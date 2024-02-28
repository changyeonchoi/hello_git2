package com.main.vo;

public class SearchVo {
	
	//pk
	private Integer seq_id;
	
	private String product_name;
	
	private String search;

	private Integer cnt;
	
	private String keyword;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getSeq_id() {
		return seq_id;
	}

	public void setSeq_id(Integer seq_id) {
		this.seq_id = seq_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public Integer getCnt() {
		return cnt;
	}

	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "SearchVo [seq_id=" + seq_id + ", product_name=" + product_name + ", search=" + search + ", cnt=" + cnt
				+ ", keyword=" + keyword + "]";
	}

}
