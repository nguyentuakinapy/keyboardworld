package com.asmkbw.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asmkbw.entity.Address;
import com.asmkbw.entity.User;

public interface AddressDAO extends JpaRepository<Address, Integer> {

	@Query("SELECT o FROM Address o WHERE o.user = ?1")
	List<Address> findByIDUser(User user);
}
