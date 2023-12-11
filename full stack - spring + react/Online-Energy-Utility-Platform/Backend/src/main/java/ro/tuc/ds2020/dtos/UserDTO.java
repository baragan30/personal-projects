package ro.tuc.ds2020.dtos;

import ro.tuc.ds2020.entities.UserType;

public class UserDTO  {
    private Long id;

    private String username;

    private UserType type;

    public UserDTO(Long id, String username, UserType type) {
        this.id = id;
        this.username = username;
        this.type = type;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public UserType getType() {
        return type;
    }

    public void setType(UserType type) {
        this.type = type;
    }
}
