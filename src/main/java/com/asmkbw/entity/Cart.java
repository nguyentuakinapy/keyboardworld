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
@Table(name = "Cart")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CartID")
	Integer cartID;

	@Column(name = "Quantity")
	Integer quantity;

	@ManyToOne
	@JoinColumn(name = "UserID")
	User user;

	@ManyToOne
	@JoinColumn(name = "Product_DetailID")
	ProductDetail productDetail;
}
