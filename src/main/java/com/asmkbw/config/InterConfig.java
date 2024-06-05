package com.asmkbw.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.asmkbw.service.AuthInterceptor;

@Configuration
public class InterConfig implements WebMvcConfigurer {
	@Autowired
	AuthInterceptor auth;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth)
				.addPathPatterns("/keyboardworld/account", "/account/chgpwd", "/order/**", "/admin/**")
				.excludePathPatterns("/assets/**", "/admin/home/index");
	}
}