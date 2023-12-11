import React, { useEffect, useState } from "react";
import {Routes,Route, useNavigate} from "react-router-dom"

import RestaurantNavBar from './RestaurantNavBar'
import RestaurantsScreen from './screens/RestaurantsScreen'
import FoodsScreen from './screens/FoodsScreen'
import OrdersScreen from './screens/OrdersScreen'
import AuthService from "../services/AuthService";

function RestaurantPage(){
    const [curentRestaurant,setCurentRestaurant] = useState(AuthService.getCurrentRestaurant());
    let navigate = useNavigate();
    useEffect( e =>{
      setCurentRestaurant(AuthService.getCurrentRestaurant());
      if(curentRestaurant === null)
        navigate('/');
    },[]);
    if(curentRestaurant == null)
      return <div/>;
    return(
      <div>
        <RestaurantNavBar curentRestaurant = {curentRestaurant}></RestaurantNavBar>
        <Routes>
          <Route path="/foods" element = {<FoodsScreen curentRestaurant = {curentRestaurant}/>}/>
          <Route path="/orders" element = {<OrdersScreen restaurant={curentRestaurant}/>}/>
          <Route path="/restaurants" element = {<div><RestaurantsScreen/></div>}/>
        </Routes>
      </div>
    );
}


export default RestaurantPage;