package com.asmkbw.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asmkbw.dao.BrandDAO;
import com.asmkbw.dao.CategoryDAO;
import com.asmkbw.dao.ProductDAO;
import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.entity.Brand;
import com.asmkbw.entity.Category;
import com.asmkbw.entity.Product;
import com.asmkbw.entity.ProductDetail;
import com.asmkbw.service.SessionService;

@Controller
@RequestMapping("/keyboardworld")
public class ProductController {

	@Autowired
	ProductDAO productDAO;

	@Autowired
	ProductDetailDAO productDetailDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	BrandDAO brandDAO;
	@Autowired
	SessionService session;

	@RequestMapping("/product")
	public String productALL(Model model, @RequestParam("p") Optional<Integer> p) {
//		List<Product> products = productDAO.findAll();
		List<Category> categories = categoryDAO.findAll();
		List<Brand> brands = brandDAO.findAll();

		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Page<Product> products = productDAO.findAll(pageable);

		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		model.addAttribute("brands", brands);

		model.addAttribute("views", "/WEB-INF/views/product/product.jsp");
		return "index";
	}

	@RequestMapping("/detailproduct/{id}")
	public String detailProduct(Model model, @PathVariable("id") Integer productID) {
		Product product = productDAO.findById(productID).orElse(null);
		List<ProductDetail> productDetails = product.getProductDetails();
		model.addAttribute("product", product);
		model.addAttribute("productDetails", productDetails);
		model.addAttribute("views", "/WEB-INF/views/product/detailproduct.jsp");
		return "index";
	}

	@RequestMapping("/searchproduct")
	public String searchProduct(Model model, @RequestParam("keywords") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse(session.get("keywords"));
		session.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = productDAO.searchByMultipleCriteria("%" + kwords + "%", pageable);
		model.addAttribute("page", page);
		model.addAttribute("views", "/WEB-INF/views/product/searchproduct.jsp");
		return "index";
	}
}
