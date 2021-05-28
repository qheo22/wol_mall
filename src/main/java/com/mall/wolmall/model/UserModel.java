package com.mall.wolmall.model;

import lombok.Data;

@Data
public class UserModel {
    private long id;
    private String email;
    private String name;
    private String role;
    private String avatarUrl;
    private String countryCode;
    private int social;
    private String socialToken;
}
