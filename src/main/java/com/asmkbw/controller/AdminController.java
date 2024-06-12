package com.asmkbw.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.asmkbw.dao.CategoryDAO;
import com.asmkbw.dao.OrderDAO;
import com.asmkbw.dao.RoleDAO;
import com.asmkbw.dao.UserDAO;
import com.asmkbw.entity.Order;
import com.asmkbw.entity.Product;
import com.asmkbw.entity.Role;
import com.asmkbw.entity.User;
import com.asmkbw.service.ParamService;
import com.asmkbw.service.SessionService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/keyboardworld/admin")
public class AdminController {
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	SessionService service;
	@Autowired
	UserDAO userDAO;
	@Autowired
	HttpServletRequest req;
	@Autowired
	RoleDAO roleDAO;
	@Autowired
	ParamService paramService;
	@Autowired
	ServletContext app;
	@Autowired
	OrderDAO orderDAO;

	@RequestMapping
	public String index(Model model) {
		model.addAttribute("views", "account.jsp");
		return "admin/index";
	}

	@RequestMapping("/userlist")
	public String user(Model model, @RequestParam("page") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> keyword, @RequestParam("edit") Optional<Boolean> edit,
			@RequestParam("userID") Optional<Integer> userID) {
		String kwords = keyword.orElse(service.get("keywords", ""));
		service.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 5, Sort.by("userID"));
		Page<User> page = userDAO.findAllByFullNameLikeAndRoleName("%" + kwords + "%", "User", pageable);
		model.addAttribute("page", page);
//		List<User> customer = userDAO.findAllByRoleName("User");
//		model.addAttribute("customer", customer);
		model.addAttribute("views", "listuser.jsp");
		return "admin/index";
	}

	@RequestMapping("/adminlist")
	public String admin(Model model, @RequestParam("page") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> keyword, @RequestParam("edit") Optional<Boolean> edit,
			@RequestParam("userID") Optional<Integer> userID) {
		String kwords = keyword.orElse(service.get("keywords", ""));
		service.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 5, Sort.by("userID"));
		Page<User> page = userDAO.findAllByFullNameLikeAndRoleName("%" + kwords + "%", "Admin", pageable);
		model.addAttribute("page", page);
		model.addAttribute("views", "listadmin.jsp");
		return "admin/index";
	}

	@RequestMapping("/userlist/delete/{userID}")
	public String deleteUser(Model model, @PathVariable("userID") Integer userID) {
		userDAO.deleteById(userID);
		return "redirect:/keyboardworld/admin/userlist";
	}

	@RequestMapping("/edituser")
	public String edit1(Model model) {
		model.addAttribute("views", "edituser.jsp");
		return "admin/index";
	}

	@RequestMapping("/edit/{userID}")
	public String edit(Model model, @PathVariable("userID") Integer userID) {
		User item = userDAO.findById(userID).get();
		model.addAttribute("item", item);
		model.addAttribute("views", "edituser.jsp");
		return "admin/index";
	}

	@PostMapping("/updateUser")
	public String updateUser(@RequestParam("email") String email, @RequestParam("fullName") String fullName,
			@RequestParam("active") Integer active, @RequestParam("avatar") MultipartFile avatar)
			throws IllegalStateException, IOException {
		User item = userDAO.findByEmail(email);
		if (item != null) {
			item.setFullName(fullName);
			item.setActive(active);
			if (!avatar.getOriginalFilename().equals("")) {
				item.setImage(avatar.getOriginalFilename());
			}
			paramService.save(avatar, app.getRealPath("/images/"));
			userDAO.save(item);
		}
		return "redirect:/keyboardworld/admin/userlist";
	}

	@PostMapping("/updateRole")
	public ResponseEntity<?> updateRole(@RequestBody Map<String, Object> payload) {
		try {
			// Convert userID from String to Integer
			Integer userID = Integer.parseInt(payload.get("userID").toString());
			String roleName = (String) payload.get("role");

			Optional<User> optionalUser = userDAO.findById(userID);
			if (!optionalUser.isPresent()) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("User not found");
			}

			User user = optionalUser.get();
			Role role = roleDAO.findByRoleName(roleName);
			if (role == null) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Role not found");
			}

			user.setRole(role);
			userDAO.save(user);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Server error: " + e.getMessage());
		}
	}

	@PostMapping("/createUser")
	public String createUser(@RequestParam("email") String email, @RequestParam("fullName") String fullName,
			@RequestParam("password") String password, @RequestParam("active") Integer active,
			@RequestParam("avatar") MultipartFile avatar) throws IllegalStateException, IOException {
		User user = new User();
		user.setFullName(fullName);
		user.setEmail(email);
		if (!avatar.isEmpty()) {
			user.setImage(avatar.getOriginalFilename());
			paramService.save(avatar, app.getRealPath("/images/"));
		} else {
			user.setImage("defaultAvatar.jpg");
		}
		user.setPassword(password);
		user.setRole(roleDAO.findById(1).orElse(null));
		user.setActive(active);
		userDAO.save(user);
		return "redirect:/keyboardworld/admin/userlist";
	}

	@RequestMapping("/orderall")
	public String orderAll(Model model) {
		List<Order> orders = orderDAO.findAll();
		model.addAttribute("orders", orders);
		model.addAttribute("views", "orderAll.jsp");
		return "admin/index";
	}
}
