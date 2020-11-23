package com.mall.wol.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.mall.wol.model.Mall_MemberDTO;

import com.mall.wol.service.LoginDao;
import com.mall.wol.service.LoginService;


@Controller
public class LoginController {


	Mall_MemberDTO dto;
	@Autowired
	LoginService service;
	@Autowired
	LoginDao dao;
	
	int idcheck;
	
	
	
		@RequestMapping("loginform.do")
		   public String loginfrom() {
			if(idcheck == 1){
				return "redirect:mypage.do";
				}
				else{
				return "login_page";
			}
		}
		
		
		
		@RequestMapping("mypage.do")
		   public String mypage(HttpSession Session,Mall_MemberDTO dto,Model m) {
			String user_id = (String) Session.getAttribute("user_id");
			dto = service.select_userinfo(user_id);
			m.addAttribute("dto",dto);
			System.out.println("로그인한 회원의 추가적립금액은"+dto.getBenefits());
			return "mypage";
			} 
		
		
		

		@RequestMapping(value = "login.do", method = RequestMethod.POST)
		@ResponseBody
		public int main(String user_id, String pw, HttpSession Session) {
			HashMap<String, String> m = new HashMap<String, String>();
			m.put("user_id", user_id);
			m.put("password", pw);
			String User_iddb = service.checkidpw(m);
			if (User_iddb != null && User_iddb.equals(user_id)) {
				idcheck = 1;
				Session.setAttribute("user_id", user_id);
			} else {
				idcheck = 0;
			}
			return idcheck;
		}
		

	@RequestMapping("loginok.do")
		   public String loginok() {
		      return "loginok";
		   }
	
	@RequestMapping("logout.do")
	   public String logout(HttpSession Session) {
		idcheck = 0;
		Session.invalidate();
	      return "login_page";
	   }
}
