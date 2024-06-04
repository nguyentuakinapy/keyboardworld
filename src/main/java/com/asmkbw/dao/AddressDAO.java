package com.asmkbw.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asmkbw.entity.Address;

public interface AddressDAO extends JpaRepository<Address, Integer> {

	@Query("SELECT a FROM Address a, User u WHERE u.email = ?1")
	List<Address> findAddressByEmail(String email);
}
