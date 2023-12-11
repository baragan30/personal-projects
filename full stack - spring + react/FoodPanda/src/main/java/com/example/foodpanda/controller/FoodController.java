package com.example.foodpanda.controller;

import com.example.foodpanda.model.Food;
import com.example.foodpanda.model.FoodCategory;
import com.example.foodpanda.service.FoodService;
import io.jsonwebtoken.Jwt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/")
public class FoodController {
    @Autowired
    private FoodService foodService;

    @PostMapping("/newfood")
    public ResponseEntity addNewRestaurant(@RequestBody Food food){
        System.out.println(food);
        try {
            foodService.saveFood(food);
        }catch (Exception e){
            e.printStackTrace();
        }

        return ResponseEntity.ok().body("Done");
    }
    @GetMapping("/getFoodsByCategoryAndRestaurant/{category}/{restaurantId}")
    public ResponseEntity getFoodsByCategoryAndByRestaurant(@PathVariable FoodCategory category,@PathVariable Long restaurantId) {
        try {
            return ResponseEntity.ok().body(foodService.findFoodByCategoryAndByRestaurantID(category,restaurantId));
        }catch (Exception e){
            e.printStackTrace();
        }
        return ResponseEntity.ok().body("error");
    }
    @GetMapping("/getFoodsByRestaurantName/{restaurantName}")
//    @PreAuthorize("hasRole('USER')")
    public ResponseEntity getFoodsByRestaurantName(@PathVariable String restaurantName) {
        List<Food> foods = null;
        try {
            foods = foodService.getFoodsByRestaurantName(restaurantName);
        }catch (Exception e){
            e.printStackTrace();
        }

        return ResponseEntity.ok().body(foods);
    }
    @GetMapping("/getFoodsByRestaurantName")
    public ResponseEntity getFoodsByRestaurantName() {
        List<Food> foods = null;
        try{
            foods = foodService.getFoodsByRestaurantName("");
        }catch (Exception e){
            e.printStackTrace();
        }

        return ResponseEntity.ok().body(foods);
    }
}
