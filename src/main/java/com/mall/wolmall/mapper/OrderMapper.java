package com.mall.wolmall.mapper;

import com.mall.wolmall.model.GoodsModel;
import com.mall.wolmall.model.OrderGoodsModel;
import com.mall.wolmall.model.OrderModel;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OrderMapper {


    @Insert("INSERT INTO `order` (name,number,address,detailAddress,postcode,email,message,orderCode,orderBuyDay) VALUES( #{name}, #{number}, #{address}, #{detailAddress}, #{postCode}, #{email}, #{message}, #{orderCode},#{orderBuyDay})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insertOrder(OrderModel orderModel);


    @Insert("INSERT INTO order_goods (name,size,color,price,count,order_id,imgUrl,goodsId) VALUES( #{name}, #{size}, #{color}, #{price}, #{count}, #{orderId} , #{imgUrl} , #{goodsId} )")
    void insertOrderGoodsModel(OrderGoodsModel orderGoodsModel);

    @Select("SELECT * from `order` where id = #{id}")
    OrderModel getOrderInfo(int id);

    @Select("SELECT * from order_goods where  order_id = #{id}")
    List<OrderGoodsModel> getOrderInfoGoodsList(int id);

    @Select("SELECT * from `order` where orderCode = #{orderCode}" )
    OrderModel requestOrderInfo(String orderCode);
}
