package com.asmkbw.entity;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Order")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OrderID")
	Integer orderID;

	@Column(name = "TotalPrice")
	Double totalPrice;

	@Column(name = "Date")
	Date date;

	@Column(name = "Address")
	String addRess;

	@Column(name = "Phone")
	String phone;

	@Column(name = "Status")
	Integer status;

	@ManyToOne
	@JoinColumn(name = "UserID")
	User user;

	@ManyToOne
	@JoinColumn(name = "VoucherID")
	Voucher voucher;

	@OneToMany(mappedBy = "order")
	List<OrderDetail> orderDetails;
	
	
}
