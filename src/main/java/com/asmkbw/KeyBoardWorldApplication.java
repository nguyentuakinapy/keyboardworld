package com.asmkbw;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class KeyBoardWorldApplication {

	public static void main(String[] args) {
		SpringApplication.run(KeyBoardWorldApplication.class, args);
	}

}
