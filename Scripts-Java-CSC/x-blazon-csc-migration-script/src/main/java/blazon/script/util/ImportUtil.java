package blazon.script.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

public class ImportUtil {

	public static String getProperty(String fileName, String property) throws IOException {
		
		Properties prop = new Properties();
		
		BufferedReader br = new BufferedReader(new FileReader(fileName)); 
		
		prop.load(br);
		
		return prop.getProperty(property);
	}
	
	public static void setProperty(String fileName, String property, String value) throws IOException {
		
		Properties prop = new Properties();
		
		BufferedReader br = new BufferedReader(new FileReader(fileName)); 
		
		prop.load(br);
		
		prop.setProperty(property, value);
		
		PrintWriter out = new PrintWriter(new File(fileName));
		
		prop.store(out, null);
	}
}
