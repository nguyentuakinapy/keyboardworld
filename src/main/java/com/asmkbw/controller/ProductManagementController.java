package com.asmkbw.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.asmkbw.dao.BrandDAO;
import com.asmkbw.dao.CategoryDAO;
import com.asmkbw.dao.ProductDAO;
import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.entity.Brand;
import com.asmkbw.entity.Category;
import com.asmkbw.entity.Product;
import com.asmkbw.entity.ProductDetail;
import com.asmkbw.service.ParamService;

import jakarta.servlet.ServletContext;

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

	@Autowired
	ServletContext app;

	List<ProductDetail> productDetails = new ArrayList<ProductDetail>();

	@RequestMapping("/product")
	public String product(Model model) throws IllegalStateException, IOException {
		Pageable pageable = PageRequest.of(0, 5, Sort.by("productID"));
		List<Product> listProducts = productDAO.findAll(pageable).getContent();
		model.addAttribute("products", listProducts);

		if (!nameImages.isEmpty()) {
			for (String name : nameImages) {
				paramService.deleteFile(app.getRealPath("/images/") + name);
			}
			this.product = new Product();
			productDetails.clear();
			nameImages.clear();
		}

		model.addAttribute("views", "listproduct.jsp");
		return "admin/index";
	}

	Integer idProduct;

	@RequestMapping("/editproduct/{id}")
	public String editproduct(Model model, @PathVariable("id") Integer id,
			@ModelAttribute("detail") ProductDetail detail) {
		this.idProduct = id;
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
	List<String> nameImages = new ArrayList<String>();

	@RequestMapping("/newproduct")
	public String newProduct(Model model, @ModelAttribute("detail") ProductDetail detail,
			@ModelAttribute("product") Product product) {
		if (this.product != null) {
			model.addAttribute("product", this.product);
		} else {
			this.product = new Product();
			productDetails.clear();
			nameImages.clear();
			model.addAttribute("product", product);
		}
		model.addAttribute("productDetails", productDetails);

		List<Category> categories = categoryDAO.findAll();
		model.addAttribute("categories", categories);

		List<Brand> brands = brandDAO.findAll();
		model.addAttribute("brands", brands);

		model.addAttribute("views", "editproduct.jsp");
		return "admin/index";
	}

	@Autowired
	ParamService paramService;

	@PostMapping("/save")
	public String saveProduct(@ModelAttribute Product product, @RequestParam("brand.brandID") Integer selectedBrandID,
			@RequestParam("category.categoryID") Integer selectedCategoryID) throws IllegalStateException, IOException {
		product.setBrand(brandDAO.findById(selectedBrandID).orElse(null));
		product.setCategory(categoryDAO.findById(selectedCategoryID).orElse(null));
		if (product.getProductID() == null && product.getBrand() != null && product.getCategory() != null) {
			Integer productID = productDAO.save(product).getProductID();
			System.out.println("Thêm thành côbg");
			int index = 0;
			boolean check = false;
			if (productDetails != null) {
				for (ProductDetail pd : productDetails) {
					if (!nameImages.isEmpty()) {
						pd.setThumbNail(nameImages.get(index));
					}
					pd.setProduct(productDAO.findById(productID).orElse(null));
					productDetailDAO.save(pd);
					check = true;
					index++;
				}
				if (check) {
					this.product = new Product();
					productDetails.clear();
					nameImages.clear();
				}
			}

		} else {
			productDAO.save(product);
			System.out.println("Update thành công");
		}
		return "redirect:/keyboardworld/admin/product";
	}

	@PostMapping("/newproductdetail")
	public String postMethodName(@ModelAttribute("detail") ProductDetail detail,
			@ModelAttribute("product") Product product, Model model,
			@RequestParam("brand.brandID") Integer selectedBrandID,
			@RequestParam("category.categoryID") Integer selectedCategoryID,
			@RequestParam("thumbnail") MultipartFile file) throws IllegalStateException, IOException {
		this.product = product;
		productDetails.add(detail);
		nameImages.add(file.getOriginalFilename());
		paramService.save(file, app.getRealPath("/images/"));
		this.product.setBrand(brandDAO.findById(selectedBrandID).orElse(null));
		this.product.setCategory(categoryDAO.findById(selectedCategoryID).orElse(null));
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

	@RequestMapping("/addproductdetail")
	public String addproductDetail(@ModelAttribute("detail") ProductDetail detail, Model model,
			@RequestParam("thumbnailadd") MultipartFile file) throws IllegalStateException, IOException {
		detail.setThumbNail(file.getOriginalFilename());
		detail.setProduct(productDAO.findById(idProduct).orElse(null));
		paramService.save(file, app.getRealPath("/images/"));
		productDetailDAO.save(detail);
		return "redirect:/keyboardworld/admin/editproduct/" + idProduct;
	}



}
