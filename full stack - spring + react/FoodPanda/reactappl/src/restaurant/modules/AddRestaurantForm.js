import React from "react";
import RestaurantService from "../../services/RestaurantService";
const serverRoot = 'http://localhost:8080'

function AddRestaurantForm({mainComponent}){
    return(
        <form onSubmit= {(event)=>{addNewRestaurant(event,mainComponent)}}>
        <div className="form-row">
          <div className="form-group col-md-6">
            <label htmlFor="name">Name</label>
            <input type="name" className="form-control"  id="name" placeholder="name"/>
          </div>
          <div className="form-group col-md-6">
          <label htmlFor="location">Location</label>
            <input type="location" className="form-control" id="location" placeholder="location"/>
          </div>
        </div>
        <div className="form-group">
          <label htmlFor="availableZones">AvailableZones</label>
          <input type="text" className="form-control" id="availableZones" placeholder="available zones"/>
        </div>

        <div className="form-group">
          <div className="form-check">
            <input className="form-check-input" type="checkbox" id="gridCheck"/>
            <label className="form-check-label" htmlFor="gridCheck">
              Check me out
            </label>
          </div>
            <button type="submit" className="btn btn-primary">Add Restaurant</button>
        </div>
      </form>
    );
}

function addNewRestaurant(event,mainComponent){
    event.preventDefault();
    let restaurant = {
        name:event.target.elements.name.value,
        location:event.target.elements.location.value,
        availableZones:event.target.elements.availableZones.value,
    }
    if(restaurant.name !== "" && restaurant.location !== "" && restaurant.availableZones !== ""){
        RestaurantService.addNewRestaurant(restaurant)
          .then( async _ =>{

             mainComponent.setState({restaurants: await RestaurantService.loadAllRestaurants()});
          })
          .catch( _ => {
            // Exception is displayed in Restaurant service
          });
         
    }
}


export default AddRestaurantForm