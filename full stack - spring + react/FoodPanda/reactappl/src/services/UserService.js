import MailService from "./MailService";
import AuthService from "./AuthService";
import axios from "axios";
const serverRoot = 'http://localhost:8080'


class UserService{
    placeOrder(order){
        return this.sendPostRequest('/neworder',order)
        .then( res=> {
            MailService.sendEmail(order)
            return res;
        })
    }
    loadOrdersOfUser(user){
        return this.sendPostRequest('/getOrdersByUser',user);
    }
    loadFoods(restaurantName){
        return this.sendGetRequest(`/getFoodsByRestaurantName/${restaurantName}`);
    }
    async sendPostRequest(path,data){
        let user = AuthService.getCurrentUser();
        return await axios.post(`${serverRoot}${path}`,data,{
            headers :{ Authorization: "Bearer " + user.jwt}
        }).then(res=>{
            return res.data
        }).catch(error => {
            console.log(error);
            return error
        });
    }
    async sendGetRequest(path){
        let user = AuthService.getCurrentUser();
        return await axios.get(`${serverRoot}${path}`,{
            headers :{ Authorization: "Bearer " + user.jwt}
        }).then(res=>{
            return res.data
        }).catch(error => {
            console.log(error);
            return error
        });
    }
}
export default new UserService();