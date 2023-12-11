import './css/LoginPage.css'
import React from "react";
import {useNavigate,BrowserRouter as Router,Link,Routes,Route} from "react-router-dom"
import axios from 'axios';
import AuthService from './services/AuthService';

const serverRoot = 'http://localhost:8080'
let navigate;
const LoginPage = () =>{
    navigate = useNavigate();
        return (
            <div className="login-page">
                <div className="form">
                        <div>
                            <Routes>
                                <Route path="/*" element={LoginComponent()} ></Route>
                                <Route path="toLogin" element={LoginComponent()} ></Route>
                                <Route path="toRegister" element={RegisterComponent()}></Route>
                            </Routes>
                        </div>
                    <button onClick={populateData} >Populate Database</button>

                </div>
            </div>
        );
}
function LoginComponent(){
    
    return(<form className="login-form" onSubmit={handleLogin}>
        <input type="text"  name="username" placeholder="username"/>
        <input type="password" name="password" placeholder="password"/>
        <p id="#error" style={{color : "#ff0000"}}></p>
        <button onClick={(e)=>{e.target.value = 1}} className='formButton' name="userloginbutton" value={0}>login user</button>
        <button onClick={(e)=>{e.target.value = 1}}className='formButton' name="adminloginbutton" value={0}>login administrator</button>
        <p className="message"> Not registered? <Link to = "/toRegister">Create an account</Link></p>
    </form>)
}

function RegisterComponent(){
    return(<form className="register-form1" onSubmit={register}>
            <input type="text"  name="username" placeholder="username"/>
            <input type="password" name="password1" placeholder="password"/>
            <input type="password" name = "password2" placeholder="password"/>
            <p id="#error" style={{color : "#ff0000"}}></p>
            <button className='formButton' >create</button>
            <p className="message"> Already registered ? <Link to = "/toLogin">Sign In</Link></p>
        </form>
    )
}
function handleLogin(event){
    displayError("");
    event.preventDefault();
    var username = event.target.elements.username.value;
    var password = event.target.elements.password.value;
    var userButton =  event.target.elements.userloginbutton;
    var adminButton = event.target.elements.adminloginbutton;

    let x = adminButton.value;
    if(1 == x){
        // console.log("to restaurant");
        adminButton.value = 0;
        loginRestaurant(username,password);
    }
    let y = userButton.value;
    if(1 == y){
        // console.log("to user");
        userButton.value = 0;
        loginUser(username,password)
    }
    
}

function loginRestaurant(name, password){
    AuthService.loginRestaurant(name,password)
    .then(res => {
        navigate('/restaurant');
    }).catch(function(error){
        displayError(error);
    });
}
function loginUser(username, password){
    AuthService.loginUser(username,password)
    .then(res => {
        navigate('/user');
    }).catch(function(error){
        displayError(error);
    });
}

function register(event){
    displayError("");
    event.preventDefault();
    
    var username = event.target.elements.username.value;
    var password1 = event.target.elements.password1.value;
    var password2 = event.target.elements.password2.value;
    if(password1 !== password2){
        displayError("password must be the same");
    }else{
        let user = {
            username :username,
            password : password1
        }
        axios.post(`${serverRoot}/authcontroller/signupclient`, user)
          .then(function (response) {
            navigate("/")
          })
          .catch(function (error) {
              console.log(error);
            displayError(error);
          });
    }
}
function displayError(error){
    document.getElementById("#error").innerText = error;
}
function populateData(){
    axios.post(`${serverRoot}/populationcontroller/populate`);
}
export default LoginPage;


