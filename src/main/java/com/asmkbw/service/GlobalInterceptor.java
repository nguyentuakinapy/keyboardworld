package com.asmkbw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.asmkbw.dao.CartDAO;
import com.asmkbw.entity.Cart;
import com.asmkbw.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class GlobalInterceptor implements HandlerInterceptor {
	@Autowired
	CartDAO cartDAO;

	@Autowired
	HttpSession session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		request.setAttribute("uri", request.getRequestURI());
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mv)
			throws Exception {
		User user = (User) session.getAttribute("userS");
		List<Cart> carts = cartDAO.findByIDUser(user);
		req.setAttribute("listCart", carts);
	}
}