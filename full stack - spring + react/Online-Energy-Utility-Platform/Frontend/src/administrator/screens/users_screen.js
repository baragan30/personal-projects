import React, { useEffect, useState } from "react";
import UserService from "../../services/user_service";
import $ from 'jquery';

function UsersScreen(){
    const [users,setUsers] = useState([]);
    const [refresh,setRefresh] = useState(0);
    const forceUpdate = () => setRefresh(refresh+1);
    useEffect( ()=>{
        async function fetchData(){
            setUsers(await UserService.getAll());
        }
        fetchData();
        
    },[refresh]);

    return (
        <div>
            <div className="card card-body">
                <table className="table table-striped table-dark text-center">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Username</th>
                            <th scope="col">User Type</th>
                            <th scope="col">Update Button</th>
                            <th scope="col">Delete Button</th>
                        </tr>
                    </thead>
                    <tbody>
                        {
                            React.Children.toArray(users.map((user)=> 
                                (<tr id= {`row${user.id}`}>
                                    <td name='id'>{user.id}</td>
                                    <td name='username' contentEditable suppressContentEditableWarning>{user.username}</td>

                                    <td><select name="userType" id="type" defaultValue={user.type}>
                                            <option value="ADMINISTRATOR">Administrator</option>
                                            <option value="CLIENT">Client</option>
                                        </select>
                                    </td>
                                    <td><button onClick={()=>updateUser(user,forceUpdate)}>Update</button></td>
                                    <td><button onClick={()=>deleteUser(user.id,forceUpdate)}>Delete</button></td>
                                </tr>
                            )))
                        
                        }
                    </tbody>
                    
                </table>

            </div>
        </div>             
                           

    );
}
function getUser(){

}

async function deleteUser(id,forceUpdate){
    await UserService.delete(id);
    forceUpdate();


}
async function updateUser(user,forceUpdate){
   
    user.username = $(`#row${user.id} td[name = "username"]`).text()
    user.type = $(`#row${user.id} select[name = "userType"]`).find(":selected").val();
    await UserService.update(user);
    forceUpdate();

}


export default UsersScreen;