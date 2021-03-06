import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class ProductInfo extends JFrame implements ActionListener 
{
	private static final long serialVersionUID = 1L;
	JLabel heading, id, desc, rate, quantity, unit_of_msr, single_label, error;
	JTextField idField, descField, rateField, quantityField, unit_of_msrField;
	JButton insert, update, delete, clear, exit;
	JComboBox idCombo;
	Connection con;
	PreparedStatement stat;
	Statement stmt;
	ResultSet rs;
	JPanel panel1;
	JPanel panel2;
	JPanel panel3;
	JPanel panel4;
	Container cont;
	GridLayout head;
	GridLayout headID;
	GridLayout center;
	GridLayout bottom;
	
	public ProductInfo(String s)
	{
		super(s);
		
		heading = new JLabel("Product Information");
		heading.setFont(new Font("Ariel", Font.BOLD, 40));
		
		
		id = new JLabel("ID");
		desc = new JLabel("Description");
		rate = new JLabel("Rate");
		quantity = new JLabel("Quantity");
		unit_of_msr = new JLabel("Unit of Measurement");
		//single_label = new JLabel("Product Information");
		error = new JLabel();
		
		idField = new JTextField(10);
		descField = new JTextField(10);
		quantityField = new JTextField(10);
		rateField = new JTextField(10);
		unit_of_msrField = new JTextField(10);
		
		idCombo = new JComboBox();
		
		insert = new JButton("Insert");
		update = new JButton("Update");
		delete = new JButton("Delete");
		clear = new JButton("Clear");
		exit = new JButton("exit");
		
		//panel1 = new JPanel();
		panel2 = new JPanel();
		panel3 = new JPanel();
		panel4 = new JPanel();
		
		cont = getContentPane();
		
	    ((JComponent)cont).setBorder(BorderFactory.createEmptyBorder(20,20,20,20));
		
		//head = new GridLayout(1,1);
		headID = new GridLayout(1,3);
		center = new GridLayout(4,2);
		bottom = new GridLayout(1,5);
		
		/*The whole point of layout managers is to allow dynamic resizing, which is necessary not just 
		 * for user-resizable windows but also changing texts (internationalization) and different default 
		 * font sizes and fonts. If you just use the layout managers correctly, they will take care of panel 
		 * sizes. To avoid having your components stretched out all over the screen when the user increases 
		 * the window size, have an outermost panel with a left-aligned FlowLayout and the rest of the UI as 
		 * its single child - that will give the UI its preferred size and any surplus is filled with the 
		 * background color. "http://docs.oracle.com/javase/tutorial/uiswing/layout/using.html"*/
		 
		headID.setHgap(10);
		headID.setVgap(10);
		
		center.setHgap(5);
		center.setVgap(10);
		
		bottom.setHgap(5);
		bottom.setVgap(10);
		
		//panel1.setLayout(head);
		panel2.setLayout(headID);
		panel3.setLayout(center);
		panel4.setLayout(bottom);
		
		//panel1.add(single_label);
		
		panel2.add(id);
		panel2.add(idField);
		panel2.add(idCombo);
		
		panel3.add(desc);
		panel3.add(descField);
		panel3.add(quantity);
		panel3.add(quantityField);
		panel3.add(rate);
		panel3.add(rateField);
		panel3.add(unit_of_msr);
		panel3.add(unit_of_msrField);
		
		panel4.add(insert);
		panel4.add(update);
		panel4.add(delete);
		panel4.add(clear);
		panel4.add(exit);
		
		cont.setLayout(new BorderLayout(5,5));
		
		//cont.add(panel1, BorderLayout.NORTH);
		cont.add(panel2, BorderLayout.NORTH);
		cont.add(panel3, BorderLayout.CENTER);
		cont.add(panel4, BorderLayout.SOUTH);
		
		setResizable(false);	
		
                //set driver and connection object

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","","");
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT p_id FROM product");
			while(rs.next()) 
			{
				idCombo.addItem(Integer.toString(rs.getInt(1)));
			}
			con.close();			
		}
		catch(Exception e) {System.out.println("Error: " + e);}
		
		idCombo.addActionListener(this);
		insert.addActionListener(this);
		update.addActionListener(this);
		delete.addActionListener(this);
		clear.addActionListener(this);
		exit.addActionListener(this);
		
		
	}
	
	public void actionPerformed(ActionEvent ae) {
		
		if(ae.getActionCommand() == "exit") {System.exit(0);}
		if(ae.getActionCommand() == "Delete") 
		{
			try
			{
				con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","rock1818");
				stat = con.prepareStatement("DELETE from product where p_id = ?");
				String selected_id = idCombo.getSelectedItem().toString();
				int id = Integer.parseInt(selected_id);
				stat.setInt(1, id);
				stat.executeUpdate();
				con.close();
				idCombo.removeActionListener(this);
				
				con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","rock1818");
				stmt = con.createStatement();
				rs = stmt.executeQuery("SELECT p_id FROM product");
				idCombo.removeAllItems();
				while(rs.next())
					idCombo.addItem(Integer.toString(rs.getInt(1)));
				con.close();
				idCombo.addActionListener(this);
				idField.setText("");
				descField.setText("");
				rateField.setText("");
				quantityField.setText("");
				unit_of_msrField.setText("");
				error.setText("Row Deleted");
			}
			catch(Exception e) {System.out.println("Error: " + e);
			                    error.setText("Row Cannot be deleted");}	
		}
		
	
		if(ae.getActionCommand() == "Insert") 
		{
			try
			{
				con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","rock1818");
				stat = con.prepareStatement("INSERT INTO product(p_id,description,quantity,rate,unit_of_msr) VALUES(?,?,?,?,?)");
				String id = idField.getText();
				String description = descField.getText();
				String rate = rateField.getText();
				String quantity = quantityField.getText();
				String unit_of_msr = unit_of_msrField.getText();
				stat.setInt(1, Integer.parseInt(id));
				stat.setString(2, description);
				stat.setString(3, rate);
				stat.setString(4, quantity);
				stat.setString(5, unit_of_msr);
				
				stat.executeUpdate();
				con.close();
				idCombo.removeActionListener(this);
				
				con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","rock1818");
				stmt = con.createStatement();
				rs = stmt.executeQuery("SELECT p_id FROM product");
				idCombo.removeAllItems();
				
				while(rs.next())
					idCombo.addItem(Integer.toString(rs.getInt(1)));
				con.close();
				idCombo.addActionListener(this);
				error.setText("Row Inserted");
			}
			catch(Exception e) {System.out.println("Error: "+ e);
			                    error.setText("Row Cannot be inserted");}
			
		}
		
		if(ae.getSource() == idCombo) 
		{
			try
			{
				con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","rock1818");
				String selected_id = idCombo.getSelectedItem().toString();
				int id = Integer.parseInt(selected_id);
				stmt = con.createStatement();
				rs = stmt.executeQuery("SELECT description, quantity, rate, unit_of_msr FROM product WHERE p_id = " + id);
				rs.next();
				idField.setText(selected_id);
				descField.setText(rs.getString(1));
				quantityField.setText(rs.getString(2));
				rateField.setText(rs.getString(3));
				unit_of_msrField.setText(rs.getString(4));
				con.close();
			}
			catch(Exception e) {System.out.println("Error: " + e);}
			
		}
		
		if(ae.getActionCommand() == "Update") 
		{
			try
			{
				con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","rock1818");
				stat = con.prepareStatement("UPDATE product SET description = ?, quantity = ?, rate = ?, unit_of_msr = ? WHERE p_id = ?");
				
				String description = descField.getText();
				String rate = rateField.getText();
				String quantity = quantityField.getText();
				String unit_of_msr = unit_of_msrField.getText();
				String id_selected = idField.getText();
				
				stat.setString(1, description);
				stat.setString(2, quantity);
				stat.setString(3, rate);
				stat.setString(4, unit_of_msr);
				stat.setInt(5, Integer.parseInt(id_selected));
				
				stat.executeUpdate();
				con.close();
				error.setText("Row Updated");
			}
			catch(Exception e) {System.out.println("Error: " + e);
			                    error.setText("Cannot update the row");}
		}
		
		if(ae.getActionCommand() == "Clear") 
		{
			idField.setText("");
			descField.setText("");
			quantityField.setText("");
			rateField.setText("");
			unit_of_msrField.setText("");
		}
				
	}
		
	public static void main(String[] args) {

		ProductInfo p = new ProductInfo("Product Information");
		p.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//p.setSize(300, 300);
		
		p.setVisible(true);
		p.pack();
		
	
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

