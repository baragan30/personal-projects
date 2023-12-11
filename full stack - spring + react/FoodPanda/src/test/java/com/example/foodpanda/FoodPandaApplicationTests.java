package com.example.foodpanda;


import com.example.foodpanda.model.User;
import com.example.foodpanda.repository.UserRepository;
import com.example.foodpanda.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
class FoodPandaApplicationTests {

    UserService userService;
    @Mock
    UserRepository userRepository;

    @Before
    public void setup(){
        userService=new UserService(userRepository);
    }
    @Test
    public void checkFind(){
        System.out.println(userRepository);
        User sampleClient=new User("Andrei","12345");
        List<User> users = new ArrayList<User>();
        users.add(sampleClient);
        when(userRepository.findUserByUsername("Andrei")).thenReturn(users);
        User u =userService.getUserByUsername("Andrei");
        assertEquals("Andrei",u.getUsername());
    }

}
