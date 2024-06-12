package com.asmkbw.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asmkbw.entity.User;
import com.asmkbw.entity.Role;


public interface UserDAO extends JpaRepository<User, Integer> {

	@Query("SELECT u FROM User u WHERE u.email = ?1")
	User findByEmail(String email);

	@Query("SELECT u.email FROM User u")
	List<String> listEmail();
	
	@Query("SELECT u FROM User u WHERE u.fullName LIKE %?1% AND u.role.roleName = ?2")
	Page<User> findAllByFullNameLikeAndRoleName(String keywords, String roleName, Pageable pageable);
	
	User findByUserID(Integer userID);
}
