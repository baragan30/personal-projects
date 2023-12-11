import axios from "axios"
import React from "react";
import { useEffect, useState } from "react"
import Food from "../modules/AddFoodBar";
import UserService from "../../services/UserService";

export default function FoodsScreen({addToCart}){
    const [searchName,setSearchName] = useState("");
    const [foods,setFoods] = useState([]);
    // const res
    useEffect(async()=>{
        setFoods(await UserService.loadFoods(searchName));
        // console.log(await UserService.loadFoods(searchName))
    },[searchName])
    const search = (e) =>{
      e.preventDefault();
      setSearchName(e.target.restaurantName.value);
    }
    const f = ()=>{};
    return(
        <div>
          <form onSubmit={search} className="form-inline my-2 my-lg-0">
            <input name="restaurantName" className="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"/>
            <button type="sumit" className="btn btn-dark">Filter</button>
          </form>
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
                React.Children.toArray(foods.map((food)=>{return <Food addToCart={addToCart} food= {food}/>}))
              }
              </tbody>
              
          </table>

        </div>
    );
}