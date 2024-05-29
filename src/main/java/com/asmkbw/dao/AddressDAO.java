package com.asmkbw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asmkbw.entity.Address;

public interface AddressDAO extends JpaRepository<Address, Integer> {

}
