package com.suamall.project.dto;

import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
public class MemberDTO {
	@Pattern(regexp = "^[a-zA-Z0-9_]{6,20}$")
	private String member_id;
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,20}$")
	private String member_pw;
	private String member_pwCheck;
	private String member_nm;
	@Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
	private String member_email;
	@Min(10000000)
	private int member_birth;
	@Pattern(regexp = "^\\d{11}$")
	private String member_phone_num;
	private String member_zip_code;
	private String member_address ;
	private String member_address_detail;
	private int member_login_type ;
	
}
