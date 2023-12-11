package ro.tuc.ds2020.entities;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String senderName;
    private String receiverName;
    private String message;

    private MessageType messageType;

    private boolean seen;

    public Message(String senderName, String receiverName, String message, MessageType messageType, boolean seen) {
        this.senderName = senderName;
        this.receiverName = receiverName;
        this.message = message;
        this.messageType = messageType;
        this.seen = seen;
    }
}

