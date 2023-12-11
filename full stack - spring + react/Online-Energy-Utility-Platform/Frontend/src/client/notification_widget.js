import { number } from 'prop-types';
import React, { useState } from 'react';
import { useEffect } from 'react';
import Button from 'react-bootstrap/Button';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';
import Toast from 'react-bootstrap/Toast';
import SockJsClient from 'react-stomp';
import device_service from '../services/device_service';

const SOCKET_URL = 'https://localhost:8080/ws-message';

export default function NotificationWidget() {

    const [showA, setShowA] = useState(false);
    const [notifications, _] = useState([]);
    const [no_notifications, setNONotifications] = useState(0);
  
    const toggleShowA = () => setShowA(!showA);
    useEffect(()=>{

    },[notifications])

    

    let onConnected = () => {
      console.log("Socket Connected!!")
    }
  
    let onMessageReceived = async (msg) => {
      let deviceIds = (await device_service.getCurentUserDevices()).map(d => d.id);
      let curentDeviceID = Number(msg.header.split(" ")[1]);
      if(deviceIds.includes(curentDeviceID)){
        notifications.unshift(msg);
        setNONotifications(notifications.length)
      }
      
    }
  
    let onDisconnect = () =>{
      console.log("Socket Disconnected!");
    }


  return (
    <div>
        <SockJsClient
          url={SOCKET_URL}
          topics={['/topic/message']}
          onConnect={onConnected}
          onDisconnect={onDisconnect}
          onMessage={onMessageReceived}
          debug={false}
        />


        <Button onClick={toggleShowA} className="mb-2">
          Notification <strong>({notifications.length})</strong>
        </Button>
        <Col md={12} className="mb-2">

        {
        React.Children.toArray(notifications.map((notification) => {
                        return (
                        <Toast show={showA} onClose={toggleShowA}>
                            <Toast.Header>
                                <strong className="me-auto">{notification.header}</strong>
                                {/* <small>11 mins ago</small> */}
                            </Toast.Header>
                            <Toast.Body>{notification.body}</Toast.Body>
                        </Toast>
                        )
                    }))
        }
      </Col>
    </div>
      
  );
}