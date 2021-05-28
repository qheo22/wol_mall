package com.mall.wolmall.controller;

import com.mall.wolmall.security.model.AuthenticationRequest;
import com.mall.wolmall.security.model.AuthenticationResponse;
import com.mall.wolmall.security.service.SecurityUserService;
import com.mall.wolmall.security.provider.JwtTokenProvider;
import com.mall.wolmall.security.provider.SocialServiceProvider;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/auth")
public class AuthenticationController {

    private final SocialServiceProvider socialServiceProvider;

    private final PasswordEncoder passwordEncoder;

    private final AuthenticationManager authenticationManager;

    private final SecurityUserService userService;

    private final JwtTokenProvider tokenProvider;

    // 로그인
    @PostMapping(path = "/snslogin.do", consumes = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> socialLogin(@RequestBody AuthenticationRequest request) {

        String jwt;
        try {
            String socialId = socialServiceProvider.ssoExtractor(request.getProviderToken(), request.getSocialType(), request.getUsername());
            System.out.println("socialId = " + socialId + "??");
            System.out.println("request.getUsername() = " + request.getUsername() + "??");
            if(null == socialId) {
                String status;
                String errorCode;

                status = "SNS Invalid-token";
                errorCode = "11";

                Map<String, Object> map = new HashMap<>();
                map.put("errorCode", 401 + errorCode);
                map.put("errorMessage", status);

                return ResponseEntity.status(401).body(map);
            }
            Authentication authentication = new UsernamePasswordAuthenticationToken(userService.loadUserByUsername(socialId), null, new ArrayList<>());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            jwt = tokenProvider.generateToken(authentication);
        } catch (DisabledException | LockedException | BadCredentialsException e) {
            String status;
            String errorCode;
            if(e.getClass().equals(BadCredentialsException.class)) {
                status = "invalid-password";
                errorCode = "01";
            } else if(e.getClass().equals(DisabledException.class)) {
                status = "disable";
                errorCode = "02";
            } else if(e.getClass().equals(LockedException.class)) {
                status = "locked";
                errorCode = "03";
            } else {
                status = "unknown";
                errorCode = "99";
            }

            Map<String, Object> map = new HashMap<>();
            map.put("errorCode", 401 + errorCode);
            map.put("errorMessage", status);

            return ResponseEntity.status(401).body(map);
        }

        return ResponseEntity.ok(new AuthenticationResponse(jwt));
    }

    // 로그인
    @PostMapping(path = "/login.do", consumes = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> basicLogin(@RequestBody AuthenticationRequest request) {

        String jwt;

        try {
            Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword(), new ArrayList<>()));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            jwt = tokenProvider.generateToken(authentication);
        } catch (DisabledException | LockedException | BadCredentialsException e) {
            String status;
            String errorCode;
            if(e.getClass().equals(BadCredentialsException.class)) {
                status = "invalid-password";
                errorCode = "01";
            } else if(e.getClass().equals(DisabledException.class)) {
                status = "disable";
                errorCode = "02";
            } else if(e.getClass().equals(LockedException.class)) {
                status = "locked";
                errorCode = "03";
            } else {
                status = "unknown";
                errorCode = "99";
            }

            Map<String, Object> map = new HashMap<>();
            map.put("errorCode", 401 + errorCode);
            map.put("errorMessage", status);

            return ResponseEntity.status(401).body(map);
        }

        return ResponseEntity.ok(new AuthenticationResponse(jwt));
    }

}
