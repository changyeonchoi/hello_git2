package com.main.vo;

public class HeartVo {

    private String user_id;
    private Integer seq_id;
    private Integer heart;
    private String type;
    
    
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public Integer getHeart() {
		return heart;
	}
	public void setHeart(Integer heart) {
		this.heart = heart;
	}
	
	@Override
	public String toString() {
		return "HeartVo [user_id=" + user_id + ", seq_id=" + seq_id + ", heart=" + heart + "]";
	}

}