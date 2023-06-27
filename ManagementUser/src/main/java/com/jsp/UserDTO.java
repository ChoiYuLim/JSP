package com.jsp;

public class UserDTO {
    private String name = null;
    private String id;
    private String pw = null;
    private String phone = null;
    private String email = null;
    private String status = null;
    private String role = null;

    public UserDTO(String name, String id, String pw, String phone, String email, String status,
            String role) {
        this.name = name;
        this.id = id;
        this.pw = pw;
        this.phone = phone;
        this.email = email;
        this.status = status;
        this.role = role;
    }

    public UserDTO(String name, String id, String pw, String phone, String email) {
        this.name = name;
        this.id = id;
        this.pw = pw;
        this.phone = phone;
        this.email = email;
    }

    public UserDTO(String id, String pw) {
        this.id = id;
        this.pw = pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
