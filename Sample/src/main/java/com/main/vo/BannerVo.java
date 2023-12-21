package com.main.vo;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class BannerVo {

	//pk
	private String seq_id;
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

	public String getLand_url() {
		return land_url;
	}

	public void setLand_url(String land_url) {
		this.land_url = land_url;
	}

	public String getSeq_id() {
		return seq_id;
	}

	public void setSeq_id(String seq_id) {
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
	

//	public void setBanner_img(MultipartFile file, String uploadPath, String banner_img) throws IOException {
//		if (file != null && !file.isEmpty()) {
//			// 새로운 파일이 전달된 경우
//			String originalFileName = file.getOriginalFilename();
//			String filePath = uploadPath + originalFileName;
//			file.transferTo(new File(filePath));
//			this.banner_img = filePath;
//		} else {
//			this.banner_img = getBanner_img();
//		}
//	}


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

	@Override
	public String toString() {
		return "BannerVo [seq_id=" + seq_id + ", banner_name=" + banner_name + ", banner_img=" + banner_img
				+ ", banner_area1=" + banner_area1 + ", banner_area2=" + banner_area2 + ", banner_yn=" + banner_yn
				+ ", user_id=" + user_id + ", redate=" + redate + ", code=" + code + ", land_url=" + land_url + "]";
	}

}
