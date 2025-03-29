package com.registration;

public class User {
    private int user_id;
    private String name;
    private String username;
    private String email;
    private String password;
    private String user_role;
	public User(int user_id, String name, String username, String email, String password, String user_role) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.username = username;
		this.email = email;
		this.password = password;
		this.user_role = user_role;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
    
    
    

}