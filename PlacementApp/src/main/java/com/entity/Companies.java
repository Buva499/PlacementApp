package com.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Companies {
	@Id
	private String cname;
	private String cpass;
	private String criteria;
	private String role;
	private String date;
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCpass() {
		return cpass;
	}
	public void setCpass(String cpass) {
		this.cpass = cpass;
	}
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Companies(String cname, String cpass, String criteria, String role, String date) {
		super();
		this.cname = cname;
		this.cpass = cpass;
		this.criteria = criteria;
		this.role = role;
		this.date = date;
	}
	public Companies() {
		super();
		// TODO Auto-generated constructor stub
	}

}
