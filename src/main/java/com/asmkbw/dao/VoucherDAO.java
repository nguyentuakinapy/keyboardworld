package com.asmkbw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asmkbw.entity.Voucher;

public interface VoucherDAO extends JpaRepository<Voucher, Integer> {

}
