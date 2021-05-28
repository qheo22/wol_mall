package com.mall.wolmall.security.mapper;

import com.mall.wolmall.security.model.SecurityUser;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AuthMapper {
    @Select("SELECT U.ID ID, U.EMAIL EMAIL, U.NAME NAME, U.PASSWORD PASSWORD, U.ENABLE ENABLE, U.AVATAR_URL AVATAR_URL, R.NAME ROLE FROM USER U INNER JOIN USER_ROLE U_R ON U.ID = U_R.USER_ID INNER JOIN ROLE R ON R.ID = U_R.ROLE_ID WHERE U.EMAIL = #{email}")
    SecurityUser getUserFindById(String email);
}
