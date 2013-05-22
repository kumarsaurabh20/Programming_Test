import java.sql.*;

public class CreateTrans {

	public static void main(String[] args) {
	
		try
		{
			String str = "INSERT INTO product(p_id, description,quantity, rate, unit_of_msr) VALUES(?,?,?,?,?)";
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test", "root", "rock1818");
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement(str);
			ps.setInt(1, 1008);
			ps.setString(2, "Nike shoes");
			ps.setString(3, "1");
			ps.setString(4, "65");
			ps.setString(5, "euros");
			
			int firstctr = ps.executeUpdate();
			System.out.println("First row inserted but not commited....");
			System.out.println(firstctr + " Rows updated by first insert!!");
			
			
			ps = con.prepareStatement(str);
			ps.setInt(1, 1009);
			ps.setString(2, "Nike Bandana");
			ps.setString(3, "2");
			ps.setString(4, "30");
			ps.setString(5, "euros");
			
			int secondctr = ps.executeUpdate();
			System.out.println("Second row updated but not commited...");
			System.out.println(secondctr + " Rows updated by second insert!!");
			
			con.commit();
			System.out.println("Transaction commited....Please check table data in the database...!!!");
			ps.close();
			con.close();
		}
		catch(Exception e) {System.out.println("Error: " + e);}
		
	}

}
