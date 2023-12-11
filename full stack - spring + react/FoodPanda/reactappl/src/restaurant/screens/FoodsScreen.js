import React, { useState,useEffect } from 'react';
import FoodsCategoryBar from '../modules/FoodCategoryBar';
import AddFoodForm from '../modules/AddFoodForum';
import RestaurantService from '../../services/RestaurantService';
import jsPDF from'jspdf'



function FoodsScreen({curentRestaurant}){
    const [categories,setCategories] = useState([]);
    const [foods,setFoods] = useState([])

    const [value, setValue] = useState(0); // integ
    const forceUpdate = () => setValue(value+1);
    useEffect( async ()=>{
        setCategories( await RestaurantService.loadAllFoodCategories());
        setFoods(await RestaurantService.loadRestaurantFood(curentRestaurant));
    },[value]);

    function pdfGenerate(){
        var doc = new jsPDF('landscape','px','a4','false');
        let y = 20;
        doc.setFontSize(30);
        doc.text(250, y, `${curentRestaurant.name} Menu`);
        categories.forEach(category =>{
            let foodsCategory = [];
            foods.forEach(food =>{
                if(food.category === category){
                    foodsCategory.push(food);
                }
            });
            if(foodsCategory.length !== 0 ){
                 y+=25;
                doc.setFontSize(22);
                doc.text(20, y, category);
                
                foodsCategory.forEach(food =>{
                     y+=20;
                    doc.setFontSize(15);
                    doc.text(25, y, `${food.name}....................${food.price}$`);
                   
                });
            }
            
        });
        doc.save('a.pdf');
    }


    return (
        <div>
            <button onClick={pdfGenerate}>Download PDF</button>
            <AddFoodForm forceUpdate={forceUpdate} categoriesList = {categories} curentRestaurant={curentRestaurant}></AddFoodForm>
            {React.Children.toArray(categories.map((cat)=><FoodsCategoryBar signal = {value} category = {cat} restaurant = {curentRestaurant}/>))}
            
        </div>
    );
}
export default FoodsScreen;




