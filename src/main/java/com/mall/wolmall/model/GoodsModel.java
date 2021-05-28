package com.mall.wolmall.model;

import lombok.Data;


import java.util.LinkedHashSet;
import java.util.List;
import java.util.TreeSet;


@Data
public class GoodsModel {

    private long id;
    private String name;
    private int price;
    private int orderCount;
    private String imgUrl;
    private String size;
    private String color;
    private LinkedHashSet<String> colors = new LinkedHashSet<>();
    private LinkedHashSet<String> sizes = new LinkedHashSet<>();
}
