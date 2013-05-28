import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class ServerCalculator {

	public static void main(String[] args) throws Exception {
	
		ServerSocket serverSkt = new ServerSocket(6789);
		Socket connectionSocket;
		Calculator cal = new Calculator();
		
		while(true) {
			connectionSocket = serverSkt.accept();
			ObjectInputStream objin = new ObjectInputStream(connectionSocket.getInputStream());
			ObjectOutputStream objout = new ObjectOutputStream(connectionSocket.getOutputStream());
			
			System.out.println("Server is waiting for the operand to perform operation...");
			
			Operation op = (Operation)objin.readObject();
			Double result = cal.evaluateOperation(op);
			
			System.out.println(op);
			objout.writeObject(result);
			connectionSocket.close();			
		}
	}
	
}
