package com.asmkbw.entity;

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
@Table(name = "Product_Detail")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Product_DetailID")
	Integer productDetailID;

	@Column(name = "Color")
	String color;

	@Column(name = "Thumbnail")
	String thumbNail;

	@Column(name = "Quantity")
	Integer quantity;

	@Column(name = "Price")
	Double price;

	@ManyToOne
	@JoinColumn(name = "ProductID")
	Product product;

	@OneToMany(mappedBy = "productDetail")
	List<Cart> carts;

	@OneToMany(mappedBy = "productDetail")
	List<OrderDetail> orderDetails;
}
