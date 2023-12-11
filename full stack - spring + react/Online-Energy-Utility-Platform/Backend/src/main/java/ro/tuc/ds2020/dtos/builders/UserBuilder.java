package ro.tuc.ds2020.dtos.builders;

import ro.tuc.ds2020.dtos.authentification.JwtUserResponse;
import ro.tuc.ds2020.dtos.authentification.NewUserDTO;
import ro.tuc.ds2020.dtos.UserDTO;
import ro.tuc.ds2020.entities.User;
import ro.tuc.ds2020.security.services.UserDetailsImpl;

public class UserBuilder {
    public UserBuilder() {
    }

    public static UserDTO toUserDTO(User user){
        return new UserDTO(user.getId(), user.getUsername(), user.getUserType());
    }
    public static User toUser(NewUserDTO newUserDTO){
        return new User(newUserDTO.getName(), newUserDTO.getPassword(),newUserDTO.getUserType());

    }
    public static User toUser(UserDetailsImpl newUserDTO){
        return new User(newUserDTO.getId(),newUserDTO.getUsername(), newUserDTO.getPassword(),newUserDTO.getUserType());
    }

    public static User toUser(UserDTO user){
        return new User(user.getId(),user.getUsername(),user.getType());

    }
    public static void updateUser(User user,UserDTO userDTO){
        user.setUserType(userDTO.getType());
        user.setUsername((userDTO.getUsername()));

    }
    public static JwtUserResponse toUserJwtResponse(UserDetailsImpl userDetails,String jwt){
        return new JwtUserResponse(jwt,userDetails.getId(),userDetails.getUsername(),userDetails.getUserType());
    }

}
