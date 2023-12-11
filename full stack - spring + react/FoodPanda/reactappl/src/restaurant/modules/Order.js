import React from "react";
import axios from "axios";
import { useEffect, useState } from "react";
import Food from "./Food";
import RestaurantService from "../../services/RestaurantService";

const serverRoot = 'http://localhost:8080'

export default function Order({order}){
    const [value, setValue] = useState(0); // integ
    const forceUpdate = () => setValue(value+1);

    useEffect( async ()=>{
    },[])
    const setOrderType= async (type) =>{
        order.orderType = type;
        await RestaurantService.updateOrder(order);
        forceUpdate();
    }
    return (
        <div>
            <div>
            <p>
                <a className="btn btn-primary" data-toggle="collapse" href={`#order${order.id}`} role="button" aria-expanded="false" aria-controls="collapseExample">
                    {orderToString(order)}
                </a>
            </p>
            <div className="collapse" id={`order${order.id}`}>
                <div className="card card-body">
                    {(new OrderStateMachine(order,setOrderType)).getWidget()}
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
                                React.Children.toArray(order.foods.map((food)=><Food food = {food}/>))
                             }
                        </tbody>
                        
                    </table>

                </div>
            </div>
        </div>
        </div>
    )
}


class OrderStateMachine{
    constructor(order,setOrder){
        this.states = [
            new PendingOrder(()=>this.next(),()=>this.decline()),
            new BasicOrder(()=>this.next(),'ACCEPTED','Start Deliver'),
            new BasicOrder(()=>this.next(),'INDELIVERY','Delivered Order'),
            new EmptyOrder('DELIVERED'),
            new EmptyOrder('DECLINED')
        ];
        this.setOrder = setOrder;
        this.curent = this.states.findIndex(state=>{
            return state.name === order.orderType;
        });
    }
    next(){
        this.curent++;
        this.setOrder(this.states[this.curent].name);
    }
    decline(){
        this.curent = 4;
        this.setOrder(this.states[this.curent].name);
    }
    getWidget(){
        return this.states[this.curent].getWidget();
    }
}


class OrderType{
    constructor(next){
        this.next = next;
    }
    static getWidget(buttonText,buttonFunction){
        return(
            <div><button onClick={buttonFunction}>{buttonText}</button></div>
        )
    }
    getWidget(buttonText){
        return OrderType.getWidget(buttonText,this.next);
    }
}

class PendingOrder extends OrderType{
    constructor(next,decline){
        super(next);
        this.name = "PENDING";
        this.decline = decline;
    }
    getWidget(){
        return(
            <div>
                {super.getWidget("Accept Order")}
                {OrderType.getWidget("Decline Order",this.decline)}
            </div>
        );
    }
}
class BasicOrder extends OrderType{
    constructor(next,name,buttonDescription){
        super(next);
        this.name = name;
        this.buttonDescription = buttonDescription;
    }
    getWidget() {return super.getWidget(this.buttonDescription);}
}
class EmptyOrder{
    constructor(name){
        this.name = name;
    }
    getWidget() {
        return <div/>;
    }
}
function orderToString(order){
    let totalPrice = 0;
    for(const food of order.foods){
         totalPrice+=food.price;
    }
    return `${order.restaurant.name}             ${totalPrice}$              ${order.orderType}`;
}