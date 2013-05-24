import java.rmi.Remote;
import java.rmi.RemoteException;

public interface AuthorServer extends Remote {

String insertDetails(int p_id, String description, String quantity, String rate, String unit_of_msr) throws RemoteException;
	
}
