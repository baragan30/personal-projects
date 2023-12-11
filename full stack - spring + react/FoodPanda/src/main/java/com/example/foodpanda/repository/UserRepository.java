package com.example.foodpanda.repository;

import com.example.foodpanda.model.Restaurant;
import com.example.foodpanda.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Long> {
    List<User> findUserByUsername(String username);
    List<User> findAll();
}