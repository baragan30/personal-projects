package com.example.foodpanda.model.auth;

public class JwtClientResponse {
    private String jwt;
    private Long Id;
    private String username;

    public JwtClientResponse(String jwt, Long id, String username) {
        this.jwt = jwt;
        Id = id;
        this.username = username;
    }
    @Override
    public String toString() {
        return "JwtClientResponse{" +
                "jwt='" + jwt + '\n' +
                ", Id=" + Id +
                ", username='" + username + '\'' +
                '}';
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
}
