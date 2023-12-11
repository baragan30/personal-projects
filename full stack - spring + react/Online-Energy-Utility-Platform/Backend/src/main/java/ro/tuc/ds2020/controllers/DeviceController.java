package ro.tuc.ds2020.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import ro.tuc.ds2020.dtos.GetMeasurementDTO;
import ro.tuc.ds2020.dtos.StringDTO;
import ro.tuc.ds2020.entities.Device;
import ro.tuc.ds2020.entities.Measurements;
import ro.tuc.ds2020.security.services.UserDetailsImpl;
import ro.tuc.ds2020.services.DeviceService;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(value = "/device")
public class DeviceController {
    @Autowired
    private DeviceService deviceService;

    @GetMapping("/getCurentUserDevices")
    public ResponseEntity<?> getUserDevices(){
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            List<Device> devices = deviceService.getDeviceByUser(userDetails);
            return ResponseEntity.ok().body(devices);
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.toString());
        }
    }

    @PostMapping("/get")
    public ResponseEntity<List<Device>> getDevices(@RequestBody StringDTO userId){
        try{
            List<Device> devices =  deviceService.getDevice(userId.getString());
            return ResponseEntity.ok().body(devices);
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ArrayList<>());
        }
    }
    @PostMapping("/delete")
    public ResponseEntity<String> deleteDevice(@RequestBody StringDTO userId){
        try{
            deviceService.delete(userId.getString());
            return ResponseEntity.ok().body("OK");
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.toString());
        }
    }
    @PostMapping("/update")
    public ResponseEntity<String> updateDevice(@RequestBody Device device){
        try{
            deviceService.saveDevice(device);
            return ResponseEntity.ok().body("OK");
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.toString());
        }
    }
    @PostMapping("/measurements")
    public ResponseEntity<?> getMeasurements(@RequestBody GetMeasurementDTO getMeasurementDTO){
        try{
            List<Measurements> measurements = deviceService.getMeasurements(getMeasurementDTO.getDeviceId(),getMeasurementDTO.getDate());
            return ResponseEntity.ok().body(measurements);
        }catch (Exception e){
            throw e;
        }
    }

}

