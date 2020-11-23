package com.mall.wol.service;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.wol.model.Mall_MemberDTO;

@Service
public class SignUpService {

	@Autowired
	SignUpDao dao;
	
	//회원가입 아이디 중복체크
	public String check_id(String user_id) {
		return dao.check_id(user_id);
	}
	//회원가입 이메일 중복체크
	public String check_email(String email) {
		return dao.check_email(email);
	}
	
	
	public int  sign_up(Mall_MemberDTO dto) {
		return dao.sign_up(dto);
	} 

}