import java.rmi.*;

public interface BookingServices extends Remote {
	
	String book(String name) throws RemoteException;
	String View(int i) throws RemoteException;
	String Cancel(int i) throws RemoteException;
	void reset() throws RemoteException;
	
	
	//boolean add(Object t) throws RemoteException;
	//Object remove(int index) throws RemoteException;
	//Object get(int index) throws RemoteException;
	
	//boolean removeAll() throws RemoteException;
	
}
