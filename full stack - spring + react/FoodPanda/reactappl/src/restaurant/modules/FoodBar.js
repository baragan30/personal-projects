import React, { useState, useEffect } from 'react';
import axios from 'axios';
const serverRoot = 'http://localhost:8080';



export default function FoodBar({food}){
    return(
        <li className="list-group-item">{foodToString(food) }</li>
    );
}

function foodToString(food){

    return `${food.name}                    ${food.price}$`;
}