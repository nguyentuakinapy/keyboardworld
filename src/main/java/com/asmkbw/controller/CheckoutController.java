package com.asmkbw.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asmkbw.dao.AddressDAO;
import com.asmkbw.dao.CartDAO;
import com.asmkbw.dao.OrderDAO;
import com.asmkbw.dao.OrderDetailDAO;
import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.dao.VoucherDAO;
import com.asmkbw.entity.Address;
import com.asmkbw.entity.Cart;
import com.asmkbw.entity.Order;
import com.asmkbw.entity.OrderDetail;
import com.asmkbw.entity.ProductDetail;
import com.asmkbw.entity.User;
import com.asmkbw.entity.Voucher;
import com.asmkbw.service.GeocodingService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CheckoutController {

	@Autowired
	private AddressDAO addressDAO;

	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private OrderDetailDAO orderDetailDAO;

	@Autowired
	private VoucherDAO voucherDAO;

	@Autowired
	private HttpSession session;

	List<Integer> cartID = new ArrayList<Integer>();

	@RequestMapping("/keyboardworld/checkout")
	public String checkout(Model model, @RequestParam("selectedItems") List<Integer> cartID,
			@RequestParam("voucher") Integer idVoucher) {
		User user = (User) session.getAttribute("userS");
		if (user == null) {
			return "redirect:/keyboardworld/login";
		}
		List<Address> addresses = addressDAO.findByIDUser(user);
		model.addAttribute("addresses", addresses);
		List<Cart> carts = cartDAO.findByCartIDAndUser(cartID, user);
		model.addAttribute("carts", carts);
		Voucher voucher = voucherDAO.findById(idVoucher).orElse(null);
		model.addAttribute("voucher", voucher);
		this.cartID = cartID;
		model.addAttribute("views", "/WEB-INF/views/checkout/checkout.jsp");
		return "index";
	}

	@RequestMapping("/keyboardworld/newcheckout")
	public String newcheckout(Model model, @RequestParam("phone") String phone, @RequestParam("city") String city,
			@RequestParam("district") String district, @RequestParam("ward") String ward,
			@RequestParam("detailaddress") String detailaddress,
			@RequestParam("category-selection") String categorySelection) {
		User user = (User) session.getAttribute("userS");
		if (user == null) {
			return "redirect:/keyboardworld/login";
		}
		List<Cart> carts = cartDAO.findByCartIDAndUser(cartID, user);
		model.addAttribute("carts", carts);

		double sumPrice = 0;
		double distance = 0;
		for (Cart p : carts) {
			sumPrice += p.getQuantity() * p.getProductDetail().getPrice();
		}
		if (categorySelection.equalsIgnoreCase("none")) {
			distance = GeocodingService.getDistance(district + ", " + city);
		}
		if (distance <= 15) {
			sumPrice += 10000;
		} else {
			sumPrice += 80 * distance;
		}
		Order order = new Order();
		order.setTotalPrice(sumPrice);
		order.setAddRess(detailaddress + ", " + ward + ", " + district + ", " + city);
		order.setStatus(0);
		order.setPhone(phone);
		order.setUser(user);
		order.setVoucher(voucherDAO.findById(1).orElse(null));
		orderDAO.save(order);
		System.out.println("Lưu thành công!");
		for (int i = 0; i < carts.size(); i++) {
			OrderDetail detail = new OrderDetail();
			detail.setOrder(order);
			detail.setQuantity(carts.get(i).getQuantity());
			detail.setProductDetail(carts.get(i).getProductDetail());
			System.out.println("Lưu detail thành công!");
			orderDetailDAO.save(detail);
		}
		for (Cart cart : carts) {
			cartDAO.delete(cart);
		}

		System.out.println(phone + city + district + ward + detailaddress);

		model.addAttribute("views", "/WEB-INF/views/checkout/checkout.jsp");
		return "redirect:/keyboardworld/order";
	}

	@PostMapping("/keyboardworld/getaddress")
	public ResponseEntity<Address> postMethodName(@RequestBody Map<String, Integer> requestBody) {
		Integer id = requestBody.get("id");
		Address address = addressDAO.findById(id).orElse(null);
//		System.out.println(address);
		return new ResponseEntity<Address>(address, HttpStatus.OK);
	}

	@PostMapping("/keyboardworld/getdistance")
	public ResponseEntity<Double> getDistance(@RequestBody String address) {
		double distance = GeocodingService.getDistance(address);
		return new ResponseEntity<>(distance, HttpStatus.OK);
	}
}
