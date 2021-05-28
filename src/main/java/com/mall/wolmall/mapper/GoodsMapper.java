package com.mall.wolmall.mapper;

import com.mall.wolmall.model.GoodsModel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface GoodsMapper {

    @Select("SELECT * FROM goods limit 8")
    List<GoodsModel> getAllGoods();

    @Select("select * from goods order by ordercount desc limit 8")
    List<GoodsModel> getBestItems();


    @Select("select a.id , a.name,a.price,a.imgUrl,b.color,c.size from goods a join color b on a.id = b.goodsid join size c on b.goodsid = c.goodsid where a.id =  #{id}")
    List<GoodsModel> getGoodsDetail(long id);

    @Select("SELECT * FROM goods where goodstype = #{type}")
    List<GoodsModel> getCategoryItems(long type);


}
