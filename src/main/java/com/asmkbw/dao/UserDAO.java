package com.asmkbw.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asmkbw.entity.User;

public interface UserDAO extends JpaRepository<User, Integer> {

	@Query("SELECT u FROM User u WHERE u.email = ?1")
	User findByEmail(String email);

	@Query("SELECT u.email FROM User u")
	List<String> listEmail();
	
}
