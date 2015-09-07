package com.bit.mymarket.vo;

public class BoardVo {

	private Long no;
	private String title;
	private String content;
/*
	private String WISH_ITEM_TAG;
	private String trade_category;
	private String item_condition;
	private Integer price;
	private String location;
*/
	private Long userNo;
	private String userName;
	private Long viewCnt;
	private String regDate;
	private Integer replycount;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Long getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(Long viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public Integer getReplycount() {
		return replycount;
	}
	public void setReplycount(Integer replycount) {
		this.replycount = replycount;
	}
	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", title=" + title + ", content="
				+ content + ", userNo=" + userNo + ", userName=" + userName
				+ ", viewCnt=" + viewCnt + ", regDate=" + regDate
				+ ", replycount=" + replycount + "]";
	}
	
	
	
}
