import React from "react";
import { send } from 'emailjs-com';

class MailService{
    sendEmail(order){
            let {foodString,price} = order.foods.reduce( ({foodString, price}, food) => {
                foodString+= `${food.name}         ${food.price} $` + "\n";
                
                price+= food.price;
                return {foodString:foodString,price:price}
            },{foodString: "",price : 0});
            const emailInfo ={
                        from_name: order.user.username,
                        location: order.restaurant.availableZones,
                        price: `${price}$`,
                        foods : foodString,
                    };
            send('service_83bui7i', `template_15h3lep`, emailInfo,  `L1R_dB-uklqNAeYtC`)
                .then((result) => {
                    alert(result.text);
                },
                (error) => {
                    alert(error.text);
                });
        }
}
export default new MailService()
