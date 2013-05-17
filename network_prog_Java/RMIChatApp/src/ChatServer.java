//import java.net.*;
import java.rmi.*;
//import java.io.*;
import java.util.*;
//import java.rmi.server.*;
import java.rmi.registry.LocateRegistry;


public class ChatServer implements Remote, ServerRemote {
	
	private static ChatServer rmi;
	ClientRemote cr;
	Vector v = new Vector();
	
	public static void main(String args[]) {
		
		String name = "ServerRemote";
		
		rmi = new ChatServer();
		rebindChatServer(name, (Remote)rmi);
		System.out.println("Binding has completed...");
		System.out.println("Server is waiting for client request...");
				
	}
		
	protected static void rebindChatServer(String name, Remote obj) {
		
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
				
				System.err.println("failed to create/get registry "  + ree);
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
	
	
	//Define the registerClient() method
	public int registerClient(ClientRemote cr) throws RemoteException {
		
		int i = 0;
		System.out.println("Client is requesting a connection....");
		v.addElement(cr);
		i = v.indexOf(cr);
		System.out.println("Timer has started: " + v.size());
		return i;		
		
	}
	
	//Define the removeClient() Method
	public void removeClient(int i) throws RemoteException {
		
		v.removeElementAt(i);
		
	}

	//Define the showText() Method
	public void showText(String str) throws RemoteException {
		
		System.out.println(str);
		
		for(int i=0;i<v.size();i++) {
			
			ClientRemote cr1 = (ClientRemote)v.elementAt(i);
			if(cr1 != null) {cr1.getString(str);}			
		}
				
	}
	
	
	

}


