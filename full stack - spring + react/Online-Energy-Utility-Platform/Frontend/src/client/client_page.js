import React, { useEffect, useState } from "react";
import {Routes,Route, useNavigate} from "react-router-dom"
import ClientNavBar from './client_nav_bar';
import AuthentificationService from '../services/authentification_service';
import DeviceScreen from "./screens/devices_screen";
import Consumption from "./screens/consumption";
import ChatPage from "../chat/ChatPage";


function ClientPage(){
    const [curentUser,setCurentRestaurant] = useState(AuthentificationService.getCurrentUser());
    let navigate = useNavigate();
    useEffect( e =>{
        if(AuthentificationService.isAdministratorLogged())
          navigate('/');
      },[]);
    if(curentUser === null)
      return <div/>;
    return (
        <div>
            <ClientNavBar name ={curentUser.username}></ClientNavBar>
            <Routes>
              <Route path="/*" element = {<DeviceScreen></DeviceScreen>}/>
              <Route path="/users" element = {<DeviceScreen></DeviceScreen>}/>
              <Route path="/consumption" element = {<Consumption></Consumption>}/>
              <Route path="/chat" element = {<ChatPage></ChatPage>}/>
            </Routes>
        </div>
    );
}

export default ClientPage;