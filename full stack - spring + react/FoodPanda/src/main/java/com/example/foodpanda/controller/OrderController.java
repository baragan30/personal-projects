package com.example.foodpanda.controller;

import com.example.foodpanda.model.Food;
import com.example.foodpanda.model.Order;
import com.example.foodpanda.model.Restaurant;
import com.example.foodpanda.model.User;
import com.example.foodpanda.service.FoodService;
import com.example.foodpanda.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @PostMapping("/neworder")
    public ResponseEntity addNewOrder(@RequestBody Order order){
        System.out.println(order);
        orderService.saveOrder(order);
        return ResponseEntity.ok().body("Done");
    }
    @PostMapping("/getOrdersByUser")
    public ResponseEntity getOrdersByUser(@RequestBody User user){
        System.out.println(user);
        return ResponseEntity.ok().body(orderService.getByUser(user));
    }
    @PostMapping("/getOrdersByRestaurant")
    public ResponseEntity getOrdersByRestaurant(@RequestBody Restaurant restaurant){
        System.out.println(restaurant);
        return ResponseEntity.ok().body(orderService.getByRestaurant(restaurant));
    }
}
