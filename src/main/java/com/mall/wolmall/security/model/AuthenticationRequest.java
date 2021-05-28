package com.mall.wolmall.security.model;


import lombok.Data;

@Data
public class AuthenticationRequest {

    private String username;
    private String password;
    private String providerToken;
    private int socialType;

    AuthenticationRequest(){}

    public AuthenticationRequest(String username, String password, String providerToken, int socialType) {
        this.username = username;
        this.password = password;
        this.providerToken = providerToken;
        this.socialType = socialType;
    }
}
