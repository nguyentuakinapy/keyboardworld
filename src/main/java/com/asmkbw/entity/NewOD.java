package com.asmkbw.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NewOD {
	Integer orderId;
	Integer productId;
	String thumbNail;
	String productName;
	String color;
	Integer quantity;
	Double price;
	String addressId;
	String ward;
	String district;
	String city;
	String phone;
}
