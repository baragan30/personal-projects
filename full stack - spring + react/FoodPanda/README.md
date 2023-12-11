# FoodPanda (College project)
You can find the requirements of this project in requirments folder ("SD A2.pdf" + "SD A3.pdf").

In short it's a client-server application for a food delivery service.
The client side is written using react and can be found in the reactappl folder. The react code is structured in folders as follows :

- "./src/user" : here you can find the frontend for a normal user (client or delivery service).
- "./src/restaurant" : here you can find the frontend for an admin user (any restaurant).
- "./src/services" : here's the code that comunicate with server, that make all post and get request, that send emails, that handle authentification and register part and retain the jToken.

The server side is written using Spring framework and mysql database and can be found in the "src/main/java/com/example/foodpanda" folder. Here the code is structured 
based by layered architecture.
