import SockJS from 'sockjs-client';
import {over} from 'stompjs';
import ServerRequests from "./server_requests"

class ChatService{
    stompClient =null;

    connect(onConnected,onError,onMessage,username){
        let Sock = new SockJS('https://localhost:8080/ws-message');
        this.stompClient = over(Sock);
        this.stompClient.connect({},() =>{this.conectionHandler(onConnected,username,onMessage)}, onError);
    }
    
    conectionHandler(onConnected,username,onPrivateMessage){
        this.stompClient.subscribe('/user/'+username+'/private', onPrivateMessage);
        onConnected();
    }
    sendPrivateMessage(message){
        if (this.stompClient) {
          this.stompClient.send("/app/private-message", {}, JSON.stringify(message));
        }
    }

    getChatMessages(username1,username2){
      const url = "/getMessages/" + username1 + "/" + username2;
      return ServerRequests.sendGetRequest(url);
  }


    

}
  export default new ChatService();