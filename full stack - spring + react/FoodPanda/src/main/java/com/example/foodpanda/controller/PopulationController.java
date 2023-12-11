package com.example.foodpanda.controller;

import com.example.foodpanda.model.Food;
import com.example.foodpanda.model.FoodCategory;
import com.example.foodpanda.model.Restaurant;
import com.example.foodpanda.model.User;
import com.example.foodpanda.service.FoodService;
import com.example.foodpanda.service.RestaurantService;
import com.example.foodpanda.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.NoSuchAlgorithmException;

@RestController
@RequestMapping("/populationcontroller")
public class PopulationController {
    @Autowired
    RestaurantService restaurantService;
    @Autowired
    FoodService foodService;
    @Autowired
    UserService userService;


    private  Restaurant r1 = new Restaurant("admin","everywhere","anywhereElse");
    private  Restaurant r2 = new Restaurant("La Fereastra Lunii","in fantana plina cu piscina","anywhereElse");
    @PostMapping("/populate")
    private void populate(){

        populateRestaurant();
        populateUsers();
        populateFood();
    }

    private void populateRestaurant(){
        restaurantService.deleteAll();
        try {
            restaurantService.saveRestaurant(r1);
            restaurantService.saveRestaurant(r2);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    private void populateUsers(){
        try {
            userService.deleteAll();
            userService.saveuser(new User("user","user"));
            userService.saveuser(new User("creatura","cratura"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void populateFood(){
        foodService.deleteAll();
        Food f1 = new Food("mere cu smantana",3, FoodCategory.Exotic,r1);
        Food f2 = new Food("apa de la chiuveta",1,FoodCategory.Light,r1);
        foodService.saveFood(f1);
        foodService.saveFood(f2);
        foodService.saveFood(new Food("apa de la chiuveta",1,FoodCategory.Light,r2));
        foodService.saveFood(new Food("lacrimi de la robinet",0.5f,FoodCategory.Light,r2));
        foodService.saveFood(new Food("friptura de caine",1,FoodCategory.Asian,r2));
    }
}
