package com.bit.mymarket.vo;

public class UserVo {
	private Long no;
	private String phoneNumber;
	private String userName;
	private String email;
	private String password;
	private String gender;
	private String memberType;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	@Override
	public String toString() {
		return "UserVo [no=" + no + ", phoneNumber=" + phoneNumber
				+ ", userName=" + userName + ", email=" + email + ", password="
				+ password + ", gender=" + gender + ", memberType="
				+ memberType + "]";
	}
	
	
	

}
