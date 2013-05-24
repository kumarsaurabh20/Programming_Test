import java.awt.Dialog;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JLabel;


public class MyDialog extends Dialog implements ActionListener 
{
	private static final long serialVersionUID = 1L;

MyDialog(Frame par, String title) 
  {
	  super(par, title, false);
	  setLayout(new FlowLayout());
	  setSize(200,80);
	  add(new JLabel(title));
	  JButton btn_ok = new JButton("OK");
	  add(btn_ok);
	  btn_ok.addActionListener(this);
  }
   
   public void actionPerformed(ActionEvent ae) 
   {
	   dispose();
   }
}
