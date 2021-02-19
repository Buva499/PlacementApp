package com.entity;


import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class Student {
	@Id
	private String prn;
	private String fname;
	private String mname;
	private String lname;
	private String spass;
	private String semail;
	private String gender;
	private String address;
	private String bday;
	private String branch;
	private String skill;
	private String sphone;
	private String hscmarks;
	private String sscmarks;
	private String diploma;
	private String ugmarks;
	private String dept;
	private boolean status;
	
	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getPrn() {
		return prn;
	}
	public void setPrn(String prn) {
		this.prn = prn;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getSpass() {
		return spass;
	}
	public void setSpass(String spass) {
		this.spass = spass;
	}
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBday() {
		return bday;
	}
	public void setBday(String bday) {
		this.bday = bday;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getSphone() {
		return sphone;
	}
	public void setSphone(String sphone) {
		this.sphone = sphone;
	}
	public String getHscmarks() {
		return hscmarks;
	}
	public void setHscmarks(String hscmarks) {
		this.hscmarks = hscmarks;
	}
	public String getSscmarks() {
		return sscmarks;
	}
	public void setSscmarks(String sscmarks) {
		this.sscmarks = sscmarks;
	}
	public String getDiploma() {
		return diploma;
	}
	public void setDiploma(String diploma) {
		this.diploma = diploma;
	}
	public String getUgmarks() {
		return ugmarks;
	}
	public void setUgmarks(String ugmarks) {
		this.ugmarks = ugmarks;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Student [prn=" + prn + ", fname=" + fname + ", mname=" + mname + ", lname=" + lname + ", spass=" + spass
				+ ", semail=" + semail + ", gender=" + gender + ", address=" + address + ", bday=" + bday + ", branch="
				+ branch + ", skill=" + skill + ", sphone=" + sphone + ", hscmarks=" + hscmarks + ", sscmarks="
				+ sscmarks + ", diploma=" + diploma + ", ugmarks=" + ugmarks + ", dept=" + dept + ", status=" + status
				+ "]";
	}
	
	
	
}
