import java.io.*;
import java.sql.*;
import java.util.*;

public class DataAccess {

	static final String PROPERTY_FILE = "database.properties";
	String drivername, url, user, password;
	
	public void accessDatabase() 
	{
		try
		{
			//Create and object of the Properties class and load properties
			
			Properties prop = new Properties();
			prop.load(new FileInputStream(PROPERTY_FILE));
			
			//Retrieve driver informations
			drivername = prop.getProperty("driver");
			url = prop.getProperty("url");
			user = prop.getProperty("username");
			password = prop.getProperty("password");
			
			//Initialize and load driver
			Class.forName(drivername);
			
			Connection con = DriverManager.getConnection(url, user, password);
			
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("Select * from users");
			
			//Iterate through the resultset to get the data
			
			while(rs.next()) 
			{
				System.out.println(rs.getString("id"));
				System.out.println(rs.getString("email"));
			}			
		}
		catch(SQLException se) {System.out.println("SQL Error: " + se);}
		catch(Exception e) {System.out.println("Error: " + e);}
	}
	
	
	public static void main(String[] args) {
	
       DataAccess da = new DataAccess();
       da.accessDatabase();
	}

}
