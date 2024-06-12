package com.asmkbw.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "[User]")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UserID")
	Integer userID;

	@Column(name = "Email")
	String email;

	@Column(name = "Image")
	String image;

	@NotBlank(message = "Vui lòng nhập mật khẩu")
	@Column(name = "Password")
	String password;

	@Column(name = "Fullname")
	String fullName;

	@ManyToOne
	@JoinColumn(name = "RoleID")
	Role role;

	@Column(name = "Active")
	Integer active;

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	List<Cart> carts;

	@OneToMany(mappedBy = "user")
	List<Feedback> feedbacks;

	@OneToMany(mappedBy = "user")
	List<Order> orders;

	@OneToMany(mappedBy = "user")
	List<Address> addresses;
}