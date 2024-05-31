package com.asmkbw.controller;

import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/keyboardworld/admin")
public class AdminController {
	@RequestMapping
	public String adminHome(Model model) {
		model.addAttribute("views", "listproduct.jsp");
		return "admin/index";
	}
}
