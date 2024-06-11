package com.asmkbw.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.asmkbw.service.GlobalInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
	@Autowired
	GlobalInterceptor global;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(global).addPathPatterns("/**").excludePathPatterns("/assets/**");
	}
}
