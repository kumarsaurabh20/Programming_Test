//import java.rmi.registry.LocateRegistry;
//import java.rmi.registry.Registry;
import javax.swing.*;

import java.awt.*;
//import java.awt.event.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class AuthorClient {
	
	JFrame frame;
	JFrame frame2;
	JPanel panel;
	JPanel panel1;
	
	JLabel labelProductID;
	JLabel labelDescription;
	JLabel labelQuantity;
	JLabel labelRate;
	JLabel labelUnitOfMsr;
	
	JTextField textProductID;
	JTextField textDescription;
	JTextField textQuantity;
	JTextField textRate;
	JTextField textUnitOfMsr;
	
	JButton submit;
	
	public AuthorClient() {
		
		frame = new JFrame("Kumar's Publishing Hosue");
		frame2 = new JFrame("Result");
		panel = new JPanel();
		panel1 = new JPanel();
		
		panel.setLayout(new GridLayout(8,2));
		panel1.setLayout(new GridLayout(1,1));
		
		frame.setVisible(true);
		frame.setSize(300,250);
		frame.getContentPane().setLayout(new BorderLayout());
		
		labelProductID = new JLabel("Product ID");
		labelDescription = new JLabel("Description");
		labelQuantity = new JLabel("Quantity");
		labelRate = new JLabel("Rate");
		labelUnitOfMsr = new JLabel("Unit of Measurement");
		
		
		textProductID = new JTextField(5);
		textDescription = new JTextField(15);
		textQuantity = new JTextField(15);
		textRate = new JTextField(10);
		textUnitOfMsr = new JTextField(50);
		
		submit = new JButton("Submit");
		
		panel.add(labelProductID);
		panel.add(textProductID);
		panel.add(labelDescription);
		panel.add(textDescription);
		panel.add(labelQuantity);
		panel.add(textQuantity);
		panel.add(labelRate);
		panel.add(textRate);
		panel.add(labelUnitOfMsr);
		panel.add(textUnitOfMsr);
		
		panel1.add(submit);
		
		ButtonListener blisten = new ButtonListener();
		submit.addActionListener(blisten);
		
		frame2.getContentPane().add(new JPanel(), BorderLayout.WEST);
		frame2.getContentPane().add(new JPanel(), BorderLayout.EAST);
		
		frame.getContentPane().add(panel, BorderLayout.CENTER);
		frame.getContentPane().add(panel1, BorderLayout.SOUTH);
				
	}
	
	class ButtonListener implements ActionListener {

		public void actionPerformed(ActionEvent ae) 
		{
			int p_id;
			String description;
			String quantity;
			String rate;
			String unit_of_msr;
			
			JButton source = (JButton)ae.getSource();
			MyDialog myDialog;
			AuthorServer auth;
			String name = "AuthorServer";
			Registry registry;
			
			try
			{
				registry = LocateRegistry.getRegistry();
				auth = (AuthorServer)registry.lookup(name);
				
				p_id = Integer.parseInt(textProductID.getText());
				description = textDescription.getText();
				quantity = textQuantity.getText();
				rate = textRate.getText();
				unit_of_msr = textUnitOfMsr.getText();
				
				
				String str = auth.insertDetails(p_id, description, quantity, rate, unit_of_msr);
				System.out.println(str);
				 
				if(str.equals("Success")) 
				{
					myDialog = new MyDialog( frame2, "Inserted Successfully");
				} else {
					
					myDialog = new MyDialog(frame2, "No Record Inserted");	
				}
				
				myDialog.setVisible(true);			
			}
			catch(Exception e) {System.out.println("Error form ButtonListener: " + e);}
		}
		
		
	}

     public static void main(String[] args) {
		
               new AuthorClient();
	
     }
	
}
