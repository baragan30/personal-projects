import ServerRequests from "./server_requests"

const PATH = "/user";
class AuthentificationService{

     async register(name,password,userType){
        let newUser = {name,password,userType}
        const url = PATH + "/insert"
        return ServerRequests.sendPostRequest(url,newUser);
    }
    async login(username, password) {
        let loginRequest = {
            username : username,
            password : password,
        }
        const url = PATH + "/login";
        return ServerRequests.sendPostRequest(url,loginRequest)
          .then(response => {
              localStorage.setItem("user", JSON.stringify(response));
              return response;
          })
      }
    async logOut(){
        localStorage.removeItem("user");
    }
    getCurrentUser() {
        return JSON.parse(localStorage.getItem("user"));
    }
    getCurrentJwt() {
        return JSON.parse(localStorage.getItem("user")).jwt;
    }
    isAdministratorLogged(){
        let administrator = this.getCurrentUser();
        if(administrator === null)
            return false;
        if(administrator.userType !== 'ADMINISTRATOR')
            return false;
        return true;
    }
    populate(){
        const url = "/populate"
        return ServerRequests.sendGetRequest(url);
    }
}

export default new AuthentificationService();