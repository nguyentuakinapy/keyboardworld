package com.asmkbw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/keyboardworld")
public class AccountController {
	@RequestMapping("/account")
	public String account(Model model) {
		model.addAttribute("views", "/WEB-INF/views/account/account.jsp");

		return "index";
	}

	@RequestMapping("/order")
	public String order(Model model) {
		model.addAttribute("views", "/WEB-INF/views/account/orders.jsp");

		return "index";
	}

	@RequestMapping("/changepass")
	public String changepass(Model model) {
		model.addAttribute("views", "/WEB-INF/views/account/changepass.jsp");

		return "index";
	}

	@RequestMapping("/address")
	public String address(Model model) {
		model.addAttribute("views", "/WEB-INF/views/account/address.jsp");

		return "index";
	}

}
