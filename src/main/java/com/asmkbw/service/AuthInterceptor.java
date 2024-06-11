package com.asmkbw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.asmkbw.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		User user = session.get("userS", null);
		String error = "";

		if (user == null) {
			error = "Please Login!";
		} else if (!user.getRole().getRoleName().equalsIgnoreCase("Admin") && uri.startsWith("/keyboardworld/admin/")) {
			error = "Access denied!";
		}
		if (error.length() > 0) { // có lỗi
			session.set("demo", uri);
			if (error.equalsIgnoreCase("Access denied!")) {
				response.sendRedirect("/keyboardworld/logout");
			} else {
//				response.sendRedirect("/keyboardworld?=error" + error);
				response.sendRedirect("/keyboardworld/login");
			}

			return false;
		}
		return true;
	}
}
