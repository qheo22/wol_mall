package com.mall.wol.controller;

import java.io.File;
import java.io.IOException;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;


import com.mall.wol.model.MallitemDTO;
import com.mall.wol.service.MallitemService;


@Controller
public class DataController {

	@Autowired
	MallitemService service;
	@Autowired
	MallitemService mservice;

	//신규 아이템 업데이트
	@RequestMapping(value = "/insert.do")
	public String insertBook(MallitemDTO Dto, MultipartFile up_file,
			HttpServletRequest request) {
		// 이미지 경로 저장위치에 따라 바꿔야함
		String path = request.getSession().getServletContext().getRealPath("/resources/");
		System.out.println(path);
		String alterpath = "resources\\Images\\"+Dto.getItem_kinds()+"\\";

		File file = new File(path);

		if (!file.exists()) {
			file.mkdirs();
		}		
		System.out.println("업로드된 파일명은"+up_file.getOriginalFilename());

		path += "images\\"+Dto.getItem_kinds()+"\\" + up_file.getOriginalFilename();
		alterpath += up_file.getOriginalFilename();

		file = new File(path);

		try {
			up_file.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}	
		Dto.setItem_path(alterpath);
		service.item_insert(Dto);
		
		return "layouts-tiles";
	}
	
	
}
