package com.mall.wol.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.wol.model.Mall_MemberDTO;

@Service
public class LoginService {

	@Autowired
	LoginDao dao;

	public String checkidpw(HashMap<String, String> m) {
		return dao.checkidpw(m);
	} 
	
	
	//로그인된 회원정보 가져오기
	public Mall_MemberDTO select_userinfo(String user_id) {
		return dao.select_userinfo(user_id);
	} 
	
	
	public int namemailcheck(HashMap<String, String> m) {
		return dao.namemailcheck(m);
	}
	
	public int pwupdate(Mall_MemberDTO dto) {
		return dao.pwupdate(dto);
	}
	
	public Mall_MemberDTO profileselect(String userid) {
		return dao.profileselect(userid);
	}
	
	public int profileupdate(Mall_MemberDTO dto) {
		return dao.profileupdate(dto);
	}
	
}