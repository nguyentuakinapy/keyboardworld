package com.asmkbw.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class EmailConfig {

	@Value("${email.from}")
	private String fromEmail;

	public String getFromEmail() {
		return fromEmail;
	}
}
