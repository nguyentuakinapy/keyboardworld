package com.asmkbw.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asmkbw.entity.ProductDetail;
import com.asmkbw.entity.Product;

public interface ProductDetailDAO extends JpaRepository<ProductDetail, Integer> {
	@Query("SELECT o FROM ProductDetail o WHERE o.product = ?1")
	List<ProductDetail> findByProduct(Product product);
}
