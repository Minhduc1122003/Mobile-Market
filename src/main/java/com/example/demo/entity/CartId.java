package com.example.demo.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class CartId implements Serializable {
    private String userID;
    private int productID;

    public CartId() {}

    public CartId(String userID, int productID) {
        this.userID = userID;
        this.productID = productID;
    }
}
