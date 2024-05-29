package com.asmkbw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asmkbw.dao.ProductDAO;
import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.entity.Product;
import com.asmkbw.entity.ProductDetail;

@Controller
public class ProductController {

	@Autowired
	ProductDAO productDAO;

	@Autowired
	ProductDetailDAO productDetailDAO;

	@RequestMapping("/keyboardworld/product")
	public String productALL(Model model) {
		List<Product> products = productDAO.findAll();
		model.addAttribute("products", products);
		model.addAttribute("views", "/WEB-INF/views/product/product.jsp");
		return "index";
	}

	@RequestMapping("/keyboardworld/detailproduct/{id}")
	public String detailProduct(Model model, @PathVariable("id") Integer productID) {
		Product product = productDAO.findById(productID).orElse(null);
		List<ProductDetail> productDetails = product.getProductDetails();
		model.addAttribute("product", product);
		model.addAttribute("productDetails", productDetails);
		model.addAttribute("views", "/WEB-INF/views/product/detailproduct.jsp");
		return "index";
	}
}
