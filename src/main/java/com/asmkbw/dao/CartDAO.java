package com.asmkbw.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.asmkbw.entity.Cart;
import com.asmkbw.entity.User;

import jakarta.transaction.Transactional;

public interface CartDAO extends JpaRepository<Cart, Integer> {

	@Query("SELECT o FROM Cart o WHERE o.user = ?1")
	List<Cart> findByIDUser(User user);

	@Query("SELECT c FROM Cart c WHERE c.cartID IN :cartID and c.user = :user")
	List<Cart> findByCartIDAndUser(@Param("cartID") List<Integer> cartID, @Param("user") User user);

	@Modifying
	@Transactional
	@Query("DELETE FROM Cart c WHERE c.user = :user")
	void deleteByUser(@Param("user") User user);

}
