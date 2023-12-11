package ro.tuc.ds2020.dtos.authentification;

import ro.tuc.ds2020.entities.UserType;

public class JwtUserResponse {
    private String jwt;
    private Long Id;
    private String username;

    private UserType userType;

    public JwtUserResponse(String jwt, Long id, String username, UserType userType) {
        this.jwt = jwt;
        Id = id;
        this.username = username;
        this.userType = userType;
    }



    public String getJwt() {
        return jwt;
    }

    public void setJwt(String jwt) {
        this.jwt = jwt;
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }


}
