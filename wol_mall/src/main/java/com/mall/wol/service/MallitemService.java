package com.mall.wol.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mall.wol.model.MallitemDTO;

@Service
public class MallitemService {

	@Autowired
	MallitemDAO Mdao;

	public List<MallitemDTO> select_item(String kinds) {
		return Mdao.select_item(kinds);
	}
	
	public MallitemDTO select_item(int item_codes) {
		return Mdao.select_item(item_codes);
	} 
	
	
	public void item_insert(MallitemDTO Dto) {
		Mdao.item_insert(Dto);
	}
	
}