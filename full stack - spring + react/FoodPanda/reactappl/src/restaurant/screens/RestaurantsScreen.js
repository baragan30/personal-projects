import RestaurantBar from "../modules/RestaurantBar";
import React from "react";
import AddRestaurantForm from "../modules/AddRestaurantForm";
import RestaurantService from "../../services/RestaurantService";

class RestaurantsScreen extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            restaurants:[]
        }
    }
    async componentDidMount(){
        this.setState({restaurants: await RestaurantService.loadAllRestaurants()});
    }
    render(){
          return (
            <div>
                <AddRestaurantForm mainComponent = {this}/>
                
                <ul className="list-group">
                    <li className="list-group-item active">Restaurant List</li>
                </ul>
                {
                    React.Children.toArray(this.state.restaurants.map((restaurant) => <RestaurantBar restaurant={restaurant}></RestaurantBar>))
                }
            </div>
        )
    }
}




export default RestaurantsScreen;