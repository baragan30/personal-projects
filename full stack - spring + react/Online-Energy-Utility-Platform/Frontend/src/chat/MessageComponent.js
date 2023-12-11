import React from "react";

import { Button, Card } from 'react-bootstrap';
import { right } from "@popperjs/core";


export default function MessageComponent({curentUsername,message}) {
    if (curentUsername === message.senderName)
        return (
            <Card style={{ backgroundColor: "#abd9e9", textAlign: "end"}}>
                <Card.Title style={{fontSize:"12px", paddingRight:"5px"}}>
                    {message.senderName}
                </Card.Title>
                <Card.Subtitle style={{fontSize:"22px", paddingRight:"10px"}}>
                    {message.message}
                </Card.Subtitle>
            </Card>
        )
    return (
        <Card style={{ backgroundColor: "#eff3f7" }}>
            <Card.Title style={{fontSize:"12px", paddingLeft:"5px"}}>
            {message.senderName}
            </Card.Title>
            <Card.Subtitle style={{fontSize:"22px", paddingLeft:"10px"}}>
            {message.message}
            </Card.Subtitle>
        </Card>
    )
}
