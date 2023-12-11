import React, { useEffect, useState } from "react";
import DeviceService from "../../services/device_service";

function DeviceScreen(){
    const [devices,setDevices] = useState([]);
    useEffect( ()=>{
        async function fetchData(){
            setDevices(await DeviceService.getCurentUserDevices());
        }
        fetchData();
    },[]);

    return (
    <div className="card card-body">
        <table className="table table-striped table-dark text-center">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                </tr>
            </thead>
            <tbody>
                {
                    React.Children.toArray(devices.map((device)=> {
                        return (<tr id= {`row${device.id}`}>
                            <td name='id'>{device.id}</td>
                        </tr>)
                    }))
                }
            </tbody>
        </table>
    </div>           
    );
}
export default DeviceScreen;