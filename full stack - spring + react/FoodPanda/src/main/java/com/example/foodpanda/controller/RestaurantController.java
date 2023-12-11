package com.example.foodpanda.controller;


import com.example.foodpanda.model.FoodCategory;
import com.example.foodpanda.model.Restaurant;
import com.example.foodpanda.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/")
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    private Restaurant restaurant = null;

    @GetMapping("/getRestaurants")
    public ResponseEntity getAllRestaurants(){
        return ResponseEntity.ok().body(restaurantService.getALL());
    }

    @PostMapping("/newrestaurant")
    public ResponseEntity addNewRestaurant(@RequestBody Restaurant restaurant){

        try {
            System.out.println(restaurant.getName());
            restaurantService.saveRestaurant(restaurant);

        } catch (Exception e) {
            return ResponseEntity.ok().body(e.toString());
        }
        return ResponseEntity.ok().body("Done");
    }
    @GetMapping("/getCategories")
    public ResponseEntity getCategories(){
        List<FoodCategory> enumValues = Arrays.asList(FoodCategory.values());
        return ResponseEntity.ok().body(enumValues);
    }
    @GetMapping("/restaurantLogin/{name}/{password}")
    public ResponseEntity logIn(@PathVariable String name, @PathVariable String password){
        try{
            restaurant = restaurantService.getRestaurantByName(name);
            if(Restaurant.passwordD.equals(password))
                return ResponseEntity.ok().body(restaurant);
        }catch (Exception e){
            e.printStackTrace();

        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Username or password are incorrect");
    }
    @GetMapping("/curentRestaurant")
    public ResponseEntity logIn(){
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(restaurant);
    }
}
