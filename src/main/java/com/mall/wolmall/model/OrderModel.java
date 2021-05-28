package com.mall.wolmall.model;

import lombok.Data;
import org.springframework.security.core.parameters.P;

import java.util.List;
import java.util.TreeSet;


@Data
public class OrderModel {

    private int id;
    private String name;
    private int number;
    private String address;
    private String detailAddress;
    private String email;
    private int PostCode;
    private String message;
    private String orderCode;
    private String orderBuyDay;
}
