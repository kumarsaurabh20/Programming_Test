/*Creating a single database access object. 
 * Just include this class in your java database application 
 * and shoot query as available in DataQuery class.
 * Create a database.properties file and add:
 * driver=com.mysql.jdbc.Driver 
 * url=jdbc:mysql://127.0.0.1/test 
 * username=root 
 * password=****** */

import java.sql.*;
import java.io.*;
import java.util.*;

public class Connect {

	
	static final String PROPERTY_FILE = "database.properties";
	static String driver, url, user, password;
	static Connection con;
	static ResultSet rs;
	static int count;
	
	public static void connectDB() 
	{
		try
		{
			//create the Properties object and load the database.properties file
			Properties prop = new Properties();
			prop.load(new FileInputStream(PROPERTY_FILE));
			
			driver = prop.getProperty("driver");
			url = prop.getProperty("url");
			user = prop.getProperty("username");
			password = prop.getProperty("password");
			
			//load the driver and create connection
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, user, password);
		}
		catch(SQLException se) {System.out.println("SQL Error: " + se);}
		catch(Exception e) {System.out.println("Error: " + e);}
	}
	
	//This method takes a string containing an SQL query statement. Execute the SQL query and returns ResultSet
	public static ResultSet processQuery(String strSQL) 
	{
		try
		{
			//create statement object
			Statement stmt = con.createStatement();
			//send data request to the database and process the query
			rs = stmt.executeQuery(strSQL);
			return rs;			
		}
		catch(Exception e) 
		{
			System.out.println("Error occured in execution of the query");
		    System.out.println("Error: " + e);
		    return null;
		}
	}
	
	/*This method takes and input parameter of the string containing DML SQL statement. 
	  The method executes the DML commands and returns an int value that specifies the 
	  number of row affected.*/
	public static int processDML(String strSQL) 
	{
		try
		{
		   //Create a statement object to process the INSERT?DELETE?UPDATE statement
			Statement stmt = con.createStatement();
			count = stmt.executeUpdate(strSQL);
			return count;
		}
		catch(Exception e) 
		{
			System.out.println("Error occured in execution of the DML query");
		    System.out.println("Error: " + e);
		    return 0;
		}
	}
	
	
	
	
	
}
