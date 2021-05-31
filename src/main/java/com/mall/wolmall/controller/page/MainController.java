package com.mall.wolmall.controller.page;


import com.mall.wolmall.model.*;
import com.mall.wolmall.service.GoodsService;
import com.mall.wolmall.service.MainService;
import com.mall.wolmall.service.OrderService;
import com.mall.wolmall.service.PropertyService;
import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Controller
@RequiredArgsConstructor
public class MainController {

    private final GoodsService goodsService;
    private final PropertyService propertyService;
    private final OrderService orderService;
    private final MainService mainService;



    @GetMapping({"", "/main"})
    public String main(Model model) throws Exception {
        HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null) {
             ip = req.getRemoteAddr();
        }

        int totalAccessor;

        Integer clientIpCnt = mainService.selectClientIpCnt(ip);
        // 조회한값이 없으면 0 즉 중복값이 존재한다면 이미 접속한거라면
        if(null == clientIpCnt){
            //쿼리에 인서트후 리턴값 뱉음
           int insertIpResult =  mainService.insertClientIp(ip);
           totalAccessor = mainService.selectTotalCnt();
        }else{
            totalAccessor = mainService.selectTotalCnt();
        }

        System.out.println("방문자수 3되야정상"+totalAccessor);

       String totalAccessorText =  Integer.toString(totalAccessor);

        int randomvalue;
        randomvalue = (int) (Math.random()*5+1);
        PropertyModel propertyModel = propertyService.getProperty();
        model.addAttribute("accessor",totalAccessorText);
        model.addAttribute("models",goodsService.getAllGoods().data);
        model.addAttribute("randomGoods",goodsService.getGoodsDetail(randomvalue).data);
        model.addAttribute("s3BaseUrl",propertyModel.getS3BaseUrl());
        return "main";
    }


    @GetMapping( "/category")
    public String category(Model model,@RequestParam(value = "type") long type) {

        PropertyModel propertyModel = propertyService.getProperty();
        model.addAttribute("s3BaseUrl",propertyModel.getS3BaseUrl());

        model.addAttribute("randomGoods");

        if(type == 0){
            model.addAttribute("models",goodsService.getBestItems().data);
        }  else{
            model.addAttribute("models",goodsService.getCategoryItems(type).data);
        }
        return "main";
    }



    @GetMapping("signUp")
    public String signUpPage() {
        return "sign_up";
    }


    @GetMapping("goodsDetail")
    public String goodsDetail(@RequestParam(value = "id") long id,Model model) {
        PropertyModel propertyModel = propertyService.getProperty();
        model.addAttribute("s3BaseUrl",propertyModel.getS3BaseUrl());
        GoodsModel goodsModel = goodsService.getGoodsDetail(id).data;
        model.addAttribute("goods", goodsModel);
        return "menu_detail";

    }

//
    @GetMapping("/order")
    public String order() {
        return "order";
    }



    @GetMapping("/cart")
    public String cart() {
        return "cart";
    }



    @GetMapping("/orderComplete")
    public String getOrder(@RequestParam(value = "id") int id
            ,Model model) {

        model.addAttribute("orderInfo",orderService.getOrderInfo(id));
        List<OrderGoodsModel> orderGoodsModels =  orderService.getOrderInfoGoodsList(id);
        model.addAttribute("orderInfoGoodsList",orderGoodsModels);


        return "order_complete";
    }


    @GetMapping("/orderSearch")
    public String orderSearch() {
        return "order_confirmation";
    }

}