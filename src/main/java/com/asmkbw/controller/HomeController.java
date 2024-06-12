package com.asmkbw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asmkbw.dao.CartDAO;
import com.asmkbw.dao.ProductDAO;
import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.dao.RoleDAO;
import com.asmkbw.dao.UserDAO;
import com.asmkbw.entity.Cart;
import com.asmkbw.entity.Product;
import com.asmkbw.entity.ProductDetail;
import com.asmkbw.entity.Role;
import com.asmkbw.entity.User;
import com.asmkbw.service.EmailService;
import com.asmkbw.utils.PasswordUtils;
import com.asmkbw.utils.RandomUtils;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
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
	CartDAO cartDAO;

	@Autowired
	UserDAO userDAO;

	@Autowired
	HttpSession session;

	@Autowired
	RoleDAO roleDAO;

	@Autowired
	EmailService emailService;

	@RequestMapping
	public String home(Model model) {
		model.addAttribute("views", "/WEB-INF/views/home/main.jsp");
		Pageable pageable = PageRequest.of(0, 4);
		Page<Product> keyboards = productDao.findByCategoryID(2, pageable);
		model.addAttribute("keyboards", keyboards.getContent());

		Page<Product> mouses = productDao.findByCategoryID(1, pageable);
		model.addAttribute("mouses", mouses.getContent());

		Page<Product> keycap = productDao.findByCategoryID(4, pageable);
		model.addAttribute("keycap", keycap.getContent());

		Page<Product> headphone = productDao.findByCategoryID(3, pageable);
		model.addAttribute("headphone", headphone.getContent());

		Page<Product> products = productDao.findTopProductByCategory(pageable);
		model.addAttribute("products", products.getContent());
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
			String hashedInputPassword = PasswordUtils.hashPassword(password);
			if (hashedInputPassword != null && user.getPassword().equals(hashedInputPassword)) {
				session.setAttribute("userS", user);
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
	public String registerGet(Model model, @ModelAttribute User user) {
		model.addAttribute("views", "/WEB-INF/views/account/register.jsp");
		return "index";
	}

	String otpEmail;
	User user;

//	@PostMapping("/register")
//	public String registerPost(Model model, @Valid @ModelAttribute User user,
//			@RequestParam("confirmpassword") String confirmPass, BindingResult result) {
//		if (result.hasErrors()) {
//			return "error_view"; // Trả về trang hiển thị lỗi
//		}
//		if (userDAO.findByEmail(user.getEmail()) == null) {
//			if (user.getPassword().equalsIgnoreCase(confirmPass)) {
//				otpEmail = RandomUtils.generateOTP();
//				emailService.sendEmail(user.getEmail(), "KEYBOARD WORLD",
//						"Bạn vừa đâng ký tài khoản mới bên Keyboard World" + "\n" + "Mã xác nhận của bạn là: "
//								+ otpEmail);
//				user.setRole(roleDAO.findById(1).orElse(null));
//				this.user = user;
//				return "redirect:/keyboardworld/otp";
//			}
//		}
//		model.addAttribute("views", "/WEB-INF/views/account/register.jsp");
//		return "index";
//	}

	@PostMapping("/register")
	public String registerPost(Model model, @Valid @ModelAttribute User user,
			@RequestParam("confirmpassword") String confirmPass, BindingResult result) {
		if (result.hasErrors()) {
			return "error_view"; // Trả về trang hiển thị lỗi
		}
		if (userDAO.findByEmail(user.getEmail()) == null) {
			// sửa equalIgnoreCase thành equals để tránh lỗi confirm
			if (user.getPassword().equals(confirmPass)) {
				String hashedPassword = PasswordUtils.hashPassword(user.getPassword());
				if (hashedPassword == null) {
					model.addAttribute("error", "Error occurred while hashing the password.");
					return "error_view"; // Trả về trang hiển thị lỗi
				}
				user.setPassword(hashedPassword); // Set mật khẩu mã hoá cho user

				otpEmail = RandomUtils.generateOTP();
				emailService.sendEmail(user.getEmail(), "KEYBOARD WORLD",
						"Bạn vừa đăng ký tài khoản mới bên Keyboard World" + "\n" + "Mã xác nhận của bạn là: "
								+ otpEmail);
				user.setRole(roleDAO.findById(1).orElse(null));
				user.setActive(1);
				user.setImage("defaultAvatar.jpg");
				this.user = user;
				return "redirect:/keyboardworld/otp";
			} else {
				model.addAttribute("error", "Passwords do not match.");
			}
		} else {
			model.addAttribute("error", "Email already exists.");
		}
		model.addAttribute("views", "/WEB-INF/views/account/register.jsp");
		return "index";
	}

	@GetMapping("/otp")
	public String otpGet(Model model) {
		model.addAttribute("views", "/WEB-INF/views/account/acceptEmail.jsp");
		return "index";
	}

	@PostMapping("/otp")
	public String otpPost(Model model, @RequestParam("otp") String otp) {
		if (otpEmail.equalsIgnoreCase(otp)) {
			if (user != null) {
				userDAO.save(user);
				session.setAttribute("userS", user);
				return "redirect:/keyboardworld";
			}
		}
		model.addAttribute("views", "/WEB-INF/views/account/acceptEmail.jsp");
		return "index";
	}
}
