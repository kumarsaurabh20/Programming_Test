import java.awt.Dialog;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;


public class MyDialogue extends Dialog implements ActionListener {
	
	private static final long serialVersionUID = 1L;

	public MyDialogue(Frame frame, String title) {
		
		super(frame, title);
		setLayout(new FlowLayout());
		setSize(230,80);
		add(new JLabel(title));
		JButton btnOk = new JButton("OK");
		add(btnOk);
		btnOk.addActionListener(this);
		
	}

	public void actionPerformed(ActionEvent k) {
		
		dispose();
		
	}
	
}
