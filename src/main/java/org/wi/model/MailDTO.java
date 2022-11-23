package org.wi.model;

public class MailDTO {
	private String mailkey;

	public String getMailkey() {
		return mailkey;
	}

	public void setMailkey(String mailkey) {
		this.mailkey = mailkey;
	}

	@Override
	public String toString() {
		return "MailDTO [mailkey=" + mailkey + ", getMailkey()=" + getMailkey() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
