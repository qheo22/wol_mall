package com.mall.wolmall.security.provider;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;

@Component
public class JwtTokenProvider {

    @Value("${jwt.secret}")
    private String jwtSecret; // 암호화 키

    private final long TOKEN_VALID_TIME = 604800000;//1000 * 60 * 60 * 10;

    public String generateToken(Authentication authentication) { //JWT 생성

        UserDetails model = (UserDetails)authentication.getPrincipal();

        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + TOKEN_VALID_TIME);
        return Jwts.builder().setSubject(model.getUsername()) //PAYLOAD에 들어갈 sub
                .setIssuedAt(new Date()) // 생성일
                .setExpiration(expiryDate) // 만료일
                .signWith(SignatureAlgorithm.HS256, jwtSecret) // 암호화 방식
                .compact(); // 토큰 생성 메소드
    }

    public String getUserIdFromJWT(String token) { // JWT로 부터 UserId 획득
        Claims claims = Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(token).getBody();
        return claims.getSubject();
    }

    public boolean validateToken(String authToken) { // JWT 유효성 검사
        try {
            Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(authToken);
            return true;
        } catch (SignatureException ex) {
            System.out.println("---------------------------JWT ------------------------ Invalid JWT signature");
        } catch (MalformedJwtException ex) {
            System.out.println("---------------------------JWT ------------------------ Invalid JWT token");
        } catch (ExpiredJwtException ex) {
            System.out.println("---------------------------JWT ------------------------ Expired JWT token");
        } catch (UnsupportedJwtException ex) {
            System.out.println("---------------------------JWT ------------------------ Unsupported JWT token");
        } catch (IllegalArgumentException ex) {
            System.out.println("---------------------------JWT ------------------------ JWT claims string is empty.");
        }
        return false;
    }
}
