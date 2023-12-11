package com.example.foodpanda.service;

import com.example.foodpanda.model.Food;
import com.example.foodpanda.model.FoodCategory;
import com.example.foodpanda.model.Restaurant;
import com.example.foodpanda.repository.FoodRepository;
import com.example.foodpanda.repository.RestaurantRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import javax.transaction.Transactional;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class FoodService {
    private final FoodRepository foodRepository;
    private static final Logger logger = LogManager.getLogger(FoodService.class);

    @Autowired
    public FoodService(FoodRepository foodRepository) {
        this.foodRepository = foodRepository;
    }

    /**
     * Get all foods from a specific restaurant and a specific category
     * @param foodCategory is the specific category required
     * @param restaurantId is the id of the specific restaurant
     * @return a list of food
     */
    public List<Food> findFoodByCategoryAndByRestaurantID(FoodCategory foodCategory,Long restaurantId){
        List<Food> foods = null;
        try{
            foods = foodRepository.findFoodByCategoryAndByRestaurantID(foodCategory,restaurantId);
            logger.info("all foods from " + foodCategory + "category and with " + restaurantId + "restaurant id was getted from database" );
        }catch (Exception e){
            logger.error(e.toString());
            throw e;
        }
        return foods;
    }
    /**
     * Get all foods that contain in restaurant's name restaurantName
     * @param restaurantName is the name of menu's restaurant
     * @return a list of foods sorted by restaurant's name
     */
    public List<Food> getFoodsByRestaurantName(String restaurantName) {
        try{

            List<Food> foods =  foodRepository.getFoodsByRestaurantName(restaurantName)
                    .stream().sorted(new FoodCompareUsingRestaurantName())
                    .collect(Collectors.toList());
            logger.info("all " + restaurantName + "'s foods was get from database");
            return foods;
        }catch (Exception e){
            logger.error(e.toString());
            throw e;
        }
    }

    /**
     * Save a food object in database
     */
    @Transactional
    public void saveFood(Food food){
        logger.info(food.getName() + " was added to database");
        foodRepository.save(food);
    }

    /**
     * delete all foods from food table in database
     */
    @Transactional
    public void deleteAll(){
        logger.info("Food table from database was emptied");
        foodRepository.deleteAll();
    }
}

class FoodCompareUsingRestaurantName implements Comparator<Food>{
    /**
     * compare 2 food object by restaurant name
     * @param o1 the first object to be compared.
     * @param o2 the second object to be compared.
     * @return -1 0 or 1. The value 0 if the argument string is equal to this string; a value less than 0 if this string
     * is lexicographically less than the string argument; and a value greater than 0 if this string is lexicographically
     * greater than the string argument.
     */
    @Override
    public int compare(Food o1, Food o2) {
        String restaurant1Name =  o1.getRestaurant().getName();
        String restaurant2Name =  o2.getRestaurant().getName();
        return restaurant1Name.compareTo(restaurant2Name);
    }
}
