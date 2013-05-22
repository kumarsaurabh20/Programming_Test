import java.sql.*;

public class ExtractMetadata {

	public static void main(String[] args) {
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","rock1818");
			
			//Create a database metadata object
			DatabaseMetaData dbmd = con.getMetaData();
			
			String[] tabTypes = {"TABLE"};
			
			//Retrieve the names of database tables
			System.out.println("");
			System.out.println("Tables Names");
			System.out.println("--------------------------");
			
			ResultSet tablesRS = dbmd.getTables(null, null, null, tabTypes);
			//ResultSet tablesRS2 = dbmd.getTablePrivileges(catalog, schemaPattern, tableNamePattern);
			//ResultSet tablesRS3 = dbmd.getTableTypes();
			//ResultSet tablesRS4 = dbmd.getTypeInfo();
			//ResultSet tablesRS5 = dbmd.getTimeDateFunctions();
			
			while(tablesRS.next()) 			
				System.out.println(tablesRS.getString("TABLE_NAME"));
            con.close();
			
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}

	}

}
