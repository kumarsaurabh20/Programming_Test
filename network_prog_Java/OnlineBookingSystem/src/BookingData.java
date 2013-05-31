import java.rmi.*;

public interface BookingData extends Remote {

	
	boolean add(ticket t) throws RemoteException;
	
	
	
}
