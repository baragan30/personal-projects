import MailService from "./MailService";
import AuthService from "./AuthService";
import axios, { Axios } from "axios";
const serverRoot = 'http://localhost:8080'


class RestaurantService{
    loadAllRestaurants(){
        return this.sendGetRequest(`/getRestaurants`)
            .catch( _ =>{
                return [];
            });
    }
    loadAllFoodCategories(){
        return this.sendGetRequest(`/getCategories`)
            .catch( _ => []);
    }
    loadRestaurantFood(restaurant){
        return this.sendGetRequest(`/getFoodsByRestaurantName/${restaurant.name}`)
            .catch( _ => []);
    }
    loadFoodByRestaurantAndCategory(restaurant,category){
        return this.sendGetRequest(`/getFoodsByCategoryAndRestaurant/${category}/${restaurant.id}`)
            .catch( _ => []);
    }
    loadRestaurantOrders(restaurant){
        return this.sendPostRequest(`/getOrdersByRestaurant/`,restaurant)
            .catch( _ => [])
    }
    addNewFood(food){
        return this.sendPostRequest(`/newfood`, food);
    }
    addNewRestaurant(restaurant){
        return this.sendPostRequest(`/newrestaurant`, restaurant);
    }
    updateOrder(order){
        return this.sendPostRequest(`/neworder`, order);
    }

    async sendPostRequest(path,data){
        let restaurant = AuthService.getCurrentRestaurant();
        return await axios.post(`${serverRoot}${path}`,data,{
            headers :{ Authorization: "Bearer " + restaurant.jwt}
        }).then(res=>{
            return res.data
        }).catch(error => {
            console.log(error);
            return error
        });
    }
    async sendGetRequest(path){
        let restaurant = AuthService.getCurrentRestaurant();
        return await axios.get(`${serverRoot}${path}`,{
            headers :{ Authorization: "Bearer " + restaurant.jwt}
        }).then(res=>{
            return res.data
        }).catch(error => {
            console.log(error);
            return error
        });
    }
}
export default new RestaurantService();