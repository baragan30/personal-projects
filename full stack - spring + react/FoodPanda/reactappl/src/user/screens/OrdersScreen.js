import axios from "axios"
import React from "react";
import { useEffect, useState } from "react"
import UserService from "../../services/UserService";

import Order from "../modules/Order";
const serverRoot = 'http://localhost:8080'

export default function OrdersScreen({user}){
    const [orders, setOrders] = useState([]);
    useEffect( async ()=>{
        setOrders(await UserService.loadOrdersOfUser(user))
    },[user])
    return(
        <div>
            {React.Children.toArray(orders.map((order) =>  <Order order = {order}/>))}
        </div>
    )
}