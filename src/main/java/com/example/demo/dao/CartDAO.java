package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.entity.Cart;

import jakarta.transaction.Transactional;

public interface CartDAO extends JpaRepository<Cart, Integer> {

	@Query("SELECT c FROM Cart c WHERE c.userID = :username")
	List<Cart> findByUserID(@Param("username") String username);

	@Query("SELECT c FROM Cart c WHERE c.userID = :username AND c.productID.id = :productId")
	Cart findByUserIDAndProductID(@Param("username") String username, @Param("productId") int productId);

	@Query("SELECT c FROM Cart c WHERE c.userID = :username AND c.productID.id = :productId AND c.colorID.id = :colorId AND c.capacityID.id = :capacityId")
	Cart findByUserIDAndProductIDAndColorIDAndCapacityID(@Param("username") String username,
			@Param("productId") int productId, @Param("colorId") int colorId, @Param("capacityId") int capacityId);

	@Modifying
	@Transactional
	@Query("UPDATE Cart c SET c.quantity = :quantity WHERE c.userID = :userID AND c.productID.id = :productId AND c.colorID.id = :colorId AND c.colorID.id = :colorId AND c.capacityID.id = :capacityId")
	void updateCart(@Param("userID") String userID, @Param("productId") int productId, @Param("quantity") int quantity,
			@Param("colorId") int colorId, @Param("capacityId") int capacityId);

	@Modifying
	@Transactional
	@Query("UPDATE Cart c SET c.quantity = :quantity WHERE c.cartID = :cartID")
	void updateQuantity(@Param("cartID") int cartID,  @Param("quantity") int quantity);
}
