package com.main.vo;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class QnaVo {

	//pk
	private Integer seq_id;
	//등록일
	private String regdate;
	//타이틀
	private String qna_title;
	//이미지
	private String file_img;
	//내용
	private String qna_detail;
	//찜 여부
	private String qna_like_yn;
	//등록자ID
	private String user_id;
	//fashionID
	private String fashion_user_id;
	//no
	private int rnum;
	//code
	private String code;
	
	private String file_Path;
	
	private String qna_pw;
	
	private int heartcount;
	
	

	public int getHeartcount() {
		return heartcount;
	}
	public void setHeartcount(int heartcount) {
		this.heartcount = heartcount;
	}
	public String getQna_pw() {
		return qna_pw;
	}
	public void setQna_pw(String qna_pw) {
		this.qna_pw = qna_pw;
	}
	public String getFile_Path() {
		return file_Path;
	}
	public void setFile_Path(String file_Path) {
		this.file_Path = file_Path;
	}
	public String getFile_img() {
		return file_img;
	}
	public void setFile_img(String file_img) {
		this.file_img = file_img;
	}

	public void setFile_img(MultipartFile file, String uploadPath, String file_img) throws IOException {
	    // 만약 전달된 파일이 존재하고 비어있지 않다면
	    if (file != null && !file.isEmpty()) {
	        // 새로운 파일이 전달된 경우

	        // 전달된 파일의 원본 파일명을 가져옴
	        String originalFileName = file.getOriginalFilename();
	        
	        // 파일을 저장할 경로를 지정 (uploadPath + 원본 파일명)
	        String filePath = uploadPath + originalFileName;
	        
	        // 파일을 지정된 경로에 저장
	        file.transferTo(new File(filePath));
	        
	        // 객체 내의 file_img 변수에 저장된 파일 경로를 업데이트
	        this.file_img = filePath;
	    } else {
	        // 전달된 파일이 없거나 비어있는 경우

	        // 기존의 file_img 변수 값을 유지
	        this.file_img = getFile_img();
	    }
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getFashion_user_id() {
		return fashion_user_id;
	}
	public void setFashion_user_id(String fashion_user_id) {
		this.fashion_user_id = fashion_user_id;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Integer getSeq_id() {
		return seq_id;
	}
	public void setSeq_id(Integer seq_id) {
		this.seq_id = seq_id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_detail() {
		return qna_detail;
	}
	public void setQna_detail(String qna_detail) {
		this.qna_detail = qna_detail;
	}
	public String getQna_like_yn() {
		return qna_like_yn;
	}
	public void setQna_like_yn(String qna_like_yn) {
		this.qna_like_yn = qna_like_yn;
	}
	@Override
	public String toString() {
		return "QnaVo [seq_id=" + seq_id + ", regdate=" + regdate + ", qna_title=" + qna_title + ", file_img="
				+ file_img + ", qna_detail=" + qna_detail + ", qna_like_yn=" + qna_like_yn + ", user_id=" + user_id
				+ ", fashion_user_id=" + fashion_user_id + ", rnum=" + rnum + ", code=" + code + ", file_Path="
				+ file_Path + ", qna_pw=" + qna_pw + ", heartcount=" + heartcount + "]";
	}


	
}
