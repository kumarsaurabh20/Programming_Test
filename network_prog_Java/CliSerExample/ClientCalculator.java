import java.io.*;
import java.net.*;
import javax.swing.*;

public class ClientCalculator {

	public static void main(String[] args) throws Exception {
	
		Socket skt = new Socket("localhost",6789);
		
		ObjectOutputStream chanelOutput = new ObjectOutputStream(skt.getOutputStream());
		ObjectInputStream chanelInput = new ObjectInputStream(skt.getInputStream());
		
		String operand1 = JOptionPane.showInputDialog("1st Operand");
		String operand2 = JOptionPane.showInputDialog("2nd Operand");
		
		Operation op1 = new Operation("add", Double.parseDouble(operand1), Double.parseDouble(operand2));
		chanelOutput.writeObject(op1);

		Double result = (Double)chanelInput.readObject();
		System.out.println("The result is : " + result);
		
		skt.close();
		
	}

}
