package com.asmkbw.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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

@Controller
@RequestMapping("/keyboardworld/admin")
public class ProductManagementController {
	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private ProductDetailDAO productDetailDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private BrandDAO brandDAO;

	List<ProductDetail> productDetails = new ArrayList<ProductDetail>();

	@RequestMapping("/product")
	public String product(Model model) {
		Pageable pageable = PageRequest.of(0, 5, Sort.by("productID"));
		List<Product> listProducts = productDAO.findAll(pageable).getContent();
		model.addAttribute("products", listProducts);

		model.addAttribute("views", "listproduct.jsp");
		return "admin/index";
	}

	@RequestMapping("/editproduct/{id}")
	public String editproduct(Model model, @PathVariable("id") Integer id) {
		Product product = productDAO.findById(id).orElse(null);
		model.addAttribute("product", product);

		List<Category> categories = categoryDAO.findAll();
		model.addAttribute("categories", categories);

		List<Brand> brands = brandDAO.findAll();
		model.addAttribute("brands", brands);

		List<ProductDetail> details = productDetailDAO.findByProduct(product);
		model.addAttribute("details", details);

		model.addAttribute("views", "editproduct.jsp");
		return "admin/index";
	}

	Product product;

	@RequestMapping("/newproduct")
	public String newProduct(@ModelAttribute Product product, Model model, @ModelAttribute ProductDetail detail) {

		ProductDetail newDetail = new ProductDetail();
		model.addAttribute("detail", newDetail);

		List<Category> categories = categoryDAO.findAll();
		model.addAttribute("categories", categories);

		List<Brand> brands = brandDAO.findAll();
		model.addAttribute("brands", brands);

		model.addAttribute("productDetails", productDetails);
		model.addAttribute("views", "editproduct.jsp");
		model.addAttribute("product", product);
		return "admin/index";
	}

	@PostMapping("/save")
	public String saveProduct(@ModelAttribute Product product, @RequestParam("brand.brandID") Integer selectedBrandID,
			@RequestParam("category.categoryID") Integer selectedCategoryID) {
		product.setBrand(brandDAO.findById(selectedBrandID).orElse(null));
		product.setCategory(categoryDAO.findById(selectedCategoryID).orElse(null));
		if (product.getProductID() == null && product.getBrand() != null && product.getCategory() != null) {
			productDAO.save(product);
			System.out.println("Thêm thành côbg");
		} else {
			productDAO.save(product);
			System.out.println("Update thành công");
		}
		System.out.println(selectedCategoryID);
		System.out.println(product.getBrand().getName());
		System.out.println(product.getName());
		System.out.println(product.getProductID());
		return "redirect:/keyboardworld/admin/product";
	}

	@PostMapping("/newproductdetail")
	public String postMethodName(@ModelAttribute ProductDetail detail, @ModelAttribute Product product) {
		System.out.println(product.getName());
		productDetails.add(detail);
		return "redirect:/keyboardworld/admin/newproduct";
	}

	@RequestMapping("/detailproduct/{x}")
	public String detailproduct(Model model, @PathVariable("x") Integer id) {
		Product product = productDAO.findById(id).orElse(null);
		List<ProductDetail> details = productDetailDAO.findByProduct(product);
		model.addAttribute("product", product);
		model.addAttribute("details", details);
		model.addAttribute("views", "listdetailproduct.jsp");
		return "admin/index";
	}

}
