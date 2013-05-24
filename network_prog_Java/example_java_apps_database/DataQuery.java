import java.sql.*;

public class DataQuery {


	public void excecuteQuery() {
	
		try
		{
		String str = "SELECT * FROM product";
		Connect.connectDB();
		ResultSet rs = Connect.processQuery(str);
		while(rs.next()) 
		{
			System.out.println(rs.getString("p_id") + " " + rs.getString("description") + " " + rs.getString("quantity") + " " + rs.getString("rate"));
		}
	    }
	    catch(Exception e) {System.out.println("Error: " + e);}
		
  }	
	
	public void executeDMLQuery() 
	{
		String str = "INSERT INTO product(p_id,description,quantity,rate,unit_of_msr) VALUES(1016,'MacBook Pro','2','2000','euros')";
		Connect.connectDB();
		int i = Connect.processDML(str);
		System.out.println("Number of rows affected: " + i);	
	}
	
	public static void main(String[] args) {
	
			DataQuery dq = new DataQuery();
            dq.excecuteQuery();
            dq.executeDMLQuery();
            dq.excecuteQuery();
}

}
