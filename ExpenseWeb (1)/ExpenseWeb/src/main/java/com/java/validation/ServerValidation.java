package com.java.validation;

import org.springframework.stereotype.Component;


public class ServerValidation {
	private String loginError;
	private String isValidUser;
	private String isValidMobile;
	private String isValidEmail;
	public String getLoginError() {
		return loginError;
	}
	public void setLoginError(String loginError) {
		this.loginError = loginError;
	}

	public String getIsValidUser() {
		return isValidUser;
	}
	public void setIsValidUser(String isValidUser) {
		this.isValidUser = isValidUser;
	}
	public String getIsValidMobile() {
		return isValidMobile;
	}
	public void setIsValidMobile(String isValidMobile) {
		this.isValidMobile = isValidMobile;
	}
	public String getIsValidEmail() {
		return isValidEmail;
	}
	public void setIsValidEmail(String isValidEmail) {
		this.isValidEmail = isValidEmail;
	}
}
