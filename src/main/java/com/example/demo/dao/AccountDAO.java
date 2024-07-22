package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entity.Account;

import jakarta.transaction.Transactional;

public interface AccountDAO extends JpaRepository<Account, String> {
	Account findByUsername(String username);
	
	@Transactional
    @Modifying
    @Query("UPDATE Account a SET a.activated = true WHERE a.username = :username")
    void setActivatedByUsername(String username);

}
