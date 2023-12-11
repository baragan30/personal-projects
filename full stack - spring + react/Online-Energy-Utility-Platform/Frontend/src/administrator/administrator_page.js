import React, { useEffect, useState } from "react";
import {Routes,Route, useNavigate} from "react-router-dom"
import AdministratorNavBar from './administrator_nav_bar';
import AuthentificationService from '../services/authentification_service';
import UsersScreen from "./screens/users_screen";
import DeviceScreen from "./screens/device_screen";
import "./css/style.css";
import ChatComponent from "../chat/ChatComponent";
import ChatPage from "../chat/ChatPage";


function AdministratorPage(){
    const [curentUser,setCurentRestaurant] = useState(AuthentificationService.getCurrentUser());
    let navigate = useNavigate();
    useEffect( e =>{
        if(!AuthentificationService.isAdministratorLogged())
          navigate('/');
      },[]);
    if(curentUser === null)
      return <div/>;
    return (
        <div>
            <AdministratorNavBar name ={curentUser.username}></AdministratorNavBar>
            <Routes>
              <Route path="/*" element = {<UsersScreen></UsersScreen>}/>
              <Route path="/users" element = {<UsersScreen></UsersScreen>}/>
              <Route path="/devices" element = {<DeviceScreen></DeviceScreen>}/>
              <Route path="/chat" element = {<ChatPage></ChatPage>}/>
            </Routes>
        </div>
    );
}

export default AdministratorPage;