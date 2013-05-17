//import java.io.*;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.Naming;
import java.rmi.Remote;


public class RMIFileServer {

	public static void main(String args[]) throws Exception {
		
		String name = "FileRemote";
		
		FileRemoteImpl fri = new FileRemoteImpl();
		
		rebindFileServer(name, (Remote)fri);
		
		System.out.println("Remote object created and bound. Now waiting for client request....");
		
	}
	
	protected static void rebindFileServer(String name, Remote obj) {
		
		try
		{
			LocateRegistry.createRegistry(1099);
		}
		catch(RemoteException e) {
			
			try
			{
				LocateRegistry.getRegistry();
			}
			catch(RemoteException ree) {
				
				System.err.println("failed in creating or getting registry " + ree);
				System.exit(-1);
			}
		}
		
		try
		{
			Naming.rebind(name, obj);
		}
		catch(Exception e) {e.printStackTrace();
		                    System.exit(-1);}
		
	}
	
	
}
