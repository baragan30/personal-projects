package com.example.foodpanda.service;

import com.example.foodpanda.model.FoodCategory;
import com.example.foodpanda.model.Restaurant;
import com.example.foodpanda.repository.RestaurantRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class RestaurantService {
    private final RestaurantRepository restaurantRepository;
    private static final Logger logger = LogManager.getLogger(RestaurantService.class);

    @Autowired
    private PasswordEncoder encoder;

    @Autowired
    public RestaurantService(RestaurantRepository restaurantRepository) {
        this.restaurantRepository = restaurantRepository;
    }

    public Restaurant getRestaurantByName(String name) throws Exception{
        return restaurantRepository.findRestaurantByName(name).get(0);
    }

    public List<Restaurant> getALL(){
        return restaurantRepository.findAll();
    }
    @Transactional
    public void saveRestaurant(Restaurant restaurant)throws Exception{
        try{
            restaurant.setPassword(encoder.encode(restaurant.getPassword()));
            restaurantRepository.save(restaurant);
        } catch (Exception e){
            logger.error(e.toString()) ;
            throw e;
        }

    }



    @Transactional
    public void deleteRestaurant(Restaurant restaurant){
        restaurantRepository.delete(restaurant);
    }

    @Transactional
    public void deleteAll(){
        restaurantRepository.deleteAll();
    }


}
