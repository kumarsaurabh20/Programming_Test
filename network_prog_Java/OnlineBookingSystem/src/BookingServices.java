import java.rmi.*;

public interface BookingServices extends Remote {
	
	String book() throws RemoteException;
	String View() throws RemoteException;
	String Cancel() throws RemoteException;
	void reset() throws RemoteException;
	
}
