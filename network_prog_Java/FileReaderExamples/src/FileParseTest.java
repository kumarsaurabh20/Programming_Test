import java.io.*;

public class FileParseTest {

	public static void main(String[] args) {
		
		try
		{
			File file = new File("/home/jarvis/workspace/FileReaderExamples/Name.txt");
			FileReader fr = new FileReader(file);
			int ch;
			
			while((ch=fr.read()) != -1) {
				
				System.out.println((char)ch);
				
			}
			
			
		}
		catch(FileNotFoundException fnfe) {fnfe.printStackTrace();} 
		catch (IOException e) {e.printStackTrace();}		

	}

}
