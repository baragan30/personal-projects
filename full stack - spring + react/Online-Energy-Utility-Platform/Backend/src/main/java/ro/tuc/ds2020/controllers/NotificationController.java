package ro.tuc.ds2020.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import ro.tuc.ds2020.dtos.NotificationDTO;
import ro.tuc.ds2020.dtos.StringDTO;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

import static java.util.concurrent.TimeUnit.SECONDS;


@RestController
public class NotificationController {

    @Autowired
    SimpMessagingTemplate template;

    private static final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(10);


//    @PostMapping("/send")
//    public ResponseEntity<Void> sendMessage(@RequestBody StringDTO textMessageDTO) {
//        System.out.println(1 + textMessageDTO.toString());
//        return new ResponseEntity<>(HttpStatus.OK);
//    }

    @MessageMapping("/sendMessage")
    public void receiveMessage(@Payload StringDTO textMessageDTO) {
        scheduler.scheduleAtFixedRate(() -> {
            template.convertAndSend("/topic/message", "something");
        }, 0, 2, SECONDS);
    }

    public void sendMessage(NotificationDTO message){
        template.convertAndSend("/topic/message", message);
    }

    @SendTo("/topic/message")
    public StringDTO broadcastMessage(@Payload StringDTO textMessageDTO) {
        return textMessageDTO;
    }
}
