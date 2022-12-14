package org.wi.model;

public class AccountDTO {
	private String id ;
	private String password  ;
	private String name;
	private String email;
	private String number;
	private String mailkey;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getMailkey() {
		return mailkey;
	}
	public void setMailkey(String mailkey) {
		this.mailkey = mailkey;
	}
	@Override
	public String toString() {
		return "AccountDTO [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", number="
				+ number + ", mailkey=" + mailkey + "]";
	}
	
}
