package generator;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

public class SetStatementParameterGenerator {

	   public static void main(String[] args) throws IOException{

	        try {
	        	
	        	String eventos = 
	        			"| batchId       | varchar(255) | NO   | PRI | NULL    |       |\n" + 
	        			"| amount        | bigint(20)   | YES  |     | NULL    |       |\n" + 
	        			"| finalizedDate | datetime     | YES  |     | NULL    |       |\n" + 
	        			"| profileId     | bigint(20)   | YES  |     | NULL    |       |\n" + 
	        			"| profileName   | varchar(255) | YES  |     | NULL    |       |\n" + 
	        			"| startDate     | datetime     | YES  |     | NULL    |       |\n" + 
	        			"| status        | varchar(255) | YES  |     | NULL    |       |\n" + 
	        			"" ;
	        	
	        	BufferedReader reader = new BufferedReader(new StringReader(eventos));
	        	
	        	String line = reader.readLine();
	        	
	        	String fileName = "setParameters.java";
	        	
	        	PrintWriter out = new PrintWriter("saida2/" + fileName);
	        	
	        	//out.write("\nint pos = 1;");
	        	
	        	int pos = 0;
	        	
	        	List<String> parameterNames = new ArrayList<>();
	        	
	        	while(line != null) {
	        		
	        		line = line.trim();
	        		
	        		if(line.length() > 0) {
	        			
	        			String[] parts = line.split("  *");
	        			
	        			String parameterName = parts[1];
	        			
	        			String parameterType = parts[3];
	        			
	        			pos++;
	        			
	        			parameterNames.add(parameterName);
	        			
	        			if(parameterType.equalsIgnoreCase("bigint(20)")) {
	        				
	        				out.write("\nif(row.get(\""+parameterName+"\") != null) { statement.setLong("+pos+", (Long)row.get(\""+parameterName+"\")); } else { statement.setObject("+pos+", null); }");
	        				
	        			} else if(parameterType.equalsIgnoreCase("varchar(255)")) {
	        				
	        				out.write("\nif(row.get(\""+parameterName+"\") != null) { statement.setString("+pos+", (String)row.get(\""+parameterName+"\")); } else { statement.setObject("+pos+", null); }");
	        				
	        			} else if(parameterType.equalsIgnoreCase("datetime")) {
	        				
	        				out.write("\nif(row.get(\""+parameterName+"\") != null) { statement.setTimestamp("+pos+", (java.sql.Timestamp)row.get(\""+parameterName+"\")); } else { statement.setObject("+pos+", null); }");
	        				
	        			} else if(parameterType.equalsIgnoreCase("tinyint(1)")) {
	        				
	        				out.write("\nif(row.get(\""+parameterName+"\") != null) { statement.setBoolean("+pos+", (Boolean)row.get(\""+parameterName+"\")); } else { statement.setObject("+pos+", null); }");
	        				
	        			} else if(parameterType.equalsIgnoreCase("longtext")) {
	        				
	        				out.write("\nif(row.get(\""+parameterName+"\") != null) { statement.setClob("+pos+", (String)row.get(\""+parameterName+"\")); } else { statement.setObject("+pos+", null); }");
	        				
	        			} else if(parameterType.equalsIgnoreCase("bit(1)")) {
	        				
	        				out.write("\nif(row.get(\""+parameterName+"\") != null) { statement.setBoolean("+pos+", (Boolean)row.get(\""+parameterName+"\")); } else { statement.setObject("+pos+", null); }");
	        				
	        			}else {
	        				
	        				throw new RuntimeException("Type unknow: " + parameterType);
	        			}
	        			
	        			//System.out.println("-"+parameterName + "-" + parameterType+"-");
	    	            
	        		}
	        		line = reader.readLine();
	        	}
	        	
	        	System.out.println("pos: " + pos);
	        	
	        	out.flush();
	            out.close();
	            
	            fileName = "insertQuery.java";
	        	
	        	out = new PrintWriter("saida2/" + fileName);
	        	
	        	out.write("\nINSERT INTO TABLE_NAME ");
	        	out.write("\n(" + parameterNames.toString().replace("[", "").replace("]", "")+")");
	        	out.write("\nVALUES ("+generateCharValues(parameterNames.size())+")");
	        	
	        	out.flush();
	            out.close();
	        	
	            System.out.println("OK");

	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        }
	    }

	    private static String generateCharValues(int size) {
		
	    	String out = "?";
	    	
	    	for(int i=1; i<size; i++) {
	    		out = out + ", ?";
	    	}
	    	
	    	return out;
	    }

		private static String toUpperCaseFirstChar(String idImagem) {
	        String firstUpper = idImagem.substring(0, 1).toUpperCase();
	        String tail = idImagem.substring(1, idImagem.length());
	        return firstUpper + tail;
	    }
	    
	    private static String toLowerCaseFirstChar(String idImagem) {
	        String firstLower = idImagem.substring(0, 1).toLowerCase();
	        String tail = idImagem.substring(1, idImagem.length());
	        return firstLower + tail;
	    }
}
