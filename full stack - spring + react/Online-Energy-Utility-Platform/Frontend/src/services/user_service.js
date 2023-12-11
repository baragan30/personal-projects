import ServerRequests from "./server_requests"

const PATH = "/user";
class UserService{
    
    async getAll(){
        const url = PATH + "/getall";
        return ServerRequests.sendSecureGetRequest(url);
    }
    async getAdmins(){
        const url = PATH + "/getAdmins";
        return await ServerRequests.sendSecureGetRequest(url);
    }
    async getClients(){
        const url = PATH + "/getClients";
        return await ServerRequests.sendSecureGetRequest(url);
    }
    async update(user){
        const url = PATH + "/update";
        return ServerRequests.sendSecurePostRequest(url,user);
    }
    async delete(id){
        const url = PATH + "/delete/" + id;
        return ServerRequests.sendSecureGetRequest(url)
        return ServerRequests.sendSecurePostRequest(url,id);
    }
}
export default new UserService();