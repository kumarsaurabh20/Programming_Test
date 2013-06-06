import java.io.*;
import java.util.Hashtable;


public class FileParseTestII {

	public static void main(String[] args) {
		String ch = null;;
		int i = 0;
		int x = 0;
		int y = 0;
		double mz = 0;
		int val = 0;		
		Hashtable<Double, Integer> ht = new Hashtable<Double, Integer>();		
		try {
			BufferedReader br = new BufferedReader(new FileReader("Spectrum_1.txt"));
			while((ch = br.readLine()) != null) {				
				i++;				
				if((i > 1) && (i < 3)) {	
					
					String var[] = ch.split("		");	
					
					//System.out.println(var[]);
					
					String var1 = var[0];
					String var2 = var[1];
					x = Integer.parseInt(var1);
					y = Integer.parseInt(var2);					
				}				
				if(i > 3) {
					
					String var[] = ch.split("		");
					String var3 = var[0];
					String var4 = var[1];
					mz = Double.parseDouble(var3);
					val = Integer.parseInt(var4);					
					ht.put(mz, val);					
				}				
			}			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		System.out.println(x + " and " + y);
		System.out.println(ht);
	}
}
