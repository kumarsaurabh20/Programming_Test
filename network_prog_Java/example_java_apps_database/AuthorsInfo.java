import java.sql.*;

public class AuthorsInfo {

	public static void main(String[] args) throws SQLException {
		
		try
		{
		String str="SELECT * FROM users";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","","");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(str);
		System.out.println("User ID\tname\tEmail\tCreate Date\tUpdate Date");
		
		while(rs.next()) 
		{
			String id = rs.getString("id");
			String name = rs.getString("name");
			String email = rs.getString("email");
			String cdate = rs.getString("created_at");
			String udate = rs.getString("updated_at");
			
			System.out.println(id + "\t");
			System.out.println(name + "\t");
			if(email.length() <= 7) {System.out.println(email + "\t\t");}
			else {System.out.println(email + "\t");}
			System.out.println(cdate + "\t");
			System.out.println(udate + "\t");
		}
		con.close();
		}
		catch(SQLException e) {System.out.println("SQL Error Occurred..");
		System.out.println("SQL Error" + e);
		}
		catch(Exception e) {System.out.println("Error Occurred..");
		System.out.println("Error" + e);
		}
	}

}
