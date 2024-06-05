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

	@Query("SELECT p FROM Product p LEFT JOIN p.category c LEFT JOIN p.productDetails pd "
			+ "WHERE p.name LIKE %:keywords% OR c.name LIKE %:keywords% OR p.property LIKE %:keywords% OR pd.color LIKE %:keywords%")
	Page<Product> searchByMultipleCriteria(@Param("keywords") String keywords, Pageable pageable);

	Page<Product> findAllByNameLike(String keywords, Pageable pageable);

	@Query("SELECT p FROM Product p WHERE p.category.categoryID IN :categoryIds")
	Page<Product> findByCategoryIDAjax(@Param("categoryIds") List<Integer> categoryIds, Pageable pageable);

}
