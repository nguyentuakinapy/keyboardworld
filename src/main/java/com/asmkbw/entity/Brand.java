package com.asmkbw.entity;

import java.util.List;

import jakarta.annotation.Generated;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Brand")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Brand {
	@Id
	@Column(name = "BrandID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer brandID;

	@Column(name = "Name")
	String name;

	@Column(name = "Address")
	String addRess;

	@Column(name = "Phone")
	String phone;

	@Column(name = "Email")
	String email;

	@OneToMany(mappedBy = "brand")
	List<Product> products;
}
