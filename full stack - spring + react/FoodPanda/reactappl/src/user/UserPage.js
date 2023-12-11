import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import UserNavBar from './UserNavBar';
import {Routes,Route} from "react-router-dom"
import OrdersScreen from './screens/OrdersScreen';
import FoodsScreen from './screens/FoodsScreen';
import CartScreen from './screens/CartScreen';
import AuthService from '../services/AuthService';
import UserService from '../services/UserService';

const serverRoot = 'http://localhost:8080'
function UserPage(){
    let navigate = useNavigate();
    
    const [user ,setUser]= useState(AuthService.getCurrentUser());
    const [cart, setCurentCart] = useState([]) 
    useEffect( e =>{
        setUser(AuthService.getCurrentUser())
        if(user === null)
            navigate('/')
    },[])
    if(user === null)
        return <div/>;
        

    const addToCart = (food) =>{
        let order = cart.find(order => order.restaurant.id == food.restaurant.id);
        if(order === undefined){
            order = {restaurant : food.restaurant,
            foods : [food],
            user : user,
            orderType : 'PENDING'
        };
            cart.push(order);
        }else{
            order.foods.push(food);
        }
        setCurentCart(cart);
    }
    const placeOrder = (order)=>{
        UserService.placeOrder(order)
        .then( _ => {
            //remove the cart from state
            setCurentCart(arrayRemove(cart,order));
        }).catch( _ =>{
            // error is displayed in UserService
        })
    }
    
    return (
        <div>
            <UserNavBar curentUser = {user}></UserNavBar>
            <Routes>
                <Route path="/foods/*" element = {<FoodsScreen addToCart= {addToCart}/>}/>
                <Route path="/orders/*" element = {<OrdersScreen user = {user} />}/>
                <Route path="/cart/*" element = {<CartScreen cart = {cart} placeOrder = {placeOrder}/>}/>
            </Routes>
        </div>
    )
}

function arrayRemove(arr, value) { 
    
    return arr.filter(function(ele){ 
        return ele != value; 
    });
}

export default UserPage;