import { Button } from "bootstrap";
import Food from "./Food";
import React from "react";

export default function PlaceOrder({order,placeOrder}){
    return (
        <div>
            <div>
            <p>
                <a className="btn btn-primary" data-toggle="collapse" href={`#toplaceorder${order.restaurant.name}`} role="button" aria-expanded="false" aria-controls="collapseExample">
                    {orderToString(order)}
                    <button onClick={() => {placeOrder(order)}} >Place Order</button>
                </a>
            </p>
            <div className="collapse" id={`toplaceorder${order.restaurant.name}`}>
                <div className="card card-body">
                    <table className="table table-striped table-dark">
                        <thead>
                            <tr>
                            <th scope="col">Food</th>
                            <th scope="col">Category</th>
                            <th scope="col">Restaurant</th>
                            <th scope="col">Price</th>
                            <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            {
                                React.Children.toArray(
                                    order.foods.map((food)=><Food food = {food}/>)
                                )
                             }
                        </tbody>
                        
                    </table>

                </div>
            </div>
        </div>
        </div>
    )
}

function orderToString(order){
    let totalPrice = 0;
    for(const food of order.foods){
         totalPrice+=food.price;
    }
    return `${order.restaurant.name}             ${totalPrice}$`;
}