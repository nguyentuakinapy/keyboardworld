package com.asmkbw.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asmkbw.entity.Order;
import com.asmkbw.entity.User;

public interface OrderDAO extends JpaRepository<Order, Integer> {

	@Query("SELECT o FROM Order o, User u WHERE u.email = ?1")
	List<Order> findByEmail(String email);

//	@Query("SELECT new com.asmkbw.entity.NewOD(o.orderID, p.productID, pd.thumbNail, p.name, pd.color, od.quantity, pd.price, "
//			+ "a.addRessDetail, a.ward, a.district, a.city, a.phone) " + "FROM Order o " + "JOIN o.user u "
//			+ "JOIN o.orderDetails od " + "JOIN od.productDetail pd " + "JOIN pd.product p " + "JOIN u.addresses a "
//			+ "WHERE u.email = ?1 AND o.orderID  = ?2")
//	List<NewOD> findOrderDetail(String email, int odID);

	Order findByUserAndOrderID(User user, Integer id);

	List<Order> findByUser(User user);

}
