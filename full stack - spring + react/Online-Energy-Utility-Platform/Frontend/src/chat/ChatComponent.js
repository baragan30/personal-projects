import React, { useEffect } from 'react';
// import { createRoot } from "react-dom/client";
import MessageComponent from './MessageComponent';
import Form from 'react-bootstrap/esm/Form';
import Button from 'react-bootstrap/esm/Button';
import { useState } from 'react';
import "./Chat.css";
import ChatService from '../services/ChatService';

export default function ChatComponent({curentName,contactName: contactName,messages,sendMessage,sendTyping,typing}) {
    const [index, setIndex] = useState(0);
    function update() {
        setIndex(index + 1);
    }
    let seen = false;
    const lastMessage = messages[messages.length -1]
    // console.log(messages);
    if(messages.length!= 0 && (lastMessage.senderName === contactName || lastMessage.seen)){
        seen = true;
    }
    if(contactName === "")
    return <div>
        No user selected
    </div>

    return (
        <div>
            
            <div className="chat_title">
                Chat @ {contactName}
                {
                    seen ? <div>saw conversation</div> : <div>didn't see conversation</div>
                }

            </div>
            <div className="messages_div">
                {
                    messages.map(message => MessageComponent({curentUsername:curentName,message}))
                }
                {
                    typing && <MessageComponent curentUsername={curentName} message={{
                        senderName: contactName,
                        receiverName:curentName,
                        message: "  is typing ...",
                        messageType: "MESSAGE",
                        seen : false
                    }}></MessageComponent>
                }
            </div>



            <Form onSubmit={sendMessage}>
                <Form.Group className="mb-3" controlId="message">
                    <Form.Control type="text" placeholder="message" onChange={sendTyping} />
                </Form.Group>
                <Button variant="primary" type="submit">
                    Send
                </Button>
            </Form>
        </div>
    );


}