package com.mall.wolmall.service;
import com.mall.wolmall.mapper.GoodsMapper;
import com.mall.wolmall.mapper.OrderMapper;
import com.mall.wolmall.model.GoodsModel;
import com.mall.wolmall.model.OrderGoodsModel;
import com.mall.wolmall.model.OrderModel;
import com.mall.wolmall.model.ResultModel;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderMapper orderMapper;


    @Override
    public int insertOrder(OrderModel orderModel) {
       return orderMapper.insertOrder(orderModel);
    }

    @Override
    public void insertOrderGoodsModel(OrderGoodsModel orderGoodsModel) {
        orderMapper.insertOrderGoodsModel(orderGoodsModel);
    }

    @Override
    public OrderModel getOrderInfo(int id) {
        return  orderMapper.getOrderInfo(id);
    }

    @Override
    public OrderModel requestOrderInfo(String orderCode) {
        return orderMapper.requestOrderInfo(orderCode);
    }

    @Override
    public List<OrderGoodsModel> getOrderInfoGoodsList(int id) {
        return orderMapper.getOrderInfoGoodsList(id);
    }
}
