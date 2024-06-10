package com.asmkbw.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asmkbw.dao.CategoryDAO;

@Controller
@RequestMapping("/keyboardworld/admin")
public class AdminController {
	@Autowired
	CategoryDAO categoryDAO;
	
	@RequestMapping
	public String index(Model model) {

		model.addAttribute("views", "account.jsp");
		return "admin/index";
	}
}
