package com.example.foodpanda.controller;


import com.example.foodpanda.model.Restaurant;
import com.example.foodpanda.model.auth.JwtClientResponse;
import com.example.foodpanda.model.auth.JwtRestaurantResponse;
import com.example.foodpanda.model.auth.LoginRequest;
import com.example.foodpanda.model.User;
import com.example.foodpanda.repository.UserRepository;
import com.example.foodpanda.security.pwt.JwtUtils;
import com.example.foodpanda.security.services.RestaurantDetailsImpl;
import com.example.foodpanda.security.services.UserDetailsImpl;
import com.example.foodpanda.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/authcontroller")
public class AuthController {
    @Autowired
    AuthenticationManager authenticationManager;
    @Autowired
    UserService userService ;
    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder encoder;
    @Autowired
    JwtUtils jwtUtils;

    @PostMapping("/signinUser")
    @ResponseBody
    public ResponseEntity<?>  authenticateUser(@RequestBody LoginRequest loginRequest) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));


        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);

        try{
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            JwtClientResponse jwtClientResponse = new JwtClientResponse(jwt,
                    userDetails.getId(),
                    userDetails.getUsername()
            );
            return ResponseEntity.ok().body(jwtClientResponse);

        }catch (Exception e){
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body("Wrong username or password");
        }
    }
    @PostMapping("/signinRestaurant")
    @ResponseBody
    public ResponseEntity<?>  authenticateRestaurant(@RequestBody LoginRequest loginRequest) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);

        try{
            RestaurantDetailsImpl restaurantDetails = (RestaurantDetailsImpl) authentication.getPrincipal();
            Restaurant restaurant = restaurantDetails.getRestaurant();
            JwtRestaurantResponse jwtRestaurantResponse = new JwtRestaurantResponse(jwt,
                    restaurant.getId(),
                    restaurant.getName(),
                    restaurant.getLocation(),
                    restaurant.getAvailableZones(),
                    restaurant.getFoods(),
                    restaurant.getOrders()
            );
            return ResponseEntity.ok().body(jwtRestaurantResponse);

        }catch (Exception e){
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body("Wrong username or password");
        }
    }


    @PostMapping("/signupclient")
    public ResponseEntity<?> registerUser(@RequestBody User user) {
        try {
            userService.saveuser(user);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok().body("Internal Faillure");
        }
        return ResponseEntity.ok().body("Done");
    }
}
