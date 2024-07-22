package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Account;
import com.example.demo.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Long>{}


