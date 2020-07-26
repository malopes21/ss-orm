package permissions;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

public class MainDescs {

	public static void main(String[] args) throws IOException {

		try {

			BufferedReader reader;

			reader = new BufferedReader(new FileReader("entrada/BlazonStartupSystemInternalPermissions.java"));
			
			String fileName = "internalPermissions.json";

			PrintWriter out = new PrintWriter("saida/" + fileName);
			
			out.write("[\n");

			String line = reader.readLine();
			while (true) {

				if (line == null)
					break;

				if(line.contains("internalPermission.setName")) {
					
					out.write("  {\n");
					
					String value = line.substring(line.indexOf('(')+1, line.indexOf(')'));
					
					out.write("    \"name\": " + value + ",\n");
				}
				
				if(line.contains("internalPermission.setLabel")) {
					
					String value = line.substring(line.indexOf('(')+1, line.indexOf(')'));
					
					out.write("    \"label\": " + value + ",\n");
				}
				
				if(line.contains("internalPermission.setDescription")) {
					
					String value = line.substring(line.indexOf('(')+1, line.indexOf(')'));
					
					out.write("    \"description\": " + value + ",\n");
				}
				
				if(line.contains("internalPermission.setCategory")) {
					
					String value = line.substring(line.indexOf('(')+1, line.indexOf(')'));
					
					out.write("    \"category\": " + value + "\n");
					
					out.write("  },\n");
				}

				line = reader.readLine();
			}
			
			out.write("]");

			reader.close();

			out.flush();
			out.close();

			System.out.println("OK");

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
