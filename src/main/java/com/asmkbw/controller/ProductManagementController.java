package com.asmkbw.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
import com.asmkbw.dao.GalleryDAO;
import com.asmkbw.dao.ProductDAO;
import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.entity.Brand;
import com.asmkbw.entity.Category;
import com.asmkbw.entity.Gallery;
import com.asmkbw.entity.Product;
import com.asmkbw.entity.ProductDetail;
import com.asmkbw.service.GlobalInterceptor;
import com.asmkbw.service.ParamService;
import com.asmkbw.service.SessionService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;

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
	private GalleryDAO daoGalleryDAO;

	@Autowired
	ServletContext app;
	@Autowired
	SessionService service;

	List<ProductDetail> productDetails = new ArrayList<ProductDetail>();

	@RequestMapping("/product")
	public String product(Model model, @RequestParam("page") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> keyword) throws IllegalStateException, IOException {
		String kwords = keyword.orElse(service.get("keywords", ""));
		service.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 5, Sort.by("productID"));
		Page<Product> page = productDAO.findAllByNameLike("%" + kwords + "%", pageable);
		model.addAttribute("page", page);

		if (!nameImages.isEmpty()) {
			for (String name : nameImages) {
				paramService.deleteFile(app.getRealPath("/images/") + name);
			}
			this.product = new Product();
			productDetails.clear();
			nameImages.clear();
		}
		if (!nameGallery.equalsIgnoreCase("")) {
			paramService.deleteFile(app.getRealPath("/images/") + nameGallery);
			nameGallery = "";
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
		model.addAttribute("nameGallery", product.getGalleries().get(0).getThumbnail());

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
	String nameGallery = "";

	@RequestMapping("/newproduct")
	public String newProduct(Model model, @ModelAttribute("detail") ProductDetail detail,
			@ModelAttribute("product") Product product) {
		if (this.product != null) {
			model.addAttribute("product", this.product);
			model.addAttribute("nameGallery", nameGallery);
		} else {
			this.product = new Product();
			productDetails.clear();
			nameImages.clear();
			model.addAttribute("product", product);
			nameGallery = "";
		}
		model.addAttribute("productDetails", productDetails);

		List<Category> categories = categoryDAO.findAll();
		model.addAttribute("categories", categories);

		List<Brand> brands = brandDAO.findAll();
		model.addAttribute("brands", brands);
		String uri = (String) req.getAttribute("uri");
		System.out.println(uri);
		model.addAttribute("views", "editproduct.jsp");
		return "admin/index";
	}

	@Autowired
	ParamService paramService;

	@Autowired
	HttpServletRequest req;

	@PostMapping("/save")
	public String saveProduct(@ModelAttribute Product product, @RequestParam("brand.brandID") Integer selectedBrandID,
			@RequestParam("category.categoryID") Integer selectedCategoryID,
			@RequestParam("gallery") MultipartFile gallery) throws IllegalStateException, IOException {
		product.setBrand(brandDAO.findById(selectedBrandID).orElse(null));
		product.setCategory(categoryDAO.findById(selectedCategoryID).orElse(null));
		if (product.getProductID() == null && product.getBrand() != null && product.getCategory() != null) {
			Integer productID = productDAO.save(product).getProductID();
			System.out.println("Thêm thành côbg");
			int index = 0;
			boolean check = false;
			Gallery gly = new Gallery();
			gly.setProduct(productDAO.findById(productID).orElse(null));
			if (!gallery.isEmpty()) {
				gly.setThumbnail(gallery.getOriginalFilename());
				paramService.save(gallery, app.getRealPath("/images/"));
				daoGalleryDAO.save(gly);
				nameGallery = "";
			} else {
				gly.setThumbnail(nameGallery);
				daoGalleryDAO.save(gly);
				nameGallery = "";
			}
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
			Gallery gly = daoGalleryDAO.findbyProduct(product);
			if (!gallery.isEmpty()) {
				paramService.deleteFile(app.getRealPath("/images/") + gly.getThumbnail());
				gly.setThumbnail(gallery.getOriginalFilename());
				paramService.save(gallery, app.getRealPath("/images/"));
				daoGalleryDAO.save(gly);
				nameGallery = "";
			}
			System.out.println("Update thành công");
		}
		return "redirect:/keyboardworld/admin/product";
	}

	@PostMapping("/newproductdetail")
	public String postMethodName(@ModelAttribute("detail") ProductDetail detail,
			@ModelAttribute("product") Product product, Model model,
			@RequestParam("brand.brandID") Integer selectedBrandID,
			@RequestParam("category.categoryID") Integer selectedCategoryID,
			@RequestParam("thumbnail") MultipartFile file, @RequestParam("gallery") MultipartFile gallery)
			throws IllegalStateException, IOException {
		this.product = product;
		productDetails.add(detail);
		nameImages.add(file.getOriginalFilename());
		paramService.save(file, app.getRealPath("/images/"));
		if (!gallery.isEmpty()) {
			nameGallery = gallery.getOriginalFilename();
			paramService.save(gallery, app.getRealPath("/images/"));
		}
		this.product.setBrand(brandDAO.findById(selectedBrandID).orElse(null));
		System.out.println();
		this.product.setCategory(categoryDAO.findById(selectedCategoryID).orElse(null));
		return "redirect:/keyboardworld/admin/newproduct";
	}

	@PostMapping("/addcategory")
	public String addCategory(Model model, @RequestParam("name") String name, @RequestParam("currentUrl") String currentUrl) {
		Category newCategory = new Category();
		newCategory.setName(name);
		categoryDAO.save(newCategory);
		if (currentUrl.contains("/newproduct")) {
			return "redirect:/keyboardworld/admin/newproduct";
		} else {
			return "redirect:/keyboardworld/admin/editproduct/" + idProduct;
		}
	}

	@PostMapping("/addbrand")
	public String addBrand(Model model, @RequestParam("name") String name, @RequestParam("city") String city,
			@RequestParam("district") String district, @RequestParam("ward") String ward,
			@RequestParam("addRessDetail") String addRessDetail, @RequestParam("phone") String phone,
			@RequestParam("email") String email, @RequestParam("currentUrl") String currentUrl) {
		Brand newBrand = new Brand();
		newBrand.setName(name);
		newBrand.setAddRess(addRessDetail + ", " + ward + ", " + district + ", " + city);
		newBrand.setEmail(email);
		newBrand.setPhone(phone);
		brandDAO.save(newBrand);
		if (currentUrl.contains("/newproduct")) {
			return "redirect:/keyboardworld/admin/newproduct";
		} else {
			return "redirect:/keyboardworld/admin/editproduct/" + idProduct;
		}
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

	@RequestMapping("/removelistproductdetail/{x}")
	public String removepd(@PathVariable("x") int id) throws IllegalStateException, IOException {
		productDetails.remove(id);
		paramService.deleteFile(app.getRealPath("/images/") + nameImages.get(id));
		nameImages.remove(id);
		return "redirect:/keyboardworld/admin/newproduct";
	}

	@RequestMapping("/removeproductdetail/{idproductdetail}")
	public String removepded(@PathVariable("idproductdetail") Integer id) throws IllegalStateException, IOException {
		ProductDetail pd = productDetailDAO.findById(id).orElse(null);
		if (pd != null) {
			paramService.deleteFile(app.getRealPath("/images/") + pd.getThumbNail());
			productDetailDAO.deleteById(id);
		} else {
			System.out.println("NULL ROOIF");
		}

		return "redirect:/keyboardworld/admin/editproduct/" + idProduct;
	}

}
