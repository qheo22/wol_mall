package com.mall.wol.service;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.mall.wol.model.MallitemDTO;


public class MallitemDAO extends SqlSessionDaoSupport{
	
	
	//아이템 가져오기.
	public List<MallitemDTO> select_item(String kinds) {
		return getSqlSession().selectList("mall.select_item",kinds);
	}
	
	public MallitemDTO select_item(int item_code) {
		return getSqlSession().selectOne("mall.select_item",item_code);
	}
	
	//아이템 업데이트
	public void item_insert(MallitemDTO Dto) {
		getSqlSession().insert("mall.item_up", Dto);
	}
}
