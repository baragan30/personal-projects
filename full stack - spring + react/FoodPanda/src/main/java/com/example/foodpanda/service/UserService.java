package com.example.foodpanda.service;

import com.example.foodpanda.model.User;
import com.example.foodpanda.repository.UserRepository;
import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@Service
public class UserService {
    private static final Logger logger = LogManager.getLogger(UserService.class);
    private final UserRepository userRepository;

    @Autowired
    private PasswordEncoder encoder;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Transactional
    public void saveuser(User user) throws Exception {
        try {
            user.setPassword(encoder.encode(user.getPassword()));
            userRepository.save(user);
            logger.info("An user " +user.getUsername() + " was created" );
        } catch (Exception e){
            logger.error(e.toString()) ;
            throw e;
        }

    }

    public User getUserByUsername(String username){
        return userRepository.findUserByUsername(username).get(0);
    }

    @Transactional
    public void deleteuser(User user){
        userRepository.delete(user);
    }

    @Transactional
    public void deleteAll(){
        userRepository.deleteAll();
    }


}
