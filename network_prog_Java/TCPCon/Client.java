import java.io.*;
import java.net.*;
import javax.swing.JOptionPane;

public class Client {

	public static void main(String args[]) throws Exception {
		
		Socket skt = new Socket("localhost", 6789);

        String mesg = JOptionPane.showInputDialog("Enter a new Client Message: ");
		ObjectOutputStream chanel = new ObjectOutputStream(skt.getOutputStream());
		chanel.writeObject(mesg);
		skt.close();		
	}	
}
