package com.asmkbw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asmkbw.dao.ProductDAO;
import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.dao.UserDAO;
import com.asmkbw.entity.Product;
import com.asmkbw.entity.ProductDetail;
import com.asmkbw.entity.User;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@Controller
@RequestMapping("/keyboardworld")
public class HomeController {
	@Autowired
	HttpServletRequest req;

	@Autowired
	HttpServletResponse resp;

	@Autowired
	ProductDAO productDao;

	@Autowired
	ProductDetailDAO productDetailDAO;

	@Autowired
	UserDAO userDAO;

	@Autowired
	HttpSession session;

	@RequestMapping
	public String home(Model model) {
		model.addAttribute("views", "/WEB-INF/views/home/main.jsp");
		List<Product> products = productDao.findAll();
		model.addAttribute("products", products);
//		System.out.println(products.get(1).getCategory().getName());
//		List<ProductDetail> details = products.get(0).getProductDetails();
//		System.out.println();
//		products.forEach(p -> {
//			System.out.println(p.getName());
//		});
//		List<ProductDetail> productDetails = productDetailDAO.findAll();
//		productDetails.forEach(p -> {
//			System.out.println(p.getColor());
//		});
		return "index";
	}

	@GetMapping("/login")
	public String loginGet(Model model) {
		model.addAttribute("views", "/WEB-INF/views/account/login.jsp");
		return "index";
	}

	@PostMapping("/login")
	public String loginPost(Model model, @RequestParam("email") String email,
			@RequestParam("password") String password) {
		User user = userDAO.findByEmail(email);
		if (user != null) {
			if (user.getPassword().equalsIgnoreCase(password)) {
				session.setAttribute("user", user);
				if (user.getRole().getRoleName().equalsIgnoreCase("Admin")) {
					return "redirect:/keyboardworld/admin";
				} else {
					return "redirect:/keyboardworld";
				}

			} else {
				model.addAttribute("message", "Thông tin bạn nhập không đúng!");
			}
		} else {
			model.addAttribute("message", "Thông tin bạn nhập không đúng!");
		}
		model.addAttribute("views", "/WEB-INF/views/account/login.jsp");
		return "index";
	}

	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/keyboardworld";
	}

	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("views", "/WEB-INF/views/account/register.jsp");
		return "index";
	}
}
