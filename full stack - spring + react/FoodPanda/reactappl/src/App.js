import React from 'react';
import LoginPage from './LoginPage'
import RestaurantPage from './restaurant/RestaurantPage';
import UserPage from './user/UserPage';
import {BrowserRouter as Router,Link,Routes,Route} from "react-router-dom"
// let data;

function App() {
  
  // return new LoginPage();
  return(
    <Router>
      <Routes>
        <Route exact path = "/*" element = {<LoginPage/>}/>
        <Route exact path='/restaurant/*' element = {<RestaurantPage/>}/>
        <Route exact path='/user/*' element = {<UserPage/>}/>
      </Routes>
    </Router>
  )
}


export default App;
