package com.example.foodpanda.model.auth;

import com.example.foodpanda.model.Food;
import com.example.foodpanda.model.Order;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;

public class JwtRestaurantResponse {
    private String jwt;
    private Long id;
    public String name;
    public String location;
    public String availableZones;
    private List<Food> foods = new ArrayList<Food>();
    private List<Order> orders = new ArrayList<Order>();

    public JwtRestaurantResponse(String jwt, Long id, String name, String location, String availableZones, List<Food> foods, List<Order> orders) {
        this.jwt = jwt;
        this.id = id;
        this.name = name;
        this.location = location;
        this.availableZones = availableZones;
        this.foods = foods;
        this.orders = orders;
    }

    public String getJwt() {
        return jwt;
    }

    public void setJwt(String jwt) {
        this.jwt = jwt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getAvailableZones() {
        return availableZones;
    }

    public void setAvailableZones(String availableZones) {
        this.availableZones = availableZones;
    }

    public List<Food> getFoods() {
        return foods;
    }

    public void setFoods(List<Food> foods) {
        this.foods = foods;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}
