package com.asmkbw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asmkbw.dao.AddressDAO;
import com.asmkbw.dao.OrderDAO;
import com.asmkbw.dao.UserDAO;
import com.asmkbw.entity.Address;
import com.asmkbw.entity.NewOD;
import com.asmkbw.entity.Order;
import com.asmkbw.entity.User;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/keyboardworld")
public class AccountController {
	@Autowired
	HttpServletRequest req;
	@Autowired
	UserDAO udao;
	@Autowired
	AddressDAO adao;
	@Autowired
	OrderDAO odao;

	@GetMapping("/account")
	public String account(Model model) {
		User user = (User) req.getSession().getAttribute("userS");
		User item = udao.findByEmail(user.getEmail());
		model.addAttribute("item", item);
		model.addAttribute("views", "/WEB-INF/views/account/account.jsp");
		return "index";
	}

	@PostMapping("/account")
	public String accountUpdate(Model model, @RequestParam("fullName") String fullName) {
		User user = (User) req.getSession().getAttribute("userS");
		if (fullName.matches("^[\\p{L}][\\p{L} \\p{M}.'-]*$")) {
			user.setFullName(fullName);
			udao.save(user);
			model.addAttribute("message", "Cập nhật tài khoản thành công!");
			User item = udao.findByEmail(user.getEmail());
			model.addAttribute("item", item);
		} else {
			model.addAttribute("message", "Họ và tên chỉ được chứa ký tự chữ cái và khoảng trống!");
		}
		model.addAttribute("views", "/WEB-INF/views/account/account.jsp");
		return "index";
	}

	@RequestMapping("/order")
	public String order(Model model) {
		User user = (User) req.getSession().getAttribute("userS");
		List<Order> list = odao.findByEmail(user.getEmail());
		model.addAttribute("list", list);
		model.addAttribute("views", "/WEB-INF/views/account/orders.jsp");
		return "index";
	}
	
	@RequestMapping("/order/detail/{orderID}")
	public String orderDetail(Model model, @PathVariable("orderID") Integer orderID) {
		User user = (User) req.getSession().getAttribute("userS");
		List<NewOD> list = odao.findOrderDetail(user.getEmail(), orderID);
		model.addAttribute("list", list);
		model.addAttribute("views", "/WEB-INF/views/account/orders_detail.jsp");
		return "index";
	}

	@GetMapping("/changepass")
	public String changepass(Model model) {
		model.addAttribute("views", "/WEB-INF/views/account/changepass.jsp");
		return "index";
	}

	@PostMapping("/changepass")
	public String changepassUpdate(Model model, @RequestParam("currentPass") String currentPass,
			@RequestParam("newPass") String newPass, @RequestParam("confirmPass") String confirmPass) {
		User user = (User) req.getSession().getAttribute("userS");
		System.out.println(newPass);
		System.out.println(confirmPass);
		if (currentPass.equals(user.getPassword())) {
			if (newPass.length() < 6 || newPass.length() > 16) {
				model.addAttribute("message", "Mật khẩu phải từ 6 đến 16 ký tự!");
			} else {
				if (newPass.equals(confirmPass)) {
					user.setPassword(newPass);
					udao.save(user);
					model.addAttribute("message", "Đổi mật khẩu thành công!");
				} else {
					model.addAttribute("message", "Xác nhận mật khẩu không chính xác!");
				}
			}
		} else {
			model.addAttribute("message", "Mật khẩu hiện tại không đúng!");
		}
		model.addAttribute("views", "/WEB-INF/views/account/changepass.jsp");
		return "index";
	}

	@RequestMapping("/address/index")
	public String address(Model model) {
		User user = (User) req.getSession().getAttribute("userS");
		List<Address> items = adao.findAddressByEmail(user.getEmail());
		model.addAttribute("items", items);
		model.addAttribute("views", "/WEB-INF/views/account/address.jsp");
		return "index";
	}

	@RequestMapping("/address/edit/{addRessID}")
	public String addressEdit(Model model, @PathVariable("addRessID") Integer addRessID) {
		User user = (User) req.getSession().getAttribute("userS");
		Address address = adao.findById(addRessID).get();
		model.addAttribute("address", address);
		List<Address> items = adao.findAddressByEmail(user.getEmail());
		model.addAttribute("items", items);
		model.addAttribute("views", "/WEB-INF/views/account/address.jsp");
		return "index";
	}
	
	@RequestMapping("/address/create")
	public String addressCreate(Model model, Address address, @RequestParam("addRessDetail") String addRessDetail) {
		User user = (User) req.getSession().getAttribute("userS");
		address.setUser(user);
		address.setAddRessDetail(addRessDetail);
		adao.save(address);
		List<Address> items = adao.findAddressByEmail(user.getEmail());
		model.addAttribute("items", items);
		model.addAttribute("views", "/WEB-INF/views/account/address.jsp");
		return "index";
	}

	@RequestMapping("/address/delete/{addRessID}")
	public String addressDelete(Model model, @PathVariable("addRessID") Integer addRessID) {
		User user = (User) req.getSession().getAttribute("userS");
		adao.deleteById(addRessID);
		List<Address> items = adao.findAddressByEmail(user.getEmail());
		model.addAttribute("items", items);
		model.addAttribute("message", "Đã xóa địa chỉ thành công!");
		model.addAttribute("views", "/WEB-INF/views/account/address.jsp");
		return "index";
	}

}
