import axios from "axios";
const API_URL = "http://localhost:8080/authcontroller";
class AuthService {
  loginUser(username, password) {
    let loginRequest = {
        username : username,
        password : password,
    }
    return axios.post(`${API_URL}/signinUser`, loginRequest)
      .then(response => {
          localStorage.setItem("user", JSON.stringify(response.data));
      })
  }
  logoutUser() {
    localStorage.removeItem("user");
  }
  register(username, email, password) {
    return axios.post(API_URL + "signup", {
      username,
      email,
      password
    });
  }
  getCurrentUser() {
    return JSON.parse(localStorage.getItem('user'));;
  }

  loginRestaurant(username, password) {
    let loginRequest = {
        username : username,
        password : password,
    }
    console.log(loginRequest);
    return axios.post(`${API_URL}/signinRestaurant`, loginRequest)
      .then(response => {
          localStorage.setItem("restaurant", JSON.stringify(response.data));
      })
  }
  logoutRestaurant() {
    localStorage.removeItem("restaurant");
  }
  getCurrentRestaurant() {
    return JSON.parse(localStorage.getItem('restaurant'));;
  }

}
export default new AuthService()