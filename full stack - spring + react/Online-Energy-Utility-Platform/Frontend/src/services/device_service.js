import ServerRequests from "./server_requests"

const PATH = "/device";
class DeviceService{
    
    getCurentUserDevices(){
        const url = PATH + "/getCurentUserDevices";
        return ServerRequests.sendSecureGetRequest(url);
    }
    getUserDevices(userId){
        const url = PATH + "/get";
        return ServerRequests.sendSecurePostRequest(url,{string : userId})
        .then(res=>{
            return res
        }).catch(error => {
            return [];
        });
    }
    deleteDevice(id){
        const url = PATH + "/delete";
        return ServerRequests.sendSecurePostRequest(url,{string : id});
    }
    updateDevice(device){
        const url = PATH + "/update";
        return ServerRequests.sendSecurePostRequest(url,device);
    }
    getMeasurements(deviceId,date){
        const url = PATH + "/measurements";
        return ServerRequests.sendSecurePostRequest(url,{deviceId,date});
    }
}
export default new DeviceService();