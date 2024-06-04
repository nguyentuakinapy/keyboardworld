package com.asmkbw.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asmkbw.entity.Gallery;
import com.asmkbw.entity.Product;

public interface GalleryDAO extends JpaRepository<Gallery, Integer> {

	@Query("SELECT o FROM Gallery o WHERE o.product = ?1")
	Gallery findbyProduct(Product product);

}
