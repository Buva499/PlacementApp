package com.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Admin {
	@Id
	private String adminId;

	private String adminPass;

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPass() {
		return adminPass;
	}

	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}

	public Admin(String adminId, String adminPass) {
		super();
		
		this.adminId = adminId;
		this.adminPass = adminPass;
	}

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

}
