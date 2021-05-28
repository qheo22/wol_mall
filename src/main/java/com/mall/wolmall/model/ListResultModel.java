package com.mall.wolmall.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ListResultModel<Object> {

    public OrderModel orderInfo;
    public List<OrderGoodsModel> orderGoodsList;

    public ListResultModel(OrderModel orderInfo,List<OrderGoodsModel> orderGoodsList) {
        this.orderInfo = orderInfo;
        this.orderGoodsList = orderGoodsList;
    }
}
