package com.example.foodpanda.security.services;

import com.example.foodpanda.model.Restaurant;
import com.example.foodpanda.model.User;
import com.example.foodpanda.repository.RestaurantRepository;
import com.example.foodpanda.repository.UserRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    private static final Logger logger = LogManager.getLogger(UserDetailsServiceImpl.class);
    @Autowired
    UserRepository userRepository;
    @Autowired
    RestaurantRepository restaurantRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = null;
        Restaurant restaurant = null;
        try{
            user = userRepository.findUserByUsername(username).get(0);
            logger.info("User " + username + " has been found");
            return new UserDetailsImpl(user);
        }catch (Exception e){
            try{
                restaurant = restaurantRepository.findRestaurantByName(username).get(0);
                logger.info("User " + username + " has been found");
                return new RestaurantDetailsImpl(restaurant);
            }catch (Exception ex){
                String error = "User Not Found with username: " + username;
                ex.printStackTrace();
                logger.error(error);
                throw new UsernameNotFoundException(error);
            }
        }

    }
}
