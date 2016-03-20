package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
static Connection con=null;

static void Connect()
{
	try
	{
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://loclhost:0336/startat", "TeamStartat", "star123tat");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}


static
{
	Connect();
}

static Connection getConnection()
{
	return con;
}


}
