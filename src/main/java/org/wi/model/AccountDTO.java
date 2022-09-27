package org.wi.model;

public class AccountDTO {
	private String id ;
	private String password  ;
	private String name;
	private String profile;
	private String job;
	private String number;
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
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
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "AccountDTO [id=" + id + ", password=" + password + ", name=" + name + ", profile=" + profile + ", job="
				+ job + ", number=" + number + "]";
	}
	
}
