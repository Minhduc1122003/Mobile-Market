package com.example.demo.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
@Entity
@Table(name = "accounts")
public class Account implements Serializable {
	@Id
	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "fullname")
	private String fullname;

	@Column(name = "email")
	private String email;

	@Column(name = "photo")
	private String photo;

	@Column(name = "activated")
	private Boolean activated;

	@Column(name = "admin")
	private Boolean admin;

	@Column(name = "birthday")
	private Date birthday;

	@Column(name = "gender")
	private Boolean gender;

	@OneToMany(mappedBy = "account")
	private List<Order> orders;

	@Transient
	private String activateString;
}
