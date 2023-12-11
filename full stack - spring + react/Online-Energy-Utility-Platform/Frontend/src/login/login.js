import React from "react";
import {useNavigate, Routes,Route } from "react-router-dom";
import "./css/login.css";
import { Link } from "react-router-dom";
import AuthentificationService from "../services/authentification_service";
import { Alert } from "bootstrap";

let navigate;
function Login(){
    navigate = useNavigate();
    return (
        <div>
            <Routes>
                <Route
                    path='/'
                    element={getLoginComponent()}
                />
                <Route
                    exact
                    path='/register'
                    element={getRegisterComponent()}
                />
            </Routes>

        </div>
    );
}
function getLoginComponent(){
    return(
    <form className="login-form" onSubmit={popEvent}>
        <input type="text"  name="username" placeholder="username"/>
        <input type="password" name="password" placeholder="password"/>
        <p id="error" ></p>
        <button onClick={(e)=>{e.target.value = 1}} className='formButton' name="userloginbutton" value={0}>login</button>
        <button className='formButton' name="populatebutton" value={0}>populate</button>
        <p className="message"> Not registered? <Link to = "/register">Create an account</Link></p>
    </form>
    );
}

function popEvent(event){
    event.preventDefault();
    if(event.target.elements.userloginbutton.value == 1){
        event.target.elements.userloginbutton.value = 0;
        login(event);
    }else{
        AuthentificationService.populate()
        .then(res=>{
            alert("Database was populated");
        }).catch(error => {
            displayError(error.message);
        });
    }

    
}

function login(event){
    let username = event.target.elements.username.value;
    let password = event.target.elements.password.value;
    AuthentificationService.login(username,password).then(user=>{
        if(user.userType == 'ADMINISTRATOR')
            navigate('./administrator');
        else{
            navigate('./client');
        }
    }).catch(error => {
        displayError(error.message);
    });


}


function getRegisterComponent(){
    return(
    <form className="login-form" onSubmit={register}>
        <input type="text"  name="username" placeholder="username"/>
        <input type="password" name="password1" placeholder="password"/>
        <input type="password" name="password2" placeholder="password"/>
        <select name="userType" id="type">
            <option value="ADMINISTRATOR">Administrator</option>
            <option value="CLIENT">Client</option>
        </select>
        <p id="error" ></p>
        <button onClick={(e)=>{e.target.value = 1}} className='formButton' name="userloginbutton" value={0}>register user</button>
        <p className="message"> Already registered? <Link to = "..">Log In</Link></p>
    </form>
    );
}

function register(event){
    event.preventDefault();
    let username = event.target.elements.username.value;
    let password1 = event.target.elements.password1.value;
    let password2 = event.target.elements.password2.value;
    let userType = event.target.elements.userType.value;

    if(password1 !== password2){
        displayError("password must be the same");
    }else{
        AuthentificationService.register(username,password1,userType).then(res=>{
            navigate("/");
        }).catch(error => {
            displayError(error.message);
        });
    }
}


function displayError(error){
    console.log(error);
    document.getElementById("error").innerText = error;
}
export default Login;