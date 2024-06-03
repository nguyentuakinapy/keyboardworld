package com.asmkbw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/keyboardworld/admin")
public class AdminController {

	@RequestMapping
	public String index(Model model) {

		model.addAttribute("views", "account.jsp");
		return "admin/index";
	}

}
