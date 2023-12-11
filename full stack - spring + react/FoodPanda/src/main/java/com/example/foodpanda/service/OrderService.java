package com.example.foodpanda.service;

import com.example.foodpanda.model.Order;
import com.example.foodpanda.model.Restaurant;
import com.example.foodpanda.model.User;
import com.example.foodpanda.repository.OrderRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private static final Logger logger = LogManager.getLogger(OrderService.class);

    @Autowired
    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    /**
     *Get all user's orders
     * @param user
     * @return a list of orders
     */
    public  List<Order> getByUser(User user){
        logger.info(user.getUsername() + "'s orders have been taken");
        return orderRepository.findOrderByUser(user);
    }

    /**
     * Get all restaurant's orders
     * @param restaurant
     * @return a list of orders
     */
    public  List<Order> getByRestaurant(Restaurant restaurant){
        logger.info(restaurant.getName() + "'s orders have been taken");
        return orderRepository.findOrderByRestaurant(restaurant);
    }

    /**
     * Save an order to database
     * @param order
     */
    @Transactional
    public void saveOrder(Order order){
        logger.info(order.getId() + " was added to database");
        orderRepository.save(order);
    }

}
