package model;

public class User {
String username,email,password,mobno,subscription;

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

public String getSubscription() {
	return subscription;
}

public void setSubscription(String subscription) {
	this.subscription = subscription;
}

public void setPassword(String password) {
	this.password = password;
}

}
