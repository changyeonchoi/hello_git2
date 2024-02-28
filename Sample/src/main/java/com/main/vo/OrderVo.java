package com.main.vo;

public class OrderVo {
	
	private Integer seq_id;

	private String product_name;
	
	private String user_id;
	
	private String regdate;

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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "OrderVo [seq_id=" + seq_id + ", product_name=" + product_name + ", user_id=" + user_id + ", regdate="
				+ regdate + "]";
	}
	
	
}
