package com.example.foodpanda.controller;

import com.example.foodpanda.model.User;
import com.example.foodpanda.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.security.NoSuchAlgorithmException;

@RestController
@RequestMapping("/")
public class UserController {
    @Autowired
    UserService userService ;

    private User user = null;

    @PostMapping("/newUser")
    public ResponseEntity addNewUser(@RequestBody User user){
        try {
            userService.saveuser(user);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok().body("Internal Faillure");
        }
        return ResponseEntity.ok().body("Done");
    }
    @GetMapping("curentUser")
    public ResponseEntity getCurentUser(){
        return ResponseEntity.ok().body(user);
    }
}
