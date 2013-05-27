import java.io.ObjectInputStream;
import java.net.ServerSocket;
import java.net.Socket;


//A simple A Transmission Control Protocol (TCP) based implementation of client server model


public class Server {

	public static void main(String args[]) throws Exception {
		
		ServerSocket welcomeSocket = new ServerSocket(6789);
		
		Socket connectionSocket;
		
		System.out.println("Server is waiting for client's request...");
	
		while(true) { 
		connectionSocket = welcomeSocket.accept();			
		ObjectInputStream chanel = new ObjectInputStream(connectionSocket.getInputStream());
		String message = (String)chanel.readObject();
		System.out.println(message);
		connectionSocket.close();
		}
		
	}	
}
