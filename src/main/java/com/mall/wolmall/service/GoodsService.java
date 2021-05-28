package com.mall.wolmall.service;

import com.mall.wolmall.model.GoodsModel;
import com.mall.wolmall.model.ResultModel;

import java.util.List;

public interface GoodsService {


    ResultModel<List<GoodsModel>> getBestItems();

    ResultModel<List<GoodsModel>> getAllGoods();

    ResultModel<List<GoodsModel>> getCategoryItems(long type);

    ResultModel<GoodsModel> getGoodsDetail(long id);

}
