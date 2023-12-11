import React, { useEffect } from 'react';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Image from 'react-bootstrap/Image'
import { useState } from 'react';
import { Button, Card } from 'react-bootstrap';
import FriendComponent from './FriendComponnet';
import ChatComponent from './ChatComponent';
import UserService from '../services/user_service';
import AuthentificationService from '../services/authentification_service';
import ChatService from '../services/ChatService';

export default function ChatPage(){
    const [chatData, setChatData] = useState({
        curentName:AuthentificationService.getCurrentUser().username,
        contactName:"",
        contactList:[],
        messages:[],
        istyping:false,
        update:update
    })
    const [index, setIndex] = useState(0);

    const update = () => {
        setIndex(index + 1);
    }

    useEffect(()=>{
         ChatService.connect(onConnect,onError,onMessage,chatData.curentName);
         async function fetchChatData(){
            let contactList
            if(AuthentificationService.isAdministratorLogged()){
                contactList = await UserService.getClients()
            }else {
                contactList = await UserService.getAdmins()
            }
            chatData.contactList = contactList;
            update();
         }
         fetchChatData()
         console.log("---------------------------------------/n S-a facut fetch")
    },[])

    useEffect(() => {
        chatData.update = update;
    },[index])

    function onConnect(){}

    function onError(){}


    const sleep = ms => new Promise(
        resolve => setTimeout(resolve, ms)
      );

    async function onMessage(payload){
        var message = JSON.parse(payload.body);
        
        if(message.senderName === chatData.contactName){
            const messages =  chatData.messages;
           
            switch(message.messageType) {
                case "MESSAGE":
                    chatData.messages.push(message);
                    sendSeenNotification();
                    chatData.update();
                  break;
                case "SEEN":
                  let lastMessage = messages[messages.length -1];
                  if(messages.length != 0 && (lastMessage.senderName === chatData.curentName))
                    lastMessage.seen = true;
                    chatData.update();
                case "TYPING":
                  chatData.istyping = true;
                    chatData.update();
                  await sleep(3000);
                  chatData.istyping = false;
                    chatData.update();
                  break;
                default:
                  // code block
              }
        } 
    }

    async function setConversation(username){
        chatData.contactName = username;
        chatData.messages =  await ChatService.getChatMessages(chatData.curentName,chatData.contactName);
        sendSeenNotification();
        update();
    }
    function sendMessage(event) {
        event.preventDefault();
        let messageText = event.target[0].value;
        event.target[0].value = "";

        let message = {
            senderName: chatData.curentName,
            receiverName:chatData.contactName,
            message: messageText,
            messageType: "MESSAGE",
            seen : false
        }
        ChatService.sendPrivateMessage(message);
        chatData.messages.push(message);
        update();
    }
    function sendSeenNotification(){
        let message = {
            senderName: chatData.curentName,
            receiverName:chatData.contactName,
            message: "",
            messageType: "SEEN",
            seen : false
        }
        ChatService.sendPrivateMessage(message);
    }
    function sendTypingNotification(){
        let message = {
            senderName: chatData.curentName,
            receiverName:chatData.contactName,
            message: "",
            messageType: "TYPING",
            seen : false
        }
        ChatService.sendPrivateMessage(message);
    }

    return(
        <div>
            <Row>
                <Col xs={9} style={{height:"1vh", backgroundColor:"#E5E5E5"}}>
                    <ChatComponent 
                    contactName={chatData.contactName} 
                    curentName={chatData.curentName}
                    messages={chatData.messages}
                    sendMessage={sendMessage}
                    sendTyping={sendTypingNotification}
                    typing={chatData.istyping}/> 
                </Col>
                <Col xs={3} style={{height:"1vh",backgroundColor:"#E5E5E5"}}>
                    {chatData.contactList.map(contact => FriendComponent(contact.username,setConversation))}
                </Col>
            </Row>
        </div>

    );
}


