package com.mall.wolmall.service;

import com.mall.wolmall.model.GoodsModel;
import com.mall.wolmall.model.OrderGoodsModel;
import com.mall.wolmall.model.OrderModel;
import com.mall.wolmall.model.ResultModel;

import java.util.List;

public interface OrderService {

    int insertOrder(OrderModel orderModel);

    void insertOrderGoodsModel(OrderGoodsModel orderGoodsModel);

    OrderModel getOrderInfo(int id);

    OrderModel  requestOrderInfo(String orderCode);

    List<OrderGoodsModel> getOrderInfoGoodsList(int id);

}
