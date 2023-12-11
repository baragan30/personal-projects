package com.example.foodpanda.repository;

import com.example.foodpanda.model.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RestaurantRepository extends JpaRepository<Restaurant,Long> {
    List<Restaurant> findRestaurantByName(String name);
    List<Restaurant> findAll();
}
