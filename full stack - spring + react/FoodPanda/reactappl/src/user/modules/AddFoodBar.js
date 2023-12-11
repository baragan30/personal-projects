import React from "react"

export default function AddFoodBar({addToCart,food}){
    return(
        <tr>
            <th scope="row">{food.name}</th>
            <td>{food.category}</td>
            <td>{food.restaurant.name}</td>
            <td>{food.price}</td>
            <td>
                <button onClick={()=> addToCart(food)} type="button" className="btn btn-dark"> 
                Add to cart
                </button>
            </td>
        </tr>
    )

}