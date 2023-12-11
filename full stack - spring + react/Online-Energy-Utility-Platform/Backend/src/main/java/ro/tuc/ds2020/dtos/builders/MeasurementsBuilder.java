package ro.tuc.ds2020.dtos.builders;

import ro.tuc.ds2020.dtos.MeasurementDTO;
import ro.tuc.ds2020.entities.Device;
import ro.tuc.ds2020.entities.Measurements;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;

public class MeasurementsBuilder {
    public MeasurementsBuilder() {
    }
    public static Measurements toMeasurements(MeasurementDTO measurementDTO){
        try {
            Instant instant =  measurementDTO.getTimestamp().toInstant();
            LocalDateTime date =instant.atZone(ZoneId.systemDefault()).toLocalDateTime();
            return new Measurements(date,measurementDTO.getValue(),new Device(measurementDTO.getDeviceId()));
        }catch (Exception e){
//            System.err.println(measurementDTO.getTimestamp().toInstant());
            throw e;
        }



    }
}
