import axios from "axios";
import AuthentificationService from "./authentification_service"

const SERVERROOT = 'https://localhost:8080';

class ServerRequests{
    async sendGetRequest(path){
        return await axios.get(`${SERVERROOT}${path}`,{}
        ).then(res=>{
            return res.data
        }).catch(error => {
            console.log(error);
            return error
        });
    }
    async sendPostRequest(path,data){
        return await axios.post(`${SERVERROOT}${path}`,data,{}
        ).then(res=>{
            return res.data
        }).catch(error => {
            console.log(error);
            throw error
        });
    }
    async sendSecurePostRequest(path,data){
        const jwt = AuthentificationService.getCurrentJwt();
        return await axios.post(`${SERVERROOT}${path}`,data,{
            headers :{ Authorization: "Bearer " + jwt}
        }).then(res=>{
            return res.data
        }).catch(error => {
            console.log(error);
            throw error
        });
    }
    async sendSecureGetRequest(path){
        const jwt = AuthentificationService.getCurrentJwt();
        return await axios.get(`${SERVERROOT}${path}`,{
            headers :{ Authorization: "Bearer " + jwt}
        }).then(res=>{
            return res.data
        }).catch(error => {
            console.log(error);
            return error
        });
    }

}

export default new ServerRequests();