package com.mall.wolmall.service;

import com.mall.wolmall.model.GoodsModel;
import com.mall.wolmall.model.ResultModel;

import java.util.List;

public interface MainService {

    Integer selectClientIpCnt(String ip);

    int insertClientIp(String ip);

    int selectTotalCnt();

}
