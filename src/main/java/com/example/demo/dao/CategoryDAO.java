package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Account;
import com.example.demo.entity.Category;
import com.example.demo.entity.Product;

public interface CategoryDAO extends JpaRepository<Category, String>{
	
	
}

