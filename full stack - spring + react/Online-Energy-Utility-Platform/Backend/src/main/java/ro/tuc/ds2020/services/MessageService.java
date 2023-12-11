package ro.tuc.ds2020.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ro.tuc.ds2020.entities.Message;
import ro.tuc.ds2020.entities.MessageType;
import ro.tuc.ds2020.repositories.MessageRepository;

import java.util.List;

@Service
public class MessageService {
    private static final Logger logger = LoggerFactory.getLogger(MessageService.class);
    @Autowired
    private final MessageRepository messageRepository;

    public MessageService(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    public void saveMessage(Message message){
        try{
            if(message.getMessageType() == MessageType.MESSAGE){
                messageRepository.save(message);
            }
            makeSenderMessagesSeen(message.getSenderName(),message.getReceiverName());
        }catch (Exception e){
            logger.error(e.toString());
            throw e;

        }
    }
    public void makeSenderMessagesSeen(String sender, String receiver){
        try{
            List<Message> chat = getConversation(sender,receiver);
            for(Message m : chat){
                if(m.getReceiverName().equals(sender)){
                    m.setSeen(true);
                    messageRepository.save(m);
                }

            }
        }catch (Exception e){
            logger.error(e.toString());
            throw e;

        }
    }
    public List<Message> getConversation(String username1, String username2){
        try{
            List<Message> chat = messageRepository.getConversation(username1,username2);
//            logger.info("Chat between "+ username1 + " and " + username2 +  " was getted from database");
            return chat;
        }catch (Exception e){
            logger.error(e.toString());
            throw e;

        }
    }
    public void deleteAll(){
        try{
            messageRepository.deleteAll();
        }catch (Exception e){
            logger.error(e.toString());
            throw e;
        }
    }
}
