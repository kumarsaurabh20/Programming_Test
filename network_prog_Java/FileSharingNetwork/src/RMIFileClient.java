import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.io.*;

public class RMIFileClient {
	
	public static void main(String args[]) {
		
		if(args.length != 1) 
		{
			System.out.println("Error you must pass the <file-name> !!!!!");
			System.exit(0);
		}
		
		FileRemote f;
		String name = "FileRemote";
		Registry registry;
		
		
		
		try
		{
			registry = LocateRegistry.getRegistry();
			f = (FileRemote)registry.lookup(name);
			byte[] data = f.loadFile(args[0]);
			File file = new File(args[0]);
			BufferedOutputStream outputFile = new BufferedOutputStream(new FileOutputStream(file.getName()));
			outputFile.write(data,0,data.length);
			outputFile.flush();
			outputFile.close();
			System.out.println("Your specified file is downloaded from the server....Njoy!!");			
		}
		catch(Exception e) {System.out.println("Error: " + e);}
		
	}

}
