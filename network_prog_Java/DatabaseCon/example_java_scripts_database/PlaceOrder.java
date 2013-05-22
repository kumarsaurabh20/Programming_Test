import java.sql.*;

public class PlaceOrder {

	public static void main(String[] args) {
	
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","rock1818");
			Statement stmt = con.createStatement();
			con.setAutoCommit(false);
			stmt.addBatch("INSERT INTO product(p_id, description,quantity, rate, unit_of_msr) VALUES(1010,'ducati','1','18000','euros')");
			stmt.addBatch("INSERT INTO product(p_id, description,quantity, rate, unit_of_msr) VALUES(1011,'Kawasaki ninja','1','7000','euros')");
			stmt.addBatch("INSERT INTO product(p_id, description,quantity, rate, unit_of_msr) VALUES(1012,'Honda','1','10000','euros')");
			
			int[] results = stmt.executeBatch();
			System.out.println("");
			System.out.println("Using Statement object");
			System.out.println("---------------------------");
			
			for(int i=0;i<results.length;i++) 
			{
				System.out.println("Rows affected by " + (i + 1)  + " INSERT statement: " + results[i] );
			}
			
			stmt.close();
			
		   String str = "INSERT INTO product(p_id, description,quantity, rate, unit_of_msr) VALUES(?,?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(str);
			
			System.out.println("");
			System.out.println("Using PreparedStatement object");
			System.out.println("---------------------------");
			
			ps.setInt(1, 1013);
			ps.setString(2, "BMW z4");
			ps.setString(3, "1");
			ps.setString(4, "3500,000");
			ps.setString(5, "Rupees");
			
			ps.addBatch();
			
			ps.setInt(1, 1014);
			ps.setString(2, "BMW SUV");
			ps.setString(3, "1");
			ps.setString(4, "5500,000");
			ps.setString(5, "Rupees");
			
			ps.addBatch();
			
			int[] numUpdates = ps.executeBatch();
			
			for(int i=0;i<numUpdates.length;i++) 
			{
				System.out.println("Rows affected by " + (i + 1) + " INSERT statement: " + numUpdates[i]);
			}
			
			con.commit();
			con.close();						
		} 
		catch (BatchUpdateException bue) {bue.printStackTrace();} 
		catch(SQLException sqe) {sqe.printStackTrace();}
		catch(Exception e) {e.printStackTrace();}
		

	}

}
