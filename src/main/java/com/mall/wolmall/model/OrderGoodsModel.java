package com.mall.wolmall.model;

import lombok.Data;

import java.util.List;


@Data
public class OrderGoodsModel {

    private String name;
    private String size;
    private String color;
    private String price;
    private String count;
    private int orderId;
    private String goodsId;
    private String imgUrl;

//    public List<OrderGoodsModel> orderGoodsModelList ;
}
