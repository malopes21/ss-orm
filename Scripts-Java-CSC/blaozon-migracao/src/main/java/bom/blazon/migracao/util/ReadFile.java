package bom.blazon.migracao.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class ReadFile {

	public static String read(String fileName)throws Exception  { 
		
		String text = null;
		
		BufferedReader reader;
		
		try {
			
			reader = new BufferedReader(new FileReader(fileName));
			String line = reader.readLine();
			text = line;
			while (true) {

				line = reader.readLine();
				
				if(line == null)
					break;
				
				text = text + line + "\n";
				
			}
			reader.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	    
		return text.trim();
		
	}
	
	public static void main(String[] args) throws Exception {
		
		String file = ReadFile.read("src/main/resources/SELECT_APPROVAL_TASKS");
		
		System.out.println(file);
		
	}
	
}