package ro.tuc.ds2020.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ro.tuc.ds2020.entities.Device;
import ro.tuc.ds2020.entities.Message;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message,Long> {
    @Query("SELECT M FROM Message M " +
            "where (M.senderName = :username1 and M.receiverName = :username2) or " +
            "(M.senderName = :username2 and M.receiverName = :username1)")
    List<Message> getConversation(@Param("username1") String username1,@Param("username2") String username2);
}
