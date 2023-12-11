package ro.tuc.ds2020.services;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RestController;
import ro.tuc.ds2020.entities.Measurement;
import ro.tuc.ds2020.rabbitmq.MQConfig;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Date;
import java.util.Random;


@Service
public class ProducerService {

    private static final String QUEUE_NAME = "measurements";
    private static final String filename = "sensor.csv";
    private static final String host = "localhost";
    private static final Logger logger = LoggerFactory.getLogger(ProducerService.class);

    private static final int periodSeconds = 2;

    private final Long deviceId;
    private  BufferedReader br = null;

    @Autowired
    private RabbitTemplate template;


    @Autowired
    public ProducerService(@Value("${device.id}") Long deviceId) {
        this.deviceId = deviceId;
        try {
            br = new BufferedReader(new FileReader(filename));
        }catch (Exception e){
            logger.error(e.toString());
        }
    }



    @Scheduled(fixedDelayString  = "${device.timestamp}")
    public void readAndSendNextMeasurement(){
        Measurement measurement = getNextMeasurement();
        if(measurement == null){
            return;
        }
        sentMeasurement(measurement);
    }

    private Measurement getNextMeasurement(){
        Date date = new Date();

        try{
            String line = br.readLine();
            float value = Float.parseFloat(line);
            return new Measurement(deviceId ,date,value);
        }catch (Exception e) {
//            logger.error(e.toString());
            Random r = new Random();
            double random = r.nextDouble() * (1000);
            Measurement measurement = new Measurement(deviceId,date,(float) random);
            logger.info(measurement.toString());
            return measurement;
        }

    }
    public void sentMeasurement(Measurement measurement){
        try{
            template.convertAndSend(MQConfig.EXCHANGE, MQConfig.ROUTING_KEY, measurement);
            logger.info(measurement.toString());
        }catch (Exception e){
            e.printStackTrace();
        }

    }


}
