import React from "react";
export default function Food({food}){
    return(
        <tr>
            <th scope="row">{food.name}</th>
            <td>{food.category}</td>
            <td>{food.restaurant.name}</td>
            <td>{food.price}</td>
        </tr>
    );
}