package com.asmkbw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {
	@RequestMapping("/keyboardworld/viewcart")
	public String viewCart(Model model) {
		model.addAttribute("views", "/WEB-INF/views/cart/viewcart.jsp");
		return "index";
	}
}
