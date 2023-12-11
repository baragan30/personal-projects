import axios from "axios"
import React from "react";
import { useEffect, useState } from "react"
import Order from "../modules/Order";
import RestaurantService from "../../services/RestaurantService";

const orderTypes = ['NONE','PENDING','ACCEPTED','INDELIVERY','DELIVERED','DECLINED']

function OrderScreen({restaurant}){
    const [orders, setOrders] = useState([]);
    const [type, setType] = useState(orderTypes[0]); 
    useEffect( async ()=>{
        let neworders= await RestaurantService.loadRestaurantOrders(restaurant);
        if(type !== orderTypes[0]){
            neworders = neworders.filter((order)=> order.orderType === type)
        }
        setOrders(neworders);
    },[type]);
 
    const forceUpdate = (type) => {setType(type);}
    return(
        <div>
            <select onChange={(e)=>{forceUpdate(e.target.value);}} id="category" className="form-control">
                    {React.Children.toArray(orderTypes.map((type)=><option>{type}</option>))}
            </select>
            {React.Children.toArray(orders.map((order) =>  <Order order = {order}/>))}
        </div>
    )
}
export default OrderScreen;