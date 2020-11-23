package com.mall.wol.service;




import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.mall.wol.model.Mall_MemberDTO;


public class SignUpDao extends SqlSessionDaoSupport {
	
	
	//회원가입중 아이디체크
	public String check_id(String user_id) {
		return getSqlSession().selectOne("mall.check_id",user_id);
	}
	//회원가입중 이메일 체크
	public String check_email(String email) {
		return getSqlSession().selectOne("mall.check_email",email);
	}
	
	//회원가입
	public int sign_up(Mall_MemberDTO dto) {
		return getSqlSession().insert("mall.sign_up",dto);
	}
	
	
	
	public void pwupdate(Mall_MemberDTO dto) {
		getSqlSession().insert("sign.pwupdate",dto);
	}
}
