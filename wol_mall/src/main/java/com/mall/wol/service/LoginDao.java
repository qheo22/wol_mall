package com.mall.wol.service;



import java.util.HashMap;


import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.mall.wol.model.Mall_MemberDTO;


public class LoginDao extends SqlSessionDaoSupport {
	
	
	//아이디 비밀번호 확인
	public String checkidpw(HashMap<String, String> m) {
		return getSqlSession().selectOne("mall.checkidpw",m);
	}
	
	
	//아이디 비밀번호 확인
	public Mall_MemberDTO select_userinfo(String user_id) {
		return getSqlSession().selectOne("mall.select_userinfo",user_id);
	}
	
	public int namemailcheck(HashMap<String, String> m) {
		return getSqlSession().selectOne("sign.namemailcheck",m);
	}
	
	public int pwupdate(Mall_MemberDTO dto) {
		return getSqlSession().insert("sign.pwupdate",dto);
	}
	
	public Mall_MemberDTO profileselect(String userid) {
		return getSqlSession().selectOne("sign.profileselect",userid);
	}
	

	public int profileupdate(Mall_MemberDTO dto) {
		return getSqlSession().update("sign.profileupdate",dto);
	}
	

}
