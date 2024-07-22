package com.example.demo.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;
import lombok.Data;

@Data
@Entity
@Table(name = "products")
public class Product implements Serializable {
	@Id
	@Column(name = "id")
	private Integer id;

	@Column(name = "available")
	private Boolean available;

	@Temporal(TemporalType.DATE)
	@Column(name = "createdate")
	private Date createDate;

	@Column(name = "image")
	private String image;

	@Column(name = "name")
	private String name;

	@Column(name = "price")
	private Float price;

	@ManyToOne
	@JoinColumn(name = "colorid")
	private Color color;

	@ManyToOne
	@JoinColumn(name = "capacityid")
	private Capacity capacity;

	@Column(name = "sale")
	private Integer sale;

	@ManyToOne
	@JoinColumn(name = "categoryid")
	private Category category;

	// Thêm thuộc @@Transient để lưu giá trị sau khi giảm giá
	// Chú ý: @Transient chỉ ra rằng thuộc tính này không cần lưu vào cơ sở dữ liệu
	@Transient
	private int idCartProduct;
	
	@Transient
	private String colorName;
	
	@Transient
	private int capacityName;
	
	@Transient
	private String priceOld;

	@Transient
	private String priceNew;
	@Transient
	private String price256;

	@Transient
	private String price512;

	@Transient
	private int count;
	@Transient
	private String sum;

}