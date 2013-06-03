import java.rmi.*;
import java.rmi.server.*;
import java.util.Vector;

public class BookServiceImpl extends UnicastRemoteObject implements BookingServices {

	private static final long serialVersionUID = 1L;
	Vector<String> ticket;
	public BookServiceImpl() throws RemoteException {
		
		super();
		ticket = new Vector<String>();
	}
	
    public String book(String name) {
    	String result;
    	int ori = ticket.size();
    	ticket.add(name);    	
    	int cur = ticket.size();
    	int id = ticket.indexOf(name); //Integer.toString(i) 
    	if(cur > ori) { result = "New Ticket is issued with ID: " + id;}
    	else {result = "Failure";}
    	return result;
    	
    		
    }
	
    public String View(int i) {
    	String id = null;
    	try
    	{
    	    id = ticket.get(i).toString();
    	}
    	catch(ArrayIndexOutOfBoundsException aiob) {
    		return i + "is free!!";
    	}
		return id;
    	    	
    }

    public String Cancel(int i) {
    	
    	int ori = ticket.size();
    	ticket.remove(i);
    	int cur = ticket.size();
    	if(cur < ori) {
    		return "0";} else {return "1";}	
    }
   
   
   public void reset() {
	   ticket.clear();
   }
	
    //public boolean add(Object t){}
    
    //public Object remove(int index) {}
    
    
    
    //public Object get(int index) {}
	
    //public boolean removeAll() {}
	
}
