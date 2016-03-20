package model;

public class User {
String username,email,password,mobno,name,profile_pic_path,status;

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public String getProfile_pic_path() {
	return profile_pic_path;
}

public void setProfile_pic_path(String profile_pic_path) {
	this.profile_pic_path = profile_pic_path;
}

public String getPassword() {
	return password;
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

public String getMobno() {
	return mobno;
}

public void setMobno(String mobno) {
	this.mobno = mobno;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public void setPassword(String password) {
	this.password = password;
}

}
