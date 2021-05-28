package com.mall.wolmall.security.service;

import com.mall.wolmall.security.model.SecurityUser;

public interface UserService {
    SecurityUser getUserFindById(String email);
}
