package com.asmkbw.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Order_Detail")
@Data
@NoArgsConstructor
@AllArgsConstructor

public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OrderdetailID")
	Integer orderDetailID;

	@Column(name = "Quantity")
	Integer quantity;

	@ManyToOne
	@JoinColumn(name = "OrderID")
	Order order;

	@ManyToOne
	@JoinColumn(name = "ProductdetailID")
	ProductDetail productDetail;
}
