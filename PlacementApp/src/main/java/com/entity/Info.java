package com.entity;

import javax.persistence.Entity;

import javax.persistence.Id;

@Entity
public class Info {
	
	@Id
	private int infoId;
	private String prn;
	private String cname;
	private String fname;
	private String lname;
	private String semail;
	private String branch;
	private String hscmarks;
	private String sscmarks;
	private String diploma;
	private String ugmarks;
	
	public String getPrn() {
		return prn;
	}
	public void setPrn(String prn) {
		this.prn = prn;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
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
	public int getInfoId() {
		return infoId;
	}
	public void setInfoId(int infoId) {
		this.infoId = infoId;
	}
	
	
	
}
