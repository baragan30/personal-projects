package ro.tuc.ds2020.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ro.tuc.ds2020.dtos.GetMeasurementDTO;
import ro.tuc.ds2020.entities.Measurements;
import ro.tuc.ds2020.entities.Message;
import ro.tuc.ds2020.entities.MessageType;
import ro.tuc.ds2020.services.DeviceService;
import ro.tuc.ds2020.services.MessageService;

import java.util.List;

@RestController
@CrossOrigin
public class ChatController {
    private int index = 0;

    private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
    @Autowired
    SimpMessagingTemplate simpMessagingTemplate;

    @Autowired
    MessageService messageService;

    @GetMapping("/getMessages/{username1}/{username2}")
    public ResponseEntity<?> getMeasurements(@PathVariable String username1,@PathVariable String username2){
        try{
            List<Message> chat = messageService.getConversation(username1,username2);
            return ResponseEntity.ok().body(chat);
        }catch (Exception e){
            throw e;
        }
    }

    @MessageMapping("/message") // /app/message
    @SendTo("chatroom/public")
    private Message receivePublicMessage(@Payload Message message){
        return message;
    }

    @MessageMapping("/private-message") // /app/message
    private void receivePrivateMessage(@Payload Message message){
        logger.info(message.toString());
        messageService.saveMessage(message);
        simpMessagingTemplate.convertAndSendToUser(message.getReceiverName(),"/private",message); // /user/David/private
    }

    void sendNotification(Message message){
        Message notification = new Message(message.getReceiverName(),message.getSenderName(),"", MessageType.SEEN,false);
        simpMessagingTemplate.convertAndSendToUser(message.getSenderName(),"/private",notification);
    }

//    @Scheduled(fixedDelay = 10000)
//    private void sendMessage(){
////        Message message = new Message("admin","client1","Message " + index,MessageType.MESSAGE,false);
//        Message message = new Message("admin","client1","",MessageType.TYPING,false);
//        index++;
//        simpMessagingTemplate.convertAndSendToUser(message.getReceiverName(),"/private",message);
//    }
//    @Scheduled(fixedDelay = 2000)
//    private void getConversation(){
//         List<Message> chat = messageService.getConversation("admin","client2");
//         for(Message m : chat){
//             System.out.println(m);
//         }
//    }
//    @Scheduled(fixedDelay = 2000)
//    private void testSeen(){
//         messageService.makeSenderMessagesSeen("admin","client1");
//         System.out.println("done");
//    }
}
