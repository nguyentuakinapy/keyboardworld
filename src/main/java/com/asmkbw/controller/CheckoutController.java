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
	private ProductDetailDAO productDetailDAO;

	@Autowired
	private VoucherDAO voucherDAO;

	@Autowired
	private HttpSession session;

	@RequestMapping("/keyboardworld/checkout1")
	public String checkout(@RequestParam MultiValueMap<String, String> params, Model model) {
		// ktra user login chưa
		User user = (User) session.getAttribute("userS");
		if (user == null) {
			return "redirect:/keyboardworld/login";
		}

		// tìm địa chỉ và giỏ hàng của user
		List<Address> addresses = addressDAO.findByIDUser(user);
		List<Cart> listCarts = cartDAO.findByIDUser(user);
		// cart trống về viewcart
		if (listCarts.isEmpty()) {
			return "redirect:/keyboardworld/viewcart";
		}

		if (!params.containsKey("selectedAddressId")) {
			model.addAttribute("addresses", addresses);
			model.addAttribute("listCarts", listCarts);
			return "/keyboardworld/checkout";
		}

		Integer selectedAddressId = Integer.parseInt(params.getFirst("selectedAddressId"));
		String voucherCode = params.getFirst("voucherCode");

		// đoạn này hỏi chatgpt chỗ sổ địa chỉ nên ko rõ lắm
		Optional<Address> addressOpt = addressDAO.findById(selectedAddressId);
		if (!addressOpt.isPresent()) {
			model.addAttribute("addresses", addresses);
			model.addAttribute("listCarts", listCarts);
			return "/keyboardworld/checkout";
		}
		Address address = addressOpt.get();

		Order order = new Order();
		order.setUser(user);
		order.setAddRess(address.getAddRessDetail());
		order.setPhone(address.getPhone());
		order.setDate(new java.util.Date());
		order.setStatus(0); // này ko biết để j nên để 0

		double totalPrice = 0.0;
		for (Cart cartItem : listCarts) {
			totalPrice += cartItem.getQuantity() * cartItem.getProductDetail().getPrice();
		}

		if (voucherCode != null && !voucherCode.isEmpty()) {
			Optional<Voucher> voucherOpt = voucherDAO.findByName(voucherCode);
			if (voucherOpt.isPresent()) {
				Voucher voucher = voucherOpt.get();
				order.setVoucher(voucher);

				// nếu có giảm giá thì trừ tiền
				double discount = totalPrice * voucher.getPercentDecrease() / 100;
				totalPrice -= discount;
				order.setTotalPrice(totalPrice);
			}
		} else {
			order.setTotalPrice(totalPrice);
		}

		orderDAO.save(order);

		for (Cart listCart : listCarts) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setProductDetail(listCart.getProductDetail());
			orderDetail.setQuantity(listCart.getQuantity());

			orderDetailDAO.save(orderDetail);

			// update số lượng của sản phẩm sau khi thằng khách thanh toán
			ProductDetail productDetail = listCart.getProductDetail();
			productDetail.setQuantity(productDetail.getQuantity() - listCart.getQuantity());
			productDetailDAO.save(productDetail);
		}

		cartDAO.deleteAll(listCarts);

		return "redirect:/keyboardworld/viewcart";
	}

	List<Integer> cartID = new ArrayList<Integer>();

	@RequestMapping("/keyboardworld/checkout")
	public String checkout(Model model, @RequestParam("selectedItems") List<Integer> cartID) {
		User user = (User) session.getAttribute("userS");
		if (user == null) {
			return "redirect:/keyboardworld/login";
		}
		List<Address> addresses = addressDAO.findByIDUser(user);
		model.addAttribute("addresses", addresses);
		List<Cart> carts = cartDAO.findByCartIDAndUser(cartID, user);
		model.addAttribute("carts", carts);
		List<Voucher> vouchers = voucherDAO.findAll();
		model.addAttribute("vouchers", vouchers);
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
}
