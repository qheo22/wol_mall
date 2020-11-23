package com.mall.wol.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.wol.model.Mall_MemberDTO;
import com.mall.wol.service.SignUpDao;
import com.mall.wol.service.SignUpService;

@Controller
public class SignUpController {
	@Autowired
	SignUpDao dao;	
	@Autowired
	SignUpService service;
	


	
	@RequestMapping(value = "sign_up_form.do")
	public String main() {
		return "sign_up_form";
	}


	@RequestMapping(value="check_id.do",method = RequestMethod.POST)
	@ResponseBody
	 public String id_check(String user_id) {
		String db_id = service.check_id(user_id);
		return db_id;
	}
	
	
	@RequestMapping(value="check_email.do",method = RequestMethod.POST)
	@ResponseBody
	 public String eamil_check(String email) {
		String db_eamil = service.check_email(email);
		return db_eamil;
	}


	@RequestMapping(value = "sign_up.do")
	public String sign_up(Mall_MemberDTO dto,Model m) {
		int check = service.sign_up(dto);
		m.addAttribute("check", check);
		return "joinalert";
	}
	
}
