import java.sql.*;

public class ColumnInfo {

	/*application to determine the total number of columns and the datatype 
	  of the column of a given table. The table name has to be specified in the run time.*/
	
	public static void main(String[] args) {
		
		try
		{
			String str = "SELECT * FROM " + args[0] + "";
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/microaquadt","root","rock1818");
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(str);
			
			//create result set metadata
            ResultSetMetaData rsmd = rs.getMetaData();
            
            rs.next();
            
            //Retrieve the number of columns in the resultset
            
            System.out.println("Number of attributes in Microaqua database: " + rsmd.getColumnCount());
            System.out.println("");
            System.out.println("=========================================");
            System.out.println("Attributes of the "+ args[0] + " Table");
            System.out.println("=========================================");
            
            //Retrieve and display the names and datatypes of various columns in the ResultSet
            
            for(int i=1;i<rsmd.getColumnCount();i++) 
            {
            	System.out.println(rsmd.getColumnName(i) + ":" + rsmd.getColumnTypeName(i));
            }
            
            rs.close();
            stmt.close();
            			
		}
		catch(Exception e ) {e.printStackTrace();}

	}

}
