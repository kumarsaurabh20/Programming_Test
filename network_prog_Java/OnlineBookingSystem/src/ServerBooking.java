import java.rmi.*;
import java.rmi.registry.LocateRegistry;


public class ServerBooking {
	
	
	public static void main(String args[]) {
		
		String name = "BookingServices";
		
		try {
			BookServiceImpl bk = new BookServiceImpl();
			
			rebindServer(name, (Remote)bk);
			
			System.out.println("Remote object bound to registry. Server is waiting for client request..");
			
		} catch (RemoteException e) {
			e.printStackTrace();
		}
				
	}
	
	protected static void rebindServer(String name, Remote obj) {
		
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
				System.out.println("Failed to get/create registry: " + ree);
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
