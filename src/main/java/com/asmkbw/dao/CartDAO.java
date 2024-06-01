package com.asmkbw.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asmkbw.entity.Cart;
import com.asmkbw.entity.User;

public interface CartDAO extends JpaRepository<Cart, Integer> {

	@Query("SELECT o FROM Cart o WHERE o.user = ?1")
	List<Cart> findByIDUser(User user);
}
