package com.asmkbw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asmkbw.entity.Gallery;

public interface GalleryDAO extends JpaRepository<Gallery, Integer> {

}
