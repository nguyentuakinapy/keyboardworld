package com.asmkbw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asmkbw.entity.ProductDetail;

public interface ProductDetailDAO extends JpaRepository<ProductDetail, Integer> {
	
}
