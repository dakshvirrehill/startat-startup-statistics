package model;

public class Company {
String logo_path,email,name,field_of_interest,user_id,website,valuation,total_profits,total_expenses,verification,ownership_proof_path,description;
public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

int CId;
public int getCId() {
	return CId;
}

public void setCId(int cId) {
	CId = cId;
}

public String getLogo_path() {
	return logo_path;
}

public void setLogo_path(String logo_path) {
	this.logo_path = logo_path;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getField_of_interest() {
	return field_of_interest;
}

public void setField_of_interest(String field_of_interest) {
	this.field_of_interest = field_of_interest;
}

public String getUser_id() {
	return user_id;
}

public void setUser_id(String user_id) {
	this.user_id = user_id;
}

public String getWebsite() {
	return website;
}

public void setWebsite(String website) {
	this.website = website;
}

public String getValuation() {
	return valuation;
}

public void setValuation(String valuation) {
	this.valuation = valuation;
}

public String getTotal_profits() {
	return total_profits;
}

public void setTotal_profits(String total_profits) {
	this.total_profits = total_profits;
}

public String getTotal_expenses() {
	return total_expenses;
}

public void setTotal_expenses(String total_expenses) {
	this.total_expenses = total_expenses;
}

public String getVerification() {
	return verification;
}

public void setVerification(String verification) {
	this.verification = verification;
}

public String getOwnership_proof_path() {
	return ownership_proof_path;
}

public void setOwnership_proof_path(String ownership_proof_path) {
	this.ownership_proof_path = ownership_proof_path;
}

}
