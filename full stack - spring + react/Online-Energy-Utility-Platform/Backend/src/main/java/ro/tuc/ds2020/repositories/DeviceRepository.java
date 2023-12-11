package ro.tuc.ds2020.repositories;

import io.micrometer.core.instrument.Measurement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ro.tuc.ds2020.entities.Device;
import ro.tuc.ds2020.entities.Measurements;
import ro.tuc.ds2020.entities.User;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public interface DeviceRepository extends JpaRepository<Device,Long> {
    @Query("SELECT D FROM Device D " +
            "JOIN User U ON D.user = U " +
            "where U.username = :username")
    List<Device> findDeviceByUsername(@Param("username") String username);


    List<Device> findDeviceByUser(User user);
}
