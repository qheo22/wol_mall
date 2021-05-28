package com.mall.wolmall.security.config;

import com.mall.wolmall.security.filter.JwtAuthenticationFilter;
import com.mall.wolmall.security.handler.UserAccessDeniedHandler;
import com.mall.wolmall.security.service.SecurityUserService;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.header.writers.ClearSiteDataHeaderWriter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import lombok.RequiredArgsConstructor;

import static org.springframework.security.web.header.writers.ClearSiteDataHeaderWriter.Directive.CACHE;
import static org.springframework.security.web.header.writers.ClearSiteDataHeaderWriter.Directive.COOKIES;
import static org.springframework.security.web.header.writers.ClearSiteDataHeaderWriter.Directive.EXECUTION_CONTEXTS;
import static org.springframework.security.web.header.writers.ClearSiteDataHeaderWriter.Directive.STORAGE;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, jsr250Enabled = true, prePostEnabled = true)

public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private static final ClearSiteDataHeaderWriter.Directive[] SOURCE = {CACHE, COOKIES, STORAGE, EXECUTION_CONTEXTS};

    private final SecurityUserService userService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean(BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    public void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
        authenticationManagerBuilder.userDetailsService(userService) // 입력된 user에 대한 상세정보
                .passwordEncoder(passwordEncoder()); // password를 encorder하는 방식을 정함
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/assets/css/**", "/assets/js/**", "/assets/img/**", "/assets/ico/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //기존 코드
        http.cors().and().csrf().disable()        // 개발 시 에만
                .authorizeRequests()
                .antMatchers("/admin/**").hasAuthority("ROLE_ADMIN")
                .anyRequest().permitAll()
                .and()
                .formLogin().loginPage("/login").defaultSuccessUrl("/admin")
                .and()
                .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login").invalidateHttpSession(true)
                .and()
                .exceptionHandling().accessDeniedHandler(accessDeniedHandler());

        http.addFilterBefore(jwtAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class);
    }

    @Bean
    public AccessDeniedHandler accessDeniedHandler() {
        return new UserAccessDeniedHandler();
    }

    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter() {
        return new JwtAuthenticationFilter();
    }
}
