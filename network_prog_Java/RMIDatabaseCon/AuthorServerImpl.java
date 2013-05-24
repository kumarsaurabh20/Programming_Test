import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.rmi.registry.LocateRegistry;
import java.rmi.Naming;
import java.rmi.Remote;
import java.sql.*;
import java.util.*;
import java.io.*;

public class AuthorServerImpl extends UnicastRemoteObject implements AuthorServer {

	private static final long serialVersionUID = 1L;

	static ResultSet results;
	static Connection con;
	static PreparedStatement stat;
	static String PROPERTY_FILE = "database.properties";
	static String driver, url, user, passwd;
	
	public AuthorServerImpl() throws RemoteException {
		
		super();
	}
	
	public String insertDetails(int p_id, String description, String quantity, String rate, String unit_of_msr) throws RemoteException {
		
		int rowsAffected = 0;
		String sReturn = "fail";
		String str = "INSERT INTO product(p_id,description,quantity,rate,unit_of_msr) VALUES(?,?,?,?,?)";
	
		try
		{
			Properties prop = new Properties();
			prop.load(new FileInputStream(PROPERTY_FILE));
			driver = prop.getProperty("driver");
			url = prop.getProperty("url");
			user = prop.getProperty("username");
			passwd = prop.getProperty("password");
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, passwd);
			stat = con.prepareStatement(str);
			stat.setInt(1, p_id);
			stat.setString(2, description);
			stat.setString(3, quantity);
			stat.setString(4, rate);
			stat.setString(5, unit_of_msr);
			
			rowsAffected = stat.executeUpdate();
			if(rowsAffected > 0) {sReturn = "Success";}
			
		}
		catch(Exception e) {System.out.println("Error: " + e);}
				
	    return sReturn;
	
	}
	
protected static void rebindAuthorServer(String name, Remote obj) {
		
		try
		{
			LocateRegistry.createRegistry(1099);
		}
		catch(RemoteException re) {
			
			try
			{
				LocateRegistry.getRegistry();
			}
			catch(RemoteException ree) {
				
				System.err.println("failed in creating/getting registry " + ree);
				System.exit(-1);
			}
		}
		
		try
		{
			Naming.rebind(name, obj);
		}
		catch(Exception e) {e.printStackTrace();
		                    System.exit(-1);
		}
		
		
	}
		
	public static void main(String args[]) throws Exception {
		
		try
		{
		String name = "AuthorServer";
		
		AuthorServerImpl asi = new AuthorServerImpl();
		
		rebindAuthorServer(name, (Remote)asi);
		
		System.out.println("Remote object created and bound. Now waiting for client request....");
		}
		catch(Exception e) {System.out.println("Error form the main: " + e);}
	}
	
}
