package com.mall.wolmall.security.service;

import com.mall.wolmall.security.mapper.AuthMapper;
import com.mall.wolmall.security.model.SecurityUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class SecurityUserService implements UserDetailsService, UserService {

    @Autowired
    private AuthMapper authMapper;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        List<SimpleGrantedAuthority> authorities;

        SecurityUser model = getUserFindById(null == username ? "" : username);


        if(null != model && model.getEmail().equals(username)) {

            if(null != model.getRole() && !model.getRole().isEmpty()){
                model.setAuthorities(Collections.singletonList(new SimpleGrantedAuthority(model.getRole())));
            }

            return model;
        } else {
            throw new UsernameNotFoundException("User not found with username : " + username);
        }
    }

    @Override
    public SecurityUser getUserFindById(String email) {
        return authMapper.getUserFindById(email);
    }
}
