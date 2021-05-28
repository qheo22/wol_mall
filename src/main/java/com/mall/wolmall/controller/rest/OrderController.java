package com.mall.wolmall.controller.rest;

import com.mall.wolmall.controller.CommonUtils;
import com.mall.wolmall.model.ListResultModel;
import com.mall.wolmall.model.OrderGoodsModel;
import com.mall.wolmall.model.OrderModel;
import com.mall.wolmall.service.GoodsService;
import com.mall.wolmall.service.OrderService;
import com.mall.wolmall.service.PropertyService;

import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequiredArgsConstructor
public class OrderController {

    private final GoodsService goodsService;
    private final PropertyService propertyService;
    private final OrderService orderService;


    @PostMapping("/insertOrder.do")
    @ResponseBody
    public int orderComplete(OrderModel orderModel, HttpServletRequest request, @RequestParam("numberText") int number, @RequestParam("postCodeText") int postCode) {

        String orderCode = CommonUtils.getUniqueId();


        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String orderBuyDay = simpleDateFormat.format(timestamp);

        orderModel.setNumber(number);
        orderModel.setPostCode(postCode);
        orderModel.setOrderCode(orderCode);
        orderModel.setOrderBuyDay(orderBuyDay);


        String[] goodsIds = request.getParameterValues("goodsId");
        String[] goodsNames = request.getParameterValues("goodsName");
        String[] goodsSizes = request.getParameterValues("goodsSize");
        String[] goodsColors = request.getParameterValues("goodsColor");
        String[] goodsPrices = request.getParameterValues("goodsPrice");
        String[] goodsCounts = request.getParameterValues("goodsCount");
        String[] goodsImgUrls = request.getParameterValues("goodsImgUrl");


        orderService.insertOrder(orderModel);


        ArrayList arrayList = new ArrayList();

        for(int i = 0 ; i < goodsNames.length ; i++) {
            OrderGoodsModel orderGoodsModel = new OrderGoodsModel();
            orderGoodsModel.setGoodsId(goodsIds[i]);
            orderGoodsModel.setName(goodsNames[i]);
            orderGoodsModel.setSize(goodsSizes[i]);
            orderGoodsModel.setColor(goodsColors[i]);
            orderGoodsModel.setPrice(goodsPrices[i]);
            orderGoodsModel.setCount(goodsCounts[i]);
            orderGoodsModel.setOrderId(orderModel.getId());
            orderGoodsModel.setImgUrl(goodsImgUrls[i]);
            orderService.insertOrderGoodsModel(orderGoodsModel);
        }
        System.out.println(arrayList.size());

        return orderModel.getId();
    }


    @PostMapping("requestOrderInfo.do")
    @ResponseBody
    public ListResultModel<Object> requestOrderInto(@RequestParam("orderCode") String orderCode) {
        List<OrderGoodsModel> orderGoodsModelList;
        OrderModel orderModel = orderService.requestOrderInfo(orderCode);
        if(null == orderModel.getAddress()) {
            return null;
        } else {
            int goodsId = orderModel.getId();
            orderGoodsModelList = orderService.getOrderInfoGoodsList(goodsId);
        }
        return new ListResultModel<>(orderModel, orderGoodsModelList);
    }
}


//    @GetMapping("/whiskyAsk.do")
//    public BaseResultModel<?> whiskyAsk(@RequestParam(value = "id") long id) {
//        return findService.getAskWhisky(id);
//    }

