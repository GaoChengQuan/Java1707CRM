package com.situ.crm.common;
/**
 * status对应的状态 
 */
public enum ResponseCode {
	SUCCESS(0, "SUCCESS"),
	ERROR(1, "ERROR"),
	NEED_LOGIN(2, "NEED_LOGIN");
	
	private int code;
	private String desc;
	
	private ResponseCode(int code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	public int getCode() {
		return code;
	}

	public String getDesc() {
		return desc;
	}
}
