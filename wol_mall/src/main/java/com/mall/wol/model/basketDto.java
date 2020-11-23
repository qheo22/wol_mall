package com.mall.wol.model;


public class basketDto {
	private String item_size;
	private String item_color;
	private String item_price;
	private String item_count;
	private String item_name;
	
	
	
	public basketDto(String item_size, String item_color, String item_price, String item_count, String item_name) {
		super();
		this.item_size = item_size;
		this.item_color = item_color;
		this.item_price = item_price;
		this.item_count = item_count;
		this.item_name = item_name;
	}


	public basketDto() {
	}


	public String getItem_size() {
		return item_size;
	}


	public void setItem_size(String item_size) {
		this.item_size = item_size;
	}


	public String getItem_color() {
		return item_color;
	}


	public void setItem_color(String item_color) {
		this.item_color = item_color;
	}


	public String getItem_price() {
		return item_price;
	}


	public void setItem_price(String item_price) {
		this.item_price = item_price;
	}


	public String getItem_count() {
		return item_count;
	}


	public void setItem_count(String item_count) {
		this.item_count = item_count;
	}


	public String getItem_name() {
		return item_name;
	}


	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}



	

}