package com.asmkbw.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
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
@Table(name = "Address")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Address {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AddressID")
	Integer addRessID;

	@Column(name = "Addressdetail")
	String addRessDetail;

	@Column(name = "Phone")
	String phone;

	@Column(name = "City")
	String city;

	@Column(name = "District")
	String district;

	@Column(name = "Ward")
	String ward;

	@Column(name = "Distance")
	Double distance;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "UserID")
	User user;

}
