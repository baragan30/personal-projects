import React from "react"
import PlaceOrder from "../modules/PlaceOrder"

export default function CartScreen({cart,placeOrder}){
    return(
        <div>
            {React.Children.toArray(cart.map((order) =>  <PlaceOrder order = {order} placeOrder ={placeOrder} />))}
        </div>
    )
}