import React from 'react';
import { Button, Card } from 'react-bootstrap';


export default function FriendComponent(username,setUsername){
    
    return (
        <Button onClick={()=>{setUsername(username)}}>
            <Card style={{height:"50px", backgroundColor:"#20df7f", border:"0px"}}>
                {/* <Card.Img variant='' src={friend.imageUrl}>

                </Card.Img> */}
                <Card.Title>
                    {username}
                </Card.Title>
            </Card>
        </Button>
    )
}