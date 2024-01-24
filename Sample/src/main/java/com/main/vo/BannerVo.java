package com.main.vo;


public class BannerVo {

	//pk
	private Integer seq_id;
	//배너명
	private String banner_name;
	//파일 이미지
	private String banner_img;
	//노출영역1
	private String banner_area1;
	//노출영역2
	private String banner_area2;
	//노출여부
	private String banner_yn;
	//회원ID
	private String user_id;
	//등록일
	private String redate;
	//CODE
	private String code;
	//랜딩_URL
	private String land_url;
	//상품 pk
	private Integer product_seq_id;
	//세일
	private String sale;
	
	
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public Integer getSeq_id() {
		return seq_id;
	}
	public void setSeq_id(Integer seq_id) {
		this.seq_id = seq_id;
	}
	public String getBanner_name() {
		return banner_name;
	}
	public void setBanner_name(String banner_name) {
		this.banner_name = banner_name;
	}
	public String getBanner_img() {
		return banner_img;
	}
	public void setBanner_img(String banner_img) {
		this.banner_img = banner_img;
	}
	public String getBanner_area1() {
		return banner_area1;
	}
	public void setBanner_area1(String banner_area1) {
		this.banner_area1 = banner_area1;
	}
	public String getBanner_area2() {
		return banner_area2;
	}
	public void setBanner_area2(String banner_area2) {
		this.banner_area2 = banner_area2;
	}
	public String getBanner_yn() {
		return banner_yn;
	}
	public void setBanner_yn(String banner_yn) {
		this.banner_yn = banner_yn;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getLand_url() {
		return land_url;
	}
	public void setLand_url(String land_url) {
		this.land_url = land_url;
	}
	public Integer getProduct_seq_id() {
		return product_seq_id;
	}
	public void setProduct_seq_id(Integer product_seq_id) {
		this.product_seq_id = product_seq_id;
	}
	
	@Override
	public String toString() {
		return "BannerVo [seq_id=" + seq_id + ", banner_name=" + banner_name + ", banner_img=" + banner_img
				+ ", banner_area1=" + banner_area1 + ", banner_area2=" + banner_area2 + ", banner_yn=" + banner_yn
				+ ", user_id=" + user_id + ", redate=" + redate + ", code=" + code + ", land_url=" + land_url
				+ ", product_seq_id=" + product_seq_id + ", sale=" + sale + "]";
	}
	


}
