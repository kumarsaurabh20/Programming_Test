import java.rmi.Remote;
import java.rmi.RemoteException;

public interface FileRemote extends Remote {

	public byte[] loadFile(String filename) throws RemoteException;
	
}
