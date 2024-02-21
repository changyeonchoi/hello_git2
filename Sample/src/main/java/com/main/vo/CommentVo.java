package com.main.vo;

public class CommentVo {
	//게시판 댓글
    private Integer comment_id;
    
    private Integer seq_id;
    
    private String comment_content;
    
    private String comment_regdate;
    
    private String user_id;
    
    private String code;

    private int rnum;
    
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public Integer getSeq_id() {
		return seq_id;
	}
	public void setSeq_id(Integer seq_id) {
		this.seq_id = seq_id;
	}
	public Integer getComment_id() {
		return comment_id;
	}
	public void setComment_id(Integer comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(String comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "CommentVo [comment_id=" + comment_id + ", seq_id=" + seq_id + ", comment_content=" + comment_content
				+ ", comment_regdate=" + comment_regdate + ", user_id=" + user_id + ", code=" + code + "]";
	}
	
	
}
