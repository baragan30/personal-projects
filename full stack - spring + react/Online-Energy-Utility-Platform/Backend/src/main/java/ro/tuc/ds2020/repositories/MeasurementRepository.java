package ro.tuc.ds2020.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ro.tuc.ds2020.entities.Measurements;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public interface MeasurementRepository extends JpaRepository<Measurements,Long> {

    @Query("SELECT DISTINCT (M) FROM Measurements M " +
            "JOIN Device D ON M.device.id = :deviceId " +
            "where DATE(M.time) = :date ")
    List<Measurements> findMeasurementsByDateAndDevice(@Param("deviceId") Long deviceId, @Param("date") Date date);

    @Query("SELECT sum(M.value) FROM Measurements M " +
            "JOIN Device D ON M.device.id = :deviceId " +
            "where M.time between :date1 and :date2 ")
    Double getTotalMeasurementsOfDevice(@Param("deviceId") Long deviceId, @Param("date1") LocalDateTime date1, @Param("date2") LocalDateTime date2);
}
