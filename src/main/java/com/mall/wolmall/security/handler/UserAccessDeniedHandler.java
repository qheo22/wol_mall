package com.mall.wolmall.security.handler;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException exc)
			throws IOException, ServletException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			System.out.println("User: " + auth.getName() + " attempted to access the protected URL: " + request.getRequestURI());
		}

		response.sendRedirect(request.getContextPath() + "/accessDenied");
	}
}
