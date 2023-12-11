import React, { useState, useEffect } from 'react';
import axios from 'axios';
import FoodBar from "./FoodBar";
import RestaurantService from '../../services/RestaurantService';
const serverRoot = 'http://localhost:8080';


export default function FoodsCategoryBar({signal,category,restaurant}){
    const [foods, setfoods] = useState([]);
    useEffect( async ()=>{
        setfoods(await RestaurantService.loadFoodByRestaurantAndCategory(restaurant,category))
    },[signal])
    return(
        <div>
            <p>
                <a className="btn btn-primary" data-toggle="collapse" href={`#collapseExample${category}`} role="button" aria-expanded="false" aria-controls="collapseExample">
                    {category}
                </a>
            </p>
            <div className="collapse" id={`collapseExample${category}`}>
                <div className="card card-body">
                   {
                       React.Children.toArray(foods.map((food)=> FoodBar({food})))
                   }
                </div>
            </div>
        </div>
    )
}