import React from "react";

function RestaurantBar({restaurant}){
    return(
        <li className="list-group-item">{restaurantToString(restaurant) }</li>
    )
}

function restaurantToString(restaurant){
    return `Name = ${restaurant.name},  Location = ${restaurant.location},  Available Zones = ${restaurant.availableZones}`
}
export default RestaurantBar;