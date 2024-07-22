package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "color")
public class Color {
	@Id
	@Column(name = "id")
	private Integer id;
	@Column(name = "name")
	private String name;

}
