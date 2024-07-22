package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Thongke;

@Repository
public class ThongkeDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Map<String, Object>> thongKeTheoThang(String year, String month) {
		String sql = "SELECT YEAR(o.createdate) AS Year, " + "MONTH(o.createdate) AS Month, "
				+ "COUNT(o.id) AS TotalOrders, " + "SUM(od.price * od.quantity) AS TotalRevenue, "
				+ "SUM(od.quantity) AS TotalQuantitySold " + "FROM orders o "
				+ "JOIN orderdetails od ON o.id = od.orderid "
				+ "WHERE YEAR(o.createdate) = ? AND MONTH(o.createdate) = ? "
				+ "GROUP BY YEAR(o.createdate), MONTH(o.createdate) " + "ORDER BY Year, Month";

		return jdbcTemplate.queryForList(sql, year, month);
	}

	public List<Map<String, Object>> thongkeTongDoanhThu() {
		String sql = "SELECT YEAR(o.createdate) AS Year, " + "MONTH(o.createdate) AS Month, "
				+ "COUNT(o.id) AS TotalOrders, " + "SUM(od.price * od.quantity) AS TotalRevenue, "
				+ "SUM(od.quantity) AS TotalQuantitySold " + "FROM orders o "
				+ "JOIN orderdetails od ON o.id = od.orderid " + "GROUP BY YEAR(o.createdate), MONTH(o.createdate) "
				+ "ORDER BY Year, Month";

		return jdbcTemplate.queryForList(sql);
	}

	public List<Map<String, Object>> thongkeTungNguoiDung() {
		String sql = "SELECT \r\n" + "    a.username, \r\n" + "    a.email, \r\n" + "    a.fullname, \r\n"
				+ "    COUNT(o.id) AS TotalOrders, \r\n" + "    SUM(od.price * od.quantity) AS TotalRevenue\r\n"
				+ "FROM \r\n" + "    orders o\r\n" + "JOIN \r\n" + "    accounts a ON o.username = a.username\r\n"
				+ "JOIN \r\n" + "    orderdetails od ON o.id = od.orderid\r\n" + "GROUP BY \r\n"
				+ "    a.username, a.email, a.fullname;";

		return jdbcTemplate.queryForList(sql);
	}

	public List<Map<String, Object>> thongkeTungSP() {
		String sql = "SELECT o.id AS OrderID, od.quantity, o.createdate AS OrderDate, p.image, p.name AS ProductName, p.price, p.sale,\r\n"
				+ "       a.username AS UserName, a.email, a.fullname\r\n" + "FROM orders o\r\n"
				+ "JOIN orderdetails od ON o.id = od.orderid\r\n" + "JOIN products p ON od.productid = p.id\r\n"
				+ "JOIN accounts a ON o.username = a.username;\r\n" + "";

		return jdbcTemplate.queryForList(sql);
	}

}