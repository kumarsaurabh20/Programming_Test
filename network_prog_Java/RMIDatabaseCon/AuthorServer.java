import java.rmi.Remote;
import java.rmi.RemoteException;

//interface defining inserDetails() method

public interface AuthorServer extends Remote {

String insertDetails(int p_id, String description, String quantity, String rate, String unit_of_msr) throws RemoteException;
	
}
