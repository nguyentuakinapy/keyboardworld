package com.asmkbw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asmkbw.dao.CartDAO;
import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.entity.Cart;
import com.asmkbw.entity.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@Autowired
	ProductDetailDAO productDetailDAO;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	HttpSession session;

	@RequestMapping("/keyboardworld/viewcart")
	public String viewCart(Model model) {
		User user = (User) session.getAttribute("userS");
		if (user == null) {
			return "redirect:/keyboardworld/login";
		}
		List<Cart> listCarts = cartDAO.findByIDUser(user);
		model.addAttribute("listCarts", listCarts);

		model.addAttribute("views", "/WEB-INF/views/cart/viewcart.jsp");
		return "index";
	}

	@RequestMapping("/keyboardworld/addtocart/{x}")
	public String addToCart(Model model, @PathVariable("x") Integer id) {
		User user = (User) session.getAttribute("userS");
		if (user != null) {
			Cart cart = new Cart();
			cart.setProductDetail(productDetailDAO.findById(id).orElse(null));
			cart.setQuantity(1);
			cart.setUser(user);
			cartDAO.save(cart);
			return "redirect:/keyboardworld/viewcart";
		}
		return "redirect:/keyboardworld/product";
	}
}
