//package ro.tuc.ds2020.services;
//
//
//import org.springframework.amqp.core.Queue;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//@Configuration
//public class MessagingConfig {
//    @Bean
//    public Queue queue() {
//        return new Queue(Constants.QUEUE);
//    }
//    @Bean
//    public TopicExchange exchange() {
//        return new TopicExchange(Constants.EXCHANGE);
//    }
//    @Bean
//    public Binding binding(Queue queue , TopicExchange exchange) {
//        return BindingBuilder.bind(queue).to(exchange).with(Constants.ROUTING_KEY);
//    }
//
//    @Bean
//    public MessageConverter converter() {
//        return new Jackson2JsonMessageConverter();
//    }
//
//    @Bean
//    public AmqpTemplate template(ConnectionFactory connectionFactory) {
//        final RabbitTemplate rabbitTemplate = new RabbitTemplate(connectionFactory);
//        rabbitTemplate.setMessageConverter(converter());
//        return rabbitTemplate;
//    }
//}
