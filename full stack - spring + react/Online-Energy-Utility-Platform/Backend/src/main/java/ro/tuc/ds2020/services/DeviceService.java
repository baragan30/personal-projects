package ro.tuc.ds2020.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ro.tuc.ds2020.dtos.UserDTO;
import ro.tuc.ds2020.dtos.builders.UserBuilder;
import ro.tuc.ds2020.entities.Device;
import ro.tuc.ds2020.entities.Measurements;
import ro.tuc.ds2020.entities.User;
import ro.tuc.ds2020.repositories.DeviceRepository;
import ro.tuc.ds2020.repositories.MeasurementRepository;
import ro.tuc.ds2020.security.services.UserDetailsImpl;

import java.sql.Date;
import java.time.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class DeviceService {
    private static final Logger logger = LoggerFactory.getLogger(DeviceService.class);

    @Autowired
    private final DeviceRepository deviceRepository;

    @Autowired
    private final MeasurementRepository mearementRepository;




    public DeviceService(DeviceRepository deviceRepository, MeasurementRepository mearementRepository) {
        this.deviceRepository = deviceRepository;
        this.mearementRepository = mearementRepository;
    }
    public void saveDevice(Device device){
        try{
            deviceRepository.save(device);
            logger.info("Device " + device.getId() + " was created");
        }catch (Exception e){
            logger.error(e.toString());
            throw e;

        }
    }
    public List<Device> getDeviceByUser(UserDetailsImpl userDetails){
        try{
            User user = UserBuilder.toUser(userDetails);
            return deviceRepository.findDeviceByUser(user);
        }catch (Exception e){
            logger.error(e.toString());
            throw e;
        }
    }
    public List<Device> getDevice(String userId){
        try{
            if(userId.equals("")){
                return deviceRepository.findAll();
            }
            Long id = Long.parseLong(userId);
            User user = new User(id);
            List<Device> devices = deviceRepository.findDeviceByUser(user);
            logger.info(devices.size() + " was getted from db");
            return devices;
        }catch (Exception e){
            logger.error(e.toString());
            throw e;
        }
    }

    public void saveDevice(Device device, UserDTO userDTO){
        try{
            User user = UserBuilder.toUser(userDTO);
            device.setUser(user);
            deviceRepository.save(device);
            logger.info("Device " + device.getId() + " was created");
        }catch (Exception e){
            logger.error(e.toString());
            throw e;

        }
    }
    public void deleteAll(){
        try{
            deviceRepository.deleteAll();
        }catch (Exception e){
            logger.error(e.toString());
            throw e;
        }
    }
    public List<Measurements> getMeasurements(Long deviceId,LocalDate localDate){
        try {
            List<Measurements> measurements = new ArrayList<>() ;
            for(int hour = 0; hour < 23; hour++){
                LocalDateTime first = LocalDateTime.of(localDate,LocalTime.of(hour,0)).minusHours(2);
                LocalDateTime second = LocalDateTime.of(localDate,LocalTime.of(hour,59,59)).minusHours(2);
                Double measure = mearementRepository.getTotalMeasurementsOfDevice(deviceId,first,second );
                if(measure == null){
                    measure = Double.valueOf(0);
                }
                measurements.add(new Measurements(first,  measure.floatValue()));

            }
            return measurements;
        }catch (Exception e){
            logger.error(e.toString());
            throw e;
        }
    }
    public void saveMeasurement(Measurements measurements){
        try{
            mearementRepository.save(measurements);
        }catch (Exception e){
            logger.error(e.toString());
        }
    }

    public double getLastHourMeasurements(Long deviceId){
        LocalDateTime nowTime = LocalDateTime.now();
        LocalDateTime anHourAgo = nowTime.minusHours(1);

        try{
            Double measure = mearementRepository.getTotalMeasurementsOfDevice(deviceId,anHourAgo,nowTime );
            if(measure == null)
                return 0;
            return measure.doubleValue();

        }catch (Exception e){
            logger.error(e.toString());
        }
        return 0.0;

    }
    public void delete(String id){
        try {
            deviceRepository.deleteById(Long.parseLong(id));
        }catch (Exception e){
            logger.error(e.toString());
            throw e;
        }
    }
}
