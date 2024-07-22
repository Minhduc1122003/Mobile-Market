package com.example.demo.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
@Data
@Entity
@Table(name = "categories") // Chú ý: tên bảng phải viết thường
public class Category implements Serializable {

    @Id
    @Column(name = "id") // Chú ý: chỉ định tên cột cho trường id
    private String id;

    @Column(name = "name")
    private String name;

  
    // Constructors, getters, and setters
}