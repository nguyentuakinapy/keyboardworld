package com.asmkbw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asmkbw.entity.Brand;

public interface BrandDAO extends JpaRepository<Brand, Integer> {

}
