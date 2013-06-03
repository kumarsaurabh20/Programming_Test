import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

import javax.swing.*;

//import java.awt.event.*;
//import java.rmi.*;


public class ClientBooking extends JFrame {
	
	private static final long serialVersionUID = 1L;
	final static boolean shouldFill = true;
	final static boolean shouldWeightX = true;
	final static boolean RIGHT_TO_LEFT = false;
	
   Container con;
   //JFrame frame2;
   JPanel pane1, pane2, pane3;
   JLabel label1, label2, label3;
   JTextField text1, text2;
   JButton btn1, btn2, btn3, btn4;
   GridBagLayout gb;
   GridBagConstraints bgc, bgc1;
   GridLayout g, g2;
   
  public ClientBooking(String str) {
	  
	  super(str);
	  con = getContentPane();
	  
	  ((JComponent) con).setBorder(BorderFactory.createEmptyBorder(10,10,10,10));
	
	  if(RIGHT_TO_LEFT) {		  
		  pane1.setComponentOrientation(ComponentOrientation.RIGHT_TO_LEFT);
		  pane2.setComponentOrientation(ComponentOrientation.RIGHT_TO_LEFT);
		  pane3.setComponentOrientation(ComponentOrientation.RIGHT_TO_LEFT);
	  }
	  	
	  
	  g = new GridLayout(1,1);
	  gb = new GridBagLayout();
	  g2 = new GridLayout(1,1);
	  
	  
	  pane1 = new JPanel();
	  g.setHgap(5);
	  g.setVgap(5);
	  
	  pane1.setLayout(g);
	  label1 = new JLabel("Bozzollo's Online Booking System");
	  label1.setFont(new Font("Serif", Font.BOLD, 20));
	  pane1.add(label1);
	  
	  pane2 = new JPanel();
	  pane2.setLayout(gb);
	  bgc = new GridBagConstraints();
	  
	 if(shouldFill) {bgc.fill = GridBagConstraints.HORIZONTAL;}
	  
	  label2 = new JLabel("Name: ");
	  if(shouldWeightX) {bgc.weightx=1.0;}
	  bgc.fill = GridBagConstraints.HORIZONTAL;
	  bgc.gridx = 0;
	  bgc.gridy = 0;
	  bgc.insets = new Insets(20,5,5,5);
	  pane2.add(label2, bgc);
	  
	  text1 = new JTextField(10);
	  bgc.weightx=1.0;
	  bgc.fill = GridBagConstraints.HORIZONTAL;
	  bgc.gridx = 1;
	  bgc.gridy = 0;
	  bgc.insets = new Insets(20,5,5,5);
	  pane2.add(text1, bgc);
	  
	  btn1 = new JButton("Book");
	  bgc.weightx=1.0;
	  bgc.fill = GridBagConstraints.HORIZONTAL;
	  //bgc.gridwidth = 2;
	  bgc.gridx = 2;
	  bgc.gridy = 0;
	  bgc.insets = new Insets(20,5,5,5);
	  pane2.add(btn1, bgc);
	  
	  label3 = new JLabel("ID: ");
	  bgc.weightx=1.0;
	  bgc.fill = GridBagConstraints.HORIZONTAL;
	  bgc.gridx = 0;
	  bgc.gridy = 1;
	  bgc.insets = new Insets(5,5,20,5);
	  pane2.add(label3, bgc);
	  
	  text2 = new JTextField(5);
	  bgc.weightx=1.0;
	  bgc.fill = GridBagConstraints.HORIZONTAL;
	  bgc.gridx = 1;
	  bgc.gridy = 1;
	  bgc.insets = new Insets(5,5,20,5);
	  pane2.add(text2, bgc);
	  
	  btn2 = new JButton("View");
	  bgc.weightx=1.0;
	  bgc.fill = GridBagConstraints.HORIZONTAL;
	  bgc.gridx = 2;
	  bgc.gridy = 1;
	  bgc.insets = new Insets(5,5,20,5);
	  pane2.add(btn2, bgc);
	  
	  btn3 = new JButton("Delete");
	  bgc.weightx=1.0;
	  bgc.fill = GridBagConstraints.HORIZONTAL;
	  bgc.gridx = 3;
	  bgc.gridy = 1;
	  bgc.insets = new Insets(5,5,20,5);
	  pane2.add(btn3, bgc);
	  
	  
	  pane3 = new JPanel();
	  g2 = new GridLayout();
	  g2.setHgap(10);
	  g2.setVgap(10); 
	  pane3.setLayout(g2);
	  btn4 = new JButton("Reset Tickets");
	  pane3.add(btn4, g2);
	  
	  con.add(pane1, BorderLayout.NORTH);
	  con.add(pane2, BorderLayout.CENTER);
	  con.add(pane3, BorderLayout.SOUTH);
	  
	  setResizable(false);
	  
	  //frame2.getContentPane().add(new JPanel());
	  //frame2.getContentPane().add(new JPanel());
	  
	 
	  btn1.addActionListener(new ActionListener() { public void actionPerformed(ActionEvent e) {
				
		        JButton source = (JButton)e.getSource();
		        
		        JFrame frame2 = new JFrame();
		        frame2.add(new JPanel());
		        
		        MyDialogue output;
				BookingServices obj;
				String name = "BookingServices"; //the name in the RMI registry
				Registry registry;
				String clientName = text1.getText();		
				try
				{
					registry = LocateRegistry.getRegistry(); 					
					obj = (BookingServices)registry.lookup(name);					
					String result = obj.book(clientName);					
					if(result.equals("Failure")) {						
						output = new MyDialogue(frame2, "Data update failed. Try Again!!");
					} else {
						output = new MyDialogue(frame2, result);
					}
					output.setVisible(true);
				} 
				catch(Exception ae) {System.out.println("Error: " + ae);}}});
	  
	    btn2.addActionListener(new ActionListener() {
	    	public void actionPerformed(ActionEvent a) {
	    		JButton source = (JButton)a.getSource();
	    		JFrame frame3 = new JFrame();
	    		frame3.add(new JPanel());
	    		MyDialogue dial;
	    		BookingServices obj;
	    		String name = "BookingServices";
	    		Registry registry;
	    		String id = text2.getText();
	    		try
	    		{
	    			registry = LocateRegistry.getRegistry();
	    			obj = (BookingServices)registry.lookup(name);
	    			String result = obj.View(Integer.parseInt(id));
	    	        if(result.endsWith("is free!!")) {
	    	        	String output = "Ticket is free OR Unassociated!!";
	    	        	dial = new MyDialogue(frame3, output);
	    	        } else {
	    	        	String output = result + " is associated with ticket ID";
	    			    dial = new MyDialogue(frame3, output);
	    			    }
	    			dial.setVisible(true);
	    		}	
	    		catch(Exception e) {System.out.println("Error: " + e);}}});
	    
	    btn3.addActionListener(new ActionListener() {
	    		public void actionPerformed(ActionEvent e) {
	    			JButton jbtn = (JButton)e.getSource();
	    			JFrame frame4 = new JFrame();
	    			frame4.add(new JPanel());
	    			MyDialogue myDialog;
	    			BookingServices obj;
	    			String name = "BookingServices";
	    			Registry registry;
	    			String id = text2.getText();
	    			try
	    			{
	    				registry = LocateRegistry.getRegistry();
	    				obj = (BookingServices)registry.lookup(name);
	    				String result = obj.Cancel(Integer.parseInt(id));
	    				if(result.equals("0")) {
	    					String res = "Record successfully deleted";
	    					myDialog = new MyDialogue(frame4, res);	    					
	    				} else {
	    					String res = "Some error occurred!!";
	    					myDialog = new MyDialogue(frame4, res);	    					
	    				}
	    				myDialog.setVisible(true);	    				
	    			}
	    			catch(Exception i) {System.out.println("Error: " + i);}}});
	    
	    btn4.addActionListener(new ActionListener() {
    		public void actionPerformed(ActionEvent e) {
    			JButton jbtn = (JButton)e.getSource();
    			JFrame frame5 = new JFrame();
    			frame5.add(new JPanel());
    			MyDialogue myDial;
    			BookingServices obj;
    			String name = "BookingServices";
    			Registry registry;
    			String id = text2.getText();
    			try
    			{
    				registry = LocateRegistry.getRegistry();
    				obj = (BookingServices)registry.lookup(name);
    				obj.reset();
    				myDial = new MyDialogue(frame5, "New Tickets issued again!!");	    					
    				myDial.setVisible(true);	    				
    			}
    			catch(Exception q) {System.out.println("Error: " + q);}}});
	  
	 	  
  }
  
	public static void main(String args[]) {
		
		ClientBooking cb = new ClientBooking("Bozzollo");
		cb.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		cb.pack();
		cb.setVisible(true);
		
		try {
            //UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
            UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
        } catch (UnsupportedLookAndFeelException ex) {
            ex.printStackTrace();
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
        } catch (InstantiationException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        /* Turn off metal's use of bold fonts */
        UIManager.put("swing.boldMetal", Boolean.FALSE);
		
		
	}
	
	

}
