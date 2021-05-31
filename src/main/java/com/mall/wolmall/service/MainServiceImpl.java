package com.mall.wolmall.service;

import com.mall.wolmall.mapper.MainMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {

    private final MainMapper mainMapper;

    @Override
    public Integer selectClientIpCnt(String ip) {
        return mainMapper.selectIp(ip);
    }

    @Override
    public int insertClientIp(String ip) {
        return mainMapper.insertAccessorIp(ip);
    }

    @Override
    public int selectTotalCnt() {
        return mainMapper.selectTotalCnt();
    }
}
