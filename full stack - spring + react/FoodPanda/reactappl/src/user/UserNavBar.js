import React from "react";
import { useState } from "react";
import {Link} from "react-router-dom"
import AuthService from "../services/AuthService";

function UserNavBar({curentUser}){
    return (
      <nav className="navbar navbar-expand-lg navbar-light bg-light">
      <Link className="navbar-brand" to="/">{curentUser.username}</Link>
      
      <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span className="navbar-toggler-icon"></span>
      </button>
    
      <div className="collapse navbar-collapse" id="navbarSupportedContent">
        <ul className="navbar-nav mr-auto">
          <li className="nav-item active">
            <Link className="nav-link" to = './foods'>Foods <span className="sr-only">(current)</span></Link>
          </li>
          <li className="nav-item active">
            <Link className="nav-link" to = './orders'>Orders <span className="sr-only">(current)</span></Link>
          </li>
          <li className="nav-item active">
            <Link className="nav-link" to = './cart'>Cart <span className="sr-only">(current)</span></Link>
          </li>
          <li className="nav-item active">
            <Link className="nav-link" onClick={AuthService.logoutUser} to = '/'>Log Out <span className="sr-only">(current)</span></Link>
          </li>
        </ul>
  
      </div>
    </nav>
  )
  }

  export default UserNavBar;