package com.asmkbw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asmkbw.dao.CartDAO;
import com.asmkbw.dao.OrderDAO;
import com.asmkbw.dao.OrderDetailDAO;
import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.dao.VoucherDAO;
import com.asmkbw.entity.Cart;
import com.asmkbw.entity.Order;
import com.asmkbw.entity.OrderDetail;
import com.asmkbw.entity.User;
import com.asmkbw.entity.Voucher;
import com.asmkbw.controller.*;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class CheckoutController {

    @Autowired
    CartDAO cartDAO;
    @Autowired
    VoucherDAO voucherDAO;

    @Autowired
    OrderDAO orderDAO;

    @Autowired
    OrderDetailDAO orderDetailDAO;

    @Autowired
    HttpSession session;
    @Autowired
	ProductDetailDAO productDetailDAO;


	@RequestMapping("/keyboardworld/checkout")
	public String viewcheckout(Model model) {
		User user = (User) session.getAttribute("userS");
		if (user == null) {
			return "redirect:/keyboardworld/login";
		}
		List<Cart> listCarts = cartDAO.findByIDUser(user);
		List<Voucher> voucher = voucherDAO.findAll();
		model.addAttribute("listCarts", listCarts);
		model.addAttribute("voucher", voucher);

		model.addAttribute("views", "/WEB-INF/views/cart/checkout.jsp");
		return "index";
	}




}

