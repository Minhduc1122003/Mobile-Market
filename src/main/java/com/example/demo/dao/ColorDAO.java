package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Color;

public interface ColorDAO extends JpaRepository<Color, Integer> {


}
