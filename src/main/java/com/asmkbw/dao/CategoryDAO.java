package com.asmkbw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asmkbw.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, Integer> {

}
