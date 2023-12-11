package com.example.foodpanda.repository;

import com.example.foodpanda.model.Order;
import com.example.foodpanda.model.Restaurant;
import com.example.foodpanda.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order,Long> {
    List<Order> findAll();
    List<Order> findOrderByUser(User user);
    List<Order> findOrderByRestaurant(Restaurant restaurant);
}
