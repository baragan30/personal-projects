import axios from "axios";
import React from "react";
import {useNavigate} from 'react-router-dom';
import RestaurantService from "../../services/RestaurantService";
const serverRoot = 'http://localhost:8080';


function AddFoodForm({forceUpdate,categoriesList,curentRestaurant}){
    return(
      
        <form onSubmit={(event)=>{addNewFood({event:event,forceUpdate:forceUpdate,curentRestaurant:curentRestaurant})}}>
        <div className="form-row">

          <div className="form-group col-md-6">
            <label htmlFor="name">Product Name</label>
            <input type="name" className="form-control"  id="name" placeholder="name"/>
          </div>

          <div className="form-group col-md-6">
          <label htmlFor="category">Category</label>
          <select id="category" className="form-control">
            {React.Children.toArray(categoriesList.map((category)=><option>{category}</option>))}
          </select>
          </div>

          <div className="form-group col-md-6">
          <label htmlFor="price">Price</label>
          <input type="number" step="0.01" className="form-control"  id="price" placeholder="price"/>

          </div>
        </div>
        

        <div className="form-group">
            <button type="submit" className="btn btn-primary">Add Food</button>
        </div>
      </form>
    );
}

async function addNewFood({event,forceUpdate,curentRestaurant}){
    event.preventDefault();
    let food = {
        name:event.target.elements.name.value,
        category:event.target.elements.category.value,
        restaurant:curentRestaurant,
        price:event.target.elements.price.value
    }
    if(food.name !== "" && food.category !== ""){
          RestaurantService.addNewFood(food)
          .then( _ => {
            forceUpdate();
          })
          .catch( _ => {
            // The exception is displayed in Restaurant Service
          });
    }
}
export default AddFoodForm;