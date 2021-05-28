package com.mall.wolmall.service;
import com.mall.wolmall.mapper.GoodsMapper;
import com.mall.wolmall.model.GoodsModel;
import com.mall.wolmall.model.ResultModel;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class GoodsServiceImpl implements GoodsService {

    private final GoodsMapper goodsMapper;

    @Override
    public ResultModel<List<GoodsModel>> getBestItems() {
        return new ResultModel<>(goodsMapper.getBestItems());
    }

    @Override
    public ResultModel<List<GoodsModel>> getAllGoods() {
        return new ResultModel<>(goodsMapper.getAllGoods());
    }


    @Override
    public ResultModel<List<GoodsModel>> getCategoryItems(long type) {
        return new ResultModel<>(goodsMapper.getCategoryItems(type));
    }


    @Override
    public ResultModel<GoodsModel> getGoodsDetail(long id) {
        GoodsModel goodsModel = new GoodsModel();

        List<GoodsModel> goodsModels = goodsMapper.getGoodsDetail(id);

        for (int i=0; i<goodsModels.size(); i++){
            goodsModel.getColors().add(goodsModels.get(i).getColor());
            goodsModel.getSizes().add(goodsModels.get(i).getSize());
        }

        goodsModel.setName(goodsModels.get(0).getName());
        goodsModel.setPrice(goodsModels.get(0).getPrice());
        goodsModel.setId(goodsModels.get(0).getId());
        goodsModel.setImgUrl(goodsModels.get(0).getImgUrl());


        return new ResultModel(goodsModel);
    }
}
