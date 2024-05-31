package com.asmkbw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.entity.Product;
import com.asmkbw.entity.ProductDetail;

@Controller
public class CartController {

	@Autowired
	ProductDetailDAO productDetailDAO;

	@RequestMapping("/keyboardworld/viewcart")
	public String viewCart(Model model) {
		ProductDetail productDetail = productDetailDAO.findById(26).orElse(null);
		Integer productID = productDetail.getProduct().getProductID();

		System.out.println(productID);

		model.addAttribute("views", "/WEB-INF/views/cart/viewcart.jsp");
		return "index";
	}
}
