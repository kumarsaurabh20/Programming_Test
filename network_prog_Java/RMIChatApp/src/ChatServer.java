//import java.net.*;
//import java.net.MalformedURLException;
import java.rmi.*;
//import java.io.*;
import java.util.*;
//import java.rmi.server.*;
import java.rmi.registry.LocateRegistry;
import java.rmi.server.UnicastRemoteObject;
//import java.io.Serializable;


public class ChatServer extends UnicastRemoteObject implements ServerRemote {
	

	//private static final long serialVersionUID = 1L;
		private static ServerRemote sr;
		ClientRemote cr;
		Vector<ClientRemote> v;
	    private static final long serialVersionUID = 1L;



	protected ChatServer() throws RemoteException {
		super();
		v = new Vector<ClientRemote>();
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
			
			ClientRemote cr = (ClientRemote)v.elementAt(i);
			if(cr != null) {cr.getString(str);}	
			else {System.out.println("Client is not registered!!");}
		}
				
	}

	public static void main(String args[]) {
		
		String name = "ServerRemote";
		System.setSecurityManager(new RMISecurityManager());	
		try
		{
			sr = new ChatServer();
			System.out.println("Registry is created..");
			//Export the server object
			//UnicastRemoteObject.exportObject((ServerRemote)sr, 1099);
			//Bind the server object
			//Naming.rebind(name, (ServerRemote)sr);
		    rebindChatServer(name, (Remote)sr);
	  	    System.out.println("Binding has completed...");
		    System.out.println("Server is waiting for client request...");
		}
		catch (java.rmi.UnknownHostException uhe) {uhe.printStackTrace();}
		catch (RemoteException e) {e.printStackTrace();}
		//catch (MalformedURLException murle) {murle.printStackTrace();}
	}
		
		
	
	

}


