package com.asmkbw.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.asmkbw.entity.Voucher;

public interface VoucherDAO extends JpaRepository<Voucher, Integer> {
	@Query("SELECT v FROM Voucher v WHERE v.name = :name")
	Optional<Voucher> findByName(@Param("name") String name);
}
