package com.mall.wolmall.mapper;

import com.mall.wolmall.model.GoodsModel;
import com.mall.wolmall.model.OrderGoodsModel;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MainMapper {

    @Select("select * from accessor where accessor = #{ip}")
    Integer selectIp(String ip);

    @Insert("INSERT INTO accessor (accessor) VALUES( #{ip} )")
    Integer insertAccessorIp(String ip);

    @Select("select count(*) from accessor")
    int selectTotalCnt();
}
