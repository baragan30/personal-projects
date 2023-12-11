package com.example.foodpanda.model;

import javax.persistence.*;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Entity
@Table(name = "Orderrequest")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private OrderType orderType;

    @ManyToOne
    @JoinColumn(name = "RestaurantID" )
    private Restaurant restaurant;

    @ManyToOne
    @JoinColumn(name = "userID" )
    private User user;

    @ManyToMany
    private List<Food> foods;

    public Order(Long id, OrderType orderType, Restaurant restaurant, User user) {
        this.id = id;
        this.orderType = orderType;
        this.restaurant = restaurant;
        this.user = user;
        this.foods = foods;
    }

    public Order() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public OrderType getOrderType() {
        return orderType;
    }

    public void setOrderType(OrderType orderType) {
        this.orderType = orderType;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Food> getFoods() {
        return foods;
    }

    public void setFoods(List<Food> foods) {
        this.foods = foods;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", orderType=" + orderType +
                ", restaurant=" + restaurant +
                ", user=" + user +
                ", foods=" + foods.stream()
                .map(n -> String.valueOf(n))
                .collect(Collectors.joining("-", "{", "}"))+
                '}';
    }
}
