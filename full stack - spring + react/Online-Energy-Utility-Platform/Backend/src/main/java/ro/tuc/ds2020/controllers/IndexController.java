package ro.tuc.ds2020.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ro.tuc.ds2020.dtos.UserDTO;
import ro.tuc.ds2020.dtos.authentification.NewUserDTO;
import ro.tuc.ds2020.entities.Device;
import ro.tuc.ds2020.entities.Measurements;
import ro.tuc.ds2020.entities.Message;
import ro.tuc.ds2020.entities.UserType;
import ro.tuc.ds2020.services.DeviceService;
import ro.tuc.ds2020.services.MessageService;
import ro.tuc.ds2020.services.UserService;

import java.time.LocalDateTime;
import java.util.Random;


@RestController
@CrossOrigin
public class IndexController {

    @Autowired
    private UserService userService;

    @Autowired
    private DeviceService deviceService;

    @Autowired
    private MessageService messageService;

    @GetMapping(value = "/")
    public ResponseEntity<String> getStatus() {
        return new ResponseEntity<>("City APP Service is running...", HttpStatus.OK);
    }
    @GetMapping(value = "/populate")
    public ResponseEntity<String> populate(){
        try{
            userService.deleteAll();
            messageService.deleteAll();
            userService.insert(new NewUserDTO("admin","asd", UserType.ADMINISTRATOR));
            userService.insert(new NewUserDTO("client1","asd", UserType.CLIENT));
            userService.insert(new NewUserDTO("client2","asd", UserType.CLIENT));
            deviceService.deleteAll();
            UserDTO client1 = userService.getByUsername("client1");
            UserDTO client2 = userService.getByUsername("client2");

            for(int i = 1 ; i <=3; i++){
                Device device = new Device();
                deviceService.saveDevice(device,client1);
                createRandomMeasurements(device);
                deviceService.saveDevice(device);

            }
            for(int i = 1 ; i <=3; i++){
                Device device = new Device();
                deviceService.saveDevice(device,client2);
                createRandomMeasurements(device);
                deviceService.saveDevice(device);

            }
            return ResponseEntity.ok().body("OK");
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.toString());
        }
    }

    public void createRandomMeasurements(Device device){
        Random r = new Random();
        float random = 0 + r.nextFloat() * (5);
        for(int mounth = 12 ; mounth <=11 ; mounth++){
            for(int day = 1; day <=30;day++){
                for(int hour = 0 ; hour < 24;hour++){
                    float curent;
                    do{
                        float dx = -5 + r.nextFloat() * (10);
                        curent = random + dx;
                    }while(curent < 0 || curent >40);
                    random = curent;

                    LocalDateTime localDateTime = LocalDateTime.of(2022,mounth,day,hour,0);
                    device.addMeasurement(new Measurements(localDateTime,random,device));
                }
            }
        }

    }

}
