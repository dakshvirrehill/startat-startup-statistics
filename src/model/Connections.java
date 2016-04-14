package model;
import java.util.Vector;
public class Connections {
Vector<Investor> investor;
public Vector<Investor> getInvestor() {
	return investor;
}
public void setInvestor(Vector<Investor> investor) {
	this.investor = investor;
}
public Vector<Startup> getStartup() {
	return startup;
}
public void setStartup(Vector<Startup> startup) {
	this.startup = startup;
}
Vector<Startup> startup;
}
