package com.asmkbw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asmkbw.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {

}
