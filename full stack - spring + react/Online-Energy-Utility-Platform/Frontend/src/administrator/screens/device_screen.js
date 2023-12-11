import React, { useEffect, useState } from "react";
import UserService from "../../services/user_service";
import DeviceService from "../../services/device_service";
import $ from 'jquery';

function DeviceScreen(){
    const [devices,setDevices] = useState([]);
    const [users,setUsers] = useState([]);
    const [refresh,setRefresh] = useState(0);
    const forceUpdate = () => setRefresh(refresh+1);
    useEffect( ()=>{
        async function fetchData(){
            setDevices(await DeviceService.getUserDevices(""));
            setUsers(await UserService.getAll())
        }
        fetchData();
    },[refresh]);

    return (
    <div className="card card-body">
        <form id="create-device-form" onSubmit={(event)=>{createDevice(event,forceUpdate)}}>
            <label>User id</label>
            <select name="userId" id="type" defaultValue={"-"}>
                {getOptions(users,null)}
            </select>
            <button className='formButton' name="userloginbutton" value={0}>Create</button>
        </form>
        <p id="error" ></p>
        <table className="table table-striped table-dark text-center">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">UserID</th>
                    <th scope="col">Username</th>
                    <th scope="col">Update Button</th>
                    <th scope="col">Delete Button</th>
                </tr>
            </thead>
            <tbody>
                {
                    
                    React.Children.toArray(
                        devices.map((device)=> {
                        let user = device.user;
                        return (<tr id= {`row${device.id}`}>
                            <td name='id'>{device.id}</td>
                            <select name="userId" id="type" >
                                {getOptions(users,user)}
                            </select>
                            <td name='username'>{user == null? "-" : user.username}</td>
                            <td><button onClick={() => updateDevice(device,forceUpdate)}>Update</button></td>
                            <td><button onClick={() => deleteDevice(device.id,forceUpdate)}>Delete</button></td>
                        </tr>)
                    }))
                }
            </tbody>
            
        </table>

    </div>           
                           

    );
}


function getOptions(users,curentUser){
    if(curentUser == null)
        return [
                <option value={""}>{"-"}</option>,
                ...React.Children.toArray(users.map((user)=>(
                    <option value={user.id}>{user.id}</option>
                )))

        ];
    return [
        <option value={""}>{"-"}</option>,
        ...React.Children.toArray(users.map((user)=> {
            if(curentUser.id == user.id )
                return <option selected value={user.id}>{user.id}</option>
            return <option value={user.id}>{user.id}</option>
        }
            
        ))

    ];
}
async function deleteDevice(id,forceUpdate){
    await DeviceService.deleteDevice(id);
    forceUpdate();
}
async function updateDevice(device, forceUpdate){
    let val = $(`#row${device.id} select[name = "userId"]`).find(":selected").val();
    if(val === ""){
        device.user = null;
    }else{
        device.user ={ id:parseInt(val)};
    }
   
    await DeviceService.updateDevice(device);
    forceUpdate();

}
async function createDevice(event,forceUpdate){
    event.preventDefault();
    const  device = {id:0,measurements:[]};
    let user;
    let val = $(`#create-device-form select[name = "userId"]`).find(":selected").val();
    if(val === ""){
        user = null;
    }else{
        user = {id:parseInt(val)};
    }
    device.user = user;
    await DeviceService.updateDevice(device);
    forceUpdate();

}

function displayError(error){
    console.log(error);
    document.getElementById("error").innerText = error;
}

export default DeviceScreen;