import React, { useEffect, useState } from "react";
import DeviceService from "../../services/device_service";
import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    Title,
    Tooltip,
    Filler,
    Legend,
  } from 'chart.js';
import { Line } from 'react-chartjs-2';
import $ from 'jquery';
import "react-datepicker/dist/react-datepicker.css";

ChartJS.register(
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    Title,
    Tooltip,
    Filler,
    Legend
  );


  export const options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top' ,
      },
      title: {
        display: true,
        text: 'Chart.js Line Chart',
      },
    },
  };



function Consumption(){
    const [devices,setDevices] = useState([]);
    const [data,setData] = useState(createData(getInitialData()))

    useEffect( ()=>{
        async function fetchData(){
            setDevices(await DeviceService.getCurentUserDevices());
        }
        fetchData();
    },[data]);
    
    return (
        <div>
            <form id="data-from" onSubmit={(event)=>{updateData(event,setData)}}>
                <label>Device id</label>
                <select name="deviceId" id="type">
                    {getOptions(devices,null)}
                </select>
                <input name ="date" type="date"/>
                <button className='formButton' name="userloginbutton" value={0}>Check</button>
            </form>
            <div style={{width :"1000px" }}>
                <Line  options={options} data={data} />;
            </div>
        </div>

    )

}

function createData(data){
    return {
        labels : Array.from(Array(24).keys()),
        datasets: [
          {
            fill: true,
            label: 'Dataset 2',
            width: '100px',
            data: data,
            borderColor: 'rgb(53, 162, 235)',
            backgroundColor: 'rgba(53, 162, 235, 0.5)',
          },
        ],
      };
}
function getInitialData(){
    return Array(24).fill(0);
}

function getOptions(devices,curentDevice){
    if(curentDevice == null)
        return [
                <option value={""}>{"-"}</option>,
                ...React.Children.toArray(devices.map((device)=>(
                    <option value={device.id}>{device.id}</option>
                )))

        ];
    return [
        <option value={""}>{"-"}</option>,
        ...React.Children.toArray(devices.map((device)=> {
            if(curentDevice.id == curentDevice )
                return <option selected value={device.id}>{device.id}</option>
            return <option value={device.id}>{device.id}</option>
        }
            
        ))

    ];
}

async function updateData(event,setData){
    event.preventDefault();
    let deviceId = $(`#data-from select[name = "deviceId"]`).find(":selected").val();
    let date = $(`#data-from input[name = "date"]`).val();
    if(deviceId === "" || date === ""){
        
        setData(createData(getInitialData()));
        return;
    }
    let data = await DeviceService.getMeasurements(parseInt(deviceId),date);
    data = data.map(d => d.value);
    if(data.length == 0){
        data = getInitialData();
    }
    setData(createData(data));
}
export default Consumption;