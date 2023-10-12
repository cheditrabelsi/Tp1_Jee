package model;

public class User {
private String login;
private String pass;
private String profile;
public String getLogin() {
	return login;
}
public void setLogin(String login) {
	this.login = login;
}

public String getProfile() {
	return profile;
}
public void setProfile(String profile) {
	this.profile = profile;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
public boolean verifier() {
	return this.login.equals("admin") && this.pass.equals("admin");
}
@Override
public String toString() {
	return "User [login=" + login + ", pass=" + pass + ", profile=" + profile + "]";
}

}
