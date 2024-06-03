package com.asmkbw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asmkbw.dao.CartDAO;
import com.asmkbw.dao.ProductDetailDAO;
import com.asmkbw.entity.Cart;
import com.asmkbw.entity.ProductDetail;
import com.asmkbw.entity.User;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class CartController {

	@Autowired
	ProductDetailDAO productDetailDAO;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	HttpSession session;

	@RequestMapping("/keyboardworld/viewcart")
	public String viewCart(Model model) {
		User user = (User) session.getAttribute("userS");
		if (user == null) {
			return "redirect:/keyboardworld/login";
		}
		List<Cart> listCarts = cartDAO.findByIDUser(user);
		model.addAttribute("listCarts", listCarts);

		model.addAttribute("views", "/WEB-INF/views/cart/viewcart.jsp");
		return "index";
	}

	@RequestMapping("/keyboardworld/addtocart/{x}")
	@Transactional
	public String addToCart(Model model, @PathVariable("x") Integer id, @RequestParam("quantity") Integer qty) {
		User user = (User) session.getAttribute("userS");
		if (user != null) {
			List<Cart> list = cartDAO.findByIDUser(user);
			boolean productExistsInCart = false;
			for (Cart c : list) {
				if (id.equals(c.getProductDetail().getProductDetailID())) {
					if (qty != 1) {
						c.setQuantity(c.getQuantity() + qty);
						cartDAO.save(c);
						productExistsInCart = true;
						break;
					} else if (qty == 1) {
						c.setQuantity(c.getQuantity() + 1);
						cartDAO.save(c);
						productExistsInCart = true;
						break;
					}

				}
			}

			if (!productExistsInCart) {
				Cart cart = new Cart();
				cart.setProductDetail(productDetailDAO.findById(id).orElse(null));
				if (qty != 1) {
					cart.setQuantity(qty);
				} else if (qty == 1) {
					cart.setQuantity(1);
				}
				cart.setUser(user);
				cartDAO.save(cart);
			}

			return "redirect:/keyboardworld/viewcart";
		}
		return "redirect:/keyboardworld/login";
	}

	@RequestMapping("/keyboardworld/deletecart/{x}")
	public String deleteCart(Model model, @PathVariable("x") Integer id) {
		User user = (User) session.getAttribute("userS");
		if (user != null) {
			cartDAO.deleteById(id);
		}
		return "redirect:/keyboardworld/viewcart";
	}
}
