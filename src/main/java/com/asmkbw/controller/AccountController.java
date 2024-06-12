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
import com.asmkbw.dao.OrderDetailDAO;
import com.asmkbw.dao.UserDAO;
import com.asmkbw.entity.Address;
import com.asmkbw.entity.Order;
import com.asmkbw.entity.OrderDetail;
import com.asmkbw.entity.User;
import com.asmkbw.service.GeocodingService;
import com.asmkbw.utils.PasswordUtils;

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
		List<Order> list = odao.findByUser(user);
		model.addAttribute("list", list);
		model.addAttribute("views", "/WEB-INF/views/account/orders.jsp");
		return "index";
	}

	@Autowired
	OrderDetailDAO detailDAO;

	@RequestMapping("/order/detail/{orderID}")
	public String orderDetail(Model model, @PathVariable("orderID") Integer orderID) {
		User user = (User) req.getSession().getAttribute("userS");
		Order order = odao.findByUserAndOrderID(user, orderID);
		List<OrderDetail> details = order.getOrderDetails();
		for (int i = 0; i < details.size(); i++) {
			System.out.println(details.get(i).getOrder().getAddRess() + details.get(i).getOrderDetailID()
					+ details.get(i).getQuantity() * details.get(i).getProductDetail().getPrice());

		}

		model.addAttribute("order", order);
		model.addAttribute("list", details);
		model.addAttribute("views", "/WEB-INF/views/account/orders_detail.jsp");
		return "index";
	}

	@GetMapping("/changepass")
	public String changepass(Model model) {
		model.addAttribute("views", "/WEB-INF/views/account/changepass.jsp");
		return "index";
	}

//	@PostMapping("/changepass")
//	public String changepassUpdate(Model model, @RequestParam("currentPass") String currentPass,
//			@RequestParam("newPass") String newPass, @RequestParam("confirmPass") String confirmPass) {
//		User user = (User) req.getSession().getAttribute("userS");
//		System.out.println(newPass);
//		System.out.println(confirmPass);
//		if (currentPass.equals(user.getPassword())) {
//			if (newPass.length() < 6 || newPass.length() > 16) {
//				model.addAttribute("message", "Mật khẩu phải từ 6 đến 16 ký tự!");
//			} else {
//				if (newPass.equals(confirmPass)) {
//					user.setPassword(newPass);
//					udao.save(user);
//					model.addAttribute("message", "Đổi mật khẩu thành công!");
//				} else {
//					model.addAttribute("message", "Xác nhận mật khẩu không chính xác!");
//				}
//			}
//		} else {
//			model.addAttribute("message", "Mật khẩu hiện tại không đúng!");
//		}
//		model.addAttribute("views", "/WEB-INF/views/account/changepass.jsp");
//		return "index";
//	}

	@PostMapping("/changepass")
	public String changepassUpdate(Model model, @RequestParam("currentPass") String currentPass,
			@RequestParam("newPass") String newPass, @RequestParam("confirmPass") String confirmPass) {
		User user = (User) req.getSession().getAttribute("userS");

		// Hash the entered current password
		String hashedCurrentPass = PasswordUtils.hashPassword(currentPass);

		if (hashedCurrentPass != null && hashedCurrentPass.equals(user.getPassword())) {
			if (newPass.length() < 6 || newPass.length() > 16) {
				model.addAttribute("message", "Mật khẩu phải từ 6 đến 16 ký tự!");
			} else {
				if (newPass.equals(confirmPass)) {
					// Hash the new password before saving
					String hashedNewPass = PasswordUtils.hashPassword(newPass);
					if (hashedNewPass == null) {
						model.addAttribute("message", "Có lỗi xảy ra trong quá trình mã hóa mật khẩu mới.");
					} else {
						user.setPassword(hashedNewPass);
						udao.save(user);
						model.addAttribute("message", "Đổi mật khẩu thành công!");
					}
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
		List<Address> items = adao.findByIDUser(user);
		model.addAttribute("items", items);
		model.addAttribute("views", "/WEB-INF/views/account/address.jsp");
		return "index";
	}

	@RequestMapping("/address/edit/{addRessID}")
	public String addressEdit(Model model, @PathVariable("addRessID") Integer addRessID) {
		User user = (User) req.getSession().getAttribute("userS");
		Address address = adao.findById(addRessID).get();
		model.addAttribute("address", address);
		List<Address> items = adao.findByIDUser(user);
		model.addAttribute("items", items);
		model.addAttribute("views", "/WEB-INF/views/account/address.jsp");
		return "index";
	}

	@RequestMapping("/address/create")
	public String addressCreate(Model model, Address address, @RequestParam("addRessDetail") String addRessDetail) {
		User user = (User) req.getSession().getAttribute("userS");
		address.setUser(user);
		address.setAddRessDetail(addRessDetail);
		address.setDistance(GeocodingService.getDistance(address.getDistrict() + ", " + address.getCity()));
		adao.save(address);
		List<Address> items = adao.findByIDUser(user);
		model.addAttribute("items", items);
		model.addAttribute("views", "/WEB-INF/views/account/address.jsp");
		return "index";
	}

	@RequestMapping("/address/delete/{addRessID}")
	public String addressDelete(Model model, @PathVariable("addRessID") Integer addRessID) {
		User user = (User) req.getSession().getAttribute("userS");
		adao.deleteById(addRessID);
		List<Address> items = adao.findByIDUser(user);
		model.addAttribute("items", items);
		model.addAttribute("message", "Đã xóa địa chỉ thành công!");
		model.addAttribute("views", "/WEB-INF/views/account/address.jsp");
		return "index";
	}

}
