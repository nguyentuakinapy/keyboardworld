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
@Table(name = "Gallery")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Gallery {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "GalleryID")
	Integer galleryID;

	@Column(name = "Thumbnail")
	String thumbnail;

	@ManyToOne
	@JoinColumn(name = "ProductID")
	Product product;
}
