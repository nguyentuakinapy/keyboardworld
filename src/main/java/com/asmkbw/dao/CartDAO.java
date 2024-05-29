package com.asmkbw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asmkbw.entity.Cart;

public interface CartDAO extends JpaRepository<Cart, Integer> {

}
