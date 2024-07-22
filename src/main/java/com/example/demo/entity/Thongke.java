package com.example.demo.entity;

import org.springframework.data.annotation.Id;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import lombok.Data;
import lombok.NoArgsConstructor;

public class Thongke {

	private int year;
	private int month;
	private long totalOrders;
	private double totalRevenue;
	private int totalQuantitySold;

	public Thongke() {
		super();
	}

	public Thongke(int year, int month, long totalOrders, double totalRevenue, int totalQuantitySold) {
		super();
		this.year = year;
		this.month = month;
		this.totalOrders = totalOrders;
		this.totalRevenue = totalRevenue;
		this.totalQuantitySold = totalQuantitySold;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public long getTotalOrders() {
		return totalOrders;
	}

	public void setTotalOrders(long totalOrders) {
		this.totalOrders = totalOrders;
	}

	public double getTotalRevenue() {
		return totalRevenue;
	}

	public void setTotalRevenue(double totalRevenue) {
		this.totalRevenue = totalRevenue;
	}

	public int getTotalQuantitySold() {
		return totalQuantitySold;
	}

	public void setTotalQuantitySold(int totalQuantitySold) {
		this.totalQuantitySold = totalQuantitySold;
	}

}
