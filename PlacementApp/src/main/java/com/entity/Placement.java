package com.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Placement {
	@Id
	private String prn;
	private String fname;
	private String lname;
	private String semail;
	private String date;
	private String cname;
	private String role;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Placement(String prn, String fname, String lname, String semail, String date, String cname, String role) {
		super();
		this.prn = prn;
		this.fname = fname;
		this.lname = lname;
		this.semail = semail;
		this.date = date;
		this.cname = cname;
		this.role = role;
	}
	public Placement() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
