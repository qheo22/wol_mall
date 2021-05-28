package com.mall.wolmall.security.filter;

import com.mall.wolmall.service.PropertyService;
import com.mall.wolmall.security.provider.JwtTokenProvider;
import com.mall.wolmall.security.service.SecurityUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JwtAuthenticationFilter extends OncePerRequestFilter {

    @Autowired
    private SecurityUserService userDetailService;

    @Autowired
    protected JwtTokenProvider tokenProvider;



    @Autowired
    private PropertyService propertyService;


    //토근을 받고 내보내는 부분
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {


        try {
            String jwt = getJwtFromRequest(request);

            if(StringUtils.hasText(jwt) && tokenProvider.validateToken(jwt)) {
                String username = tokenProvider.getUserIdFromJWT(jwt);
                UserDetails userDetails = userDetailService.loadUserByUsername(username);
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authentication);
            }
        } catch (Exception e) {
            System.out.println("Could not set user authentication in security context / " + e.getMessage());
        }

        filterChain.doFilter(request, response);
    }

    public static String getJwtFromRequest(HttpServletRequest request) {
        String bearerToken = request.getHeader("Authorization");
        if(StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer")) {
            return bearerToken.substring(7, bearerToken.length());
        }
        return null;
    }
}
