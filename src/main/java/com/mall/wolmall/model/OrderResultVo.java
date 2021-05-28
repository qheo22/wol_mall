package com.mall.wolmall.model;

import lombok.Data;

import java.util.List;


@Data
public class OrderResultVo {

    private int id;
    private String name;
    private int number;
    private String address;
    private String detailAddress;
    private String email;
    private int PostCode;
    private String message;
    private String orderCode;
    private List<OrderGoodsModel> orderGoodsModelList;
}
