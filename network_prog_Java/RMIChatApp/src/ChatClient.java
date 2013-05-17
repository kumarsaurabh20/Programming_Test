import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class ChatClient extends JFrame implements ActionListener {
	
	private static final long serialVersionUID = 1L;
	JTextField str;
	JButton send;
	JTextArea area;
	JScrollPane scroll;
	JLabel label1, label2, label3;
	GridBagLayout gb1;
	GridBagConstraints gbc;
	ServerRemote ser;
	private static String name;
	int i=0;
	
	//Define the chat client constructor
	
	public ChatClient() {
		
		setSize(350,300);
		
		gb1 = new GridBagLayout();
		gbc = new GridBagConstraints();
		
		getContentPane().setLayout(gb1);
		
		gbc.gridx = 1;
		gbc.gridy = 1;
		
		label1 = new JLabel("CHAT ROOM");
		label1.setFont(new Font("Ariel", Font.BOLD, 20));
		getContentPane().add(label1,gbc);
		
		gbc.gridx = 1;
		gbc.gridy = 2;
		label2 = new JLabel("Message Display Area");
		getContentPane().add(label2,gbc);
		
		gbc.gridx = 1;
		gbc.gridy = 3;
		area = new JTextArea(10,30);
		scroll = new JScrollPane(area);
		getContentPane().add(scroll,gbc);
		
		gbc.gridx = 1;
		gbc.gridy = 4;
		label3 = new JLabel("Enter Message");
		getContentPane().add(label3,gbc);
		
		str = new JTextField(30);
		gbc.gridx = 1;
		gbc.gridy = 5;
		getContentPane().add(str,gbc);
		
		send = new JButton("Send");
		gbc.gridx = 1;
		gbc.gridy = 6;
		getContentPane().add(send,gbc);
		
		send.addActionListener((ActionListener) this);
		
		addWindowListener(new WindowAdapter() {
			
			public void windowClosing(WindowEvent we) {
				
				try
				{
					ser.removeClient(i);
				}
				catch(Exception e) {System.out.println("Error: " + e);}
				System.exit(0);
				
			}
			
		});
		
		try
		{
			Registry registry = LocateRegistry.getRegistry();
			ser = (ServerRemote)registry.lookup("ServerRemote");
		}
		catch(Exception e) {e.printStackTrace();}

		try
		{
			i = ser.registerClient((ClientRemote) this);
		}
		catch(Exception e) {e.printStackTrace();}
		
	}
	
     public void actionPerformed(ActionEvent ae) 
     {
    	 
    	 try
    	 {
    		ser.showText(name + ":" + str.getText()); 
    	 }
    	 catch(Exception e) {e.printStackTrace();}
    	 
    	 
     }
     
     public void getString(String str) throws RemoteException 
     {
    	area.append(str + "\n"); 
     }
	
      public static void main(String args[]) 
      {
    	  name = args[0];
    	  ChatClient cc = new ChatClient();
    	  cc.setVisible(true);
    	  cc.setTitle(name);
      }
     
     
	

}
