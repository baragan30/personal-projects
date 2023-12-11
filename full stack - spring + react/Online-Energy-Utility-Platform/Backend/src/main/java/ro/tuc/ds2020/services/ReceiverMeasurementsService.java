package ro.tuc.ds2020.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.rabbitmq.client.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import ro.tuc.ds2020.controllers.NotificationController;
import ro.tuc.ds2020.dtos.MeasurementDTO;
import ro.tuc.ds2020.dtos.NotificationDTO;
import ro.tuc.ds2020.dtos.builders.MeasurementsBuilder;
import ro.tuc.ds2020.entities.Measurements;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.concurrent.TimeoutException;

@Component
public class ReceiverMeasurementsService {
    private static final String QUEUE_NAME = "measurements";

    private static final Logger logger = LoggerFactory.getLogger(ReceiverMeasurementsService.class);

    private static final String host = "localhost";

    private static final DecimalFormat df = new DecimalFormat("0.00");

    private static Double deviceLimit = 1000.0;

    @Autowired
    private NotificationController notificationController;
    @Autowired
    private DeviceService deviceService;

//    public ReceiverMeasurementsService() {
//        ConnectionFactory factory = new ConnectionFactory();
//        factory.setHost(host);
//        Connection connection = null;
//        try {
//            connection = factory.newConnection();
//            Channel channel = connection.createChannel();
//
//            channel.queueDeclare(QUEUE_NAME, false, false, false, null);
//
//            DeliverCallback deliverCallback = (consumerTag, delivery) -> {
//                receiveMeasurement(delivery);
//
//            };
//            channel.basicConsume(QUEUE_NAME, true, deliverCallback, consumerTag -> { });
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        } catch (TimeoutException e) {
//            throw new RuntimeException(e);
//        }
//    }


//    private void receiveMeasurement(Delivery delivery){
//        try{
//            ObjectMapper mapper = new ObjectMapper();
//            MeasurementDTO measurementDTO = mapper.readValue(delivery.getBody(), MeasurementDTO.class);
//
//            Measurements measurements = MeasurementsBuilder.toMeasurements(measurementDTO);
//            deviceService.saveMeasurement(measurements);
//            Double measure = deviceService.getLastHourMeasurements(measurementDTO.getDeviceId());
//            if(measure > deviceLimit){
//                String head = "Device " + measurementDTO.getDeviceId();
//                String body = "Energy consumption limit exceeded " + df.format(measure);
//                notificationController.sendMessage(new NotificationDTO(head,body));
//            }
//
//        }catch (Exception e){
//            e.printStackTrace();
//
//        }
//
//
//    }
    @RabbitListener(queues = QUEUE_NAME)
    private void receiver(MeasurementDTO measurementDTO){
        if(measurementDTO == null){
            System.err.println("Error measurementDTO is null");
            return;
        }

        try{
            Measurements measurements = MeasurementsBuilder.toMeasurements(measurementDTO);
            deviceService.saveMeasurement(measurements);

            Double measure = deviceService.getLastHourMeasurements(measurementDTO.getDeviceId());
            if(measure > deviceLimit){
                String head = "Device " + measurementDTO.getDeviceId();
                String body = "Energy consumption limit exceeded " + df.format(measure);
                NotificationDTO notificationDTO = new NotificationDTO(head,body);
                logger.info(notificationDTO.toString());
                notificationController.sendMessage(notificationDTO);
            }

        }catch (Exception e){
            System.err.println(measurementDTO.toString());
        }


    }

}
