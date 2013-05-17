import java.io.*;
import java.rmi.*;
import java.rmi.server.UnicastRemoteObject;


public class FileRemoteImpl extends UnicastRemoteObject implements FileRemote {
	

	private static final long serialVersionUID = 1L;
	
	public FileRemoteImpl() throws RemoteException {
		super();
	}
	
	public byte[] loadFile(String filename) {
		
		try
		{
			File file = new File(filename);
			
			byte bufferFile[] = new byte[(int)file.length()];
			BufferedInputStream inputFile = new BufferedInputStream(new FileInputStream(filename));
			inputFile.read(bufferFile,0,bufferFile.length);
			inputFile.close();
			
			return(bufferFile);			
		}
		catch(Exception e) {System.out.println("Error: " + e);}
		return(null);
	}
	
	
	

}
