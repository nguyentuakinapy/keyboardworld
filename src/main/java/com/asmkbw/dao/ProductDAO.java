package com.asmkbw.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.asmkbw.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {

	@Query("SELECT o FROM Product o WHERE o.category.categoryID = :categoryId ORDER BY o.date DESC")
	Page<Product> findByCategoryID(@Param("categoryId") Integer id, Pageable pageable);

}
