package com.asmkbw.dao;


import org.springframework.data.jpa.repository.JpaRepository;

import com.asmkbw.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer> {
}
