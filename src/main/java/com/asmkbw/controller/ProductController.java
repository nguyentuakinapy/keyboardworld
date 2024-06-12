package com.asmkbw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asmkbw.dao.BrandDAO;
import com.asmkbw.dao.CategoryDAO;
import com.asmkbw.dao.ProductDAO;
import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.entity.Brand;
import com.asmkbw.entity.Category;
import com.asmkbw.entity.Product;
import com.asmkbw.entity.ProductDetail;
import com.asmkbw.entity.User;
import com.asmkbw.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

	@RequestMapping("/product/mouse")
	public String productMouse(Model model, @RequestParam("p") Optional<Integer> p) {
//		List<Product> products = productDAO.findAll();
		List<Category> categories = categoryDAO.findAll();
		List<Brand> brands = brandDAO.findAll();

		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Category category = categoryDAO.findById(1).orElse(null);
		System.out.println(category.getName());
		Page<Product> products = productDAO.findByCategory(category, pageable);

		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		model.addAttribute("brands", brands);

		model.addAttribute("views", "/WEB-INF/views/product/product.jsp");
		return "index";
	}

	@RequestMapping("/product/keyboard")
	public String productKeyboard(Model model, @RequestParam("p") Optional<Integer> p) {
//		List<Product> products = productDAO.findAll();
		List<Category> categories = categoryDAO.findAll();
		List<Brand> brands = brandDAO.findAll();

		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Category category = categoryDAO.findById(2).orElse(null);
		System.out.println(category.getName());
		Page<Product> products = productDAO.findByCategory(category, pageable);

		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		model.addAttribute("brands", brands);

		model.addAttribute("views", "/WEB-INF/views/product/product.jsp");
		return "index";
	}

	@RequestMapping("/product/headphone")
	public String productHeadphone(Model model, @RequestParam("p") Optional<Integer> p) {
//		List<Product> products = productDAO.findAll();
		List<Category> categories = categoryDAO.findAll();
		List<Brand> brands = brandDAO.findAll();

		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Category category = categoryDAO.findById(3).orElse(null);
		System.out.println(category.getName());
		Page<Product> products = productDAO.findByCategory(category, pageable);

		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		model.addAttribute("brands", brands);

		model.addAttribute("views", "/WEB-INF/views/product/product.jsp");
		return "index";
	}

	@RequestMapping("/product/keycap")
	public String productKeycap(Model model, @RequestParam("p") Optional<Integer> p) {
//		List<Product> products = productDAO.findAll();
		List<Category> categories = categoryDAO.findAll();
		List<Brand> brands = brandDAO.findAll();

		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Category category = categoryDAO.findById(4).orElse(null);
		System.out.println(category.getName());
		Page<Product> products = productDAO.findByCategory(category, pageable);

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

		List<Category> categories = categoryDAO.findAll();
		List<Brand> brands = brandDAO.findAll();

		model.addAttribute("categories", categories);
		model.addAttribute("brands", brands);
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		Page<Product> page = productDAO.searchByMultipleCriteria("%" + kwords + "%", pageable);
		model.addAttribute("page", page);
		model.addAttribute("views", "/WEB-INF/views/product/searchproduct.jsp");
		return "index";
	}

	@PostMapping("/filterProducts")
	@ResponseBody
	public void filterProducts(@RequestBody List<Integer> categories, Model model, HttpServletResponse resp,
			HttpServletRequest req, @RequestParam("p") Optional<Integer> p) throws IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Pageable pageable = PageRequest.of(p.orElse(0), 100);
		Page<Product> products;
		if (categories == null || categories.isEmpty()) {
			products = productDAO.findAll(pageable);
		} else {
			products = productDAO.findByCategoryIDAjax(categories, pageable);
		}
		NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
		model.addAttribute("products", products);
		PrintWriter out = resp.getWriter();
		products.getContent().forEach(pd -> {
			out.print("<div class=\"col-lg-4 col-md-6 col-sm-12 col mt-2\">\r\n"
					+ "    <div class=\"card card-product border-0 overflow-hidden\">\r\n"
					+ "        <div class=\"image-container\">\r\n"
					+ "            <a href=\"/keyboardworld/detailproduct/" + pd.getProductID() + "\">\r\n"
					+ "                <img class=\"imagesProduct-hover\" src=\"/images/"
					+ pd.getProductDetails().get(0).getThumbNail() + "\" alt=\"\">\r\n"
					+ "                <img class=\"imagesProduct\" src=\"/images/"
					+ pd.getGalleries().get(0).getThumbnail() + "\" alt=\"\">\r\n" + "            </a>\r\n"
					+ "        </div>\r\n" + "        <div class=\"card-body text-center product-content\">\r\n"
					+ "            <span class=\"product-category fs-6 text-secondary\">" + pd.getCategory().getName()
					+ "</span>\r\n" + "            <h6 class=\"product-name fw-bolder text-nowrap text-truncate\">"
					+ pd.getName() + " " + pd.getProperty() + "</h6>\r\n" + "            <div class=\"price\">\r\n"
					+ "                <span class=\"price-new fs-5\">\r\n"
					+ formatter.format(pd.getProductDetails().get(0).getPrice()) + "                </span>\r\n"
					+ "            </div>\r\n" + "        </div>\r\n"
					+ "        <form class=\"product-btn d-grid gap-2 col-10 mx-auto\">\r\n"
					+ "            <input type=\"hidden\" name=\"quantity\" id=\"quantity\" value=\"1\">\r\n"
					+ "            <button type=\"submit\" formaction=\"/keyboardworld/addtocart/"
					+ pd.getProductDetails().get(0).getProductDetailID()
					+ "\" formmethod=\"post\" class=\"btn btn-outline-dark fw-bold\">Thêm vào giỏ hàng</button>\r\n"
					+ "        </form>\r\n" + "    </div>\r\n" + "    <hr class=\"m-0 p-0\">\r\n" + "</div>");
		});

	}

	@PostMapping("/checkUser")
	@ResponseBody
	public boolean checkUser(HttpSession session) {
		User user = (User) session.getAttribute("userS");
		return user != null; // Trả về true nếu người dùng tồn tại, ngược lại trả về false
	}

}
