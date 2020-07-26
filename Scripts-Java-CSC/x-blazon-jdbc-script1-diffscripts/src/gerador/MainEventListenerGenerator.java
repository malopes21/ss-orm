package gerador;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;

public class MainEventListenerGenerator {

	   public static void main(String[] args) throws IOException{

	        try {
	        	
	        
	        	
	        	String eventos = 
	        			"passwordvault.lifecycle.create\n" + 
	        			"	\n" + 
	        			"passwordvault.lifecycle.update.pre\n" + 
	        			"	\n" + 
	        			"passwordvault.lifecycle.update.post\n" + 
	        			"\n" + 
	        			"passwordvault.lifecycle.remove\n" + 
	        			"\n" + 
	        			"passwordvault.lifecycle.permission.grant\n" + 
	        			"\n" + 
	        			"passwordvault.lifecycle.permission.revoke" ;
	        			
	        	
	        	BufferedReader reader = new BufferedReader(new StringReader(eventos));
	        	
	        	String eventName = reader.readLine();
	        	
	        	while(eventName != null) {
	        		
	        		eventName = eventName.trim();
	        		
	        		if(eventName.length() > 0) {
	        		
	        			
	        			String className = "Malopes";
	        			
	        			String packageName = "malopes";
	        			
	        			String[] eventParts = eventName.split("\\.");
	        			
	        			packageName = eventParts[0];
	        			
	        			if(eventParts.length == 2) {
	        				
	        				className = toUpperCaseFirstChar(eventParts[1]) + toUpperCaseFirstChar(eventParts[0]);
	        				
	        			} else if(eventParts.length == 3) {
	        				
	        				className = toUpperCaseFirstChar(eventParts[2]) + toUpperCaseFirstChar(eventParts[0]);
	        				
	        			} else if(eventParts.length == 4) {
	        				
	        				className = toUpperCaseFirstChar(eventParts[3]) + toUpperCaseFirstChar(eventParts[2]) + 
	        						toUpperCaseFirstChar(eventParts[0]);
	        				
	        			} else if(eventParts.length == 5) {
	        				
	        				className = toUpperCaseFirstChar(eventParts[2]) + toUpperCaseFirstChar(eventParts[3]) + toUpperCaseFirstChar(eventParts[4]) + 
	        						 toUpperCaseFirstChar(eventParts[0]);
	        			}
	        			
	        			className = className + "AuditLoggingListener";
	        			
	        			String definition = "r.on(R(\""+eventName+"\"), ("+className+") applicationContext.getBean(\""+toLowerCaseFirstChar(className)+"\"));";
	        			System.out.println(definition);
	        			
	    	            String fileName = className;
	    	            PrintWriter out = new PrintWriter("saida/" + fileName + ".java");
	    	            out.write("package com.blazon.analytics.etl.eventlisteners.listeners."+ packageName +";\n\n");
	    	            out.write("import java.util.Map;\n" + 
	    	            		"\n" + 
	    	            		"import org.springframework.beans.factory.annotation.Autowired;\n" + 
	    	            		"import org.springframework.stereotype.Component;\n" + 
	    	            		"\n" + 
	    	            		"import com.blazon.analytics.data.events.domain.BlazonEventLogging;\n" + 
	    	            		"import com.blazon.analytics.data.events.helpers.BlazonEventLoggingBuilder;\n" + 
	    	            		"import com.blazon.analytics.data.events.services.BlazonEventLoggingServiceAPI;\n" + 
	    	            		"\n" + 
	    	            		"import reactor.bus.Event;\n" + 
	    	            		"import reactor.fn.Consumer;\n\n");
	    	            out.write("@Component\n");
	    	            out.write("public class " + fileName + " implements Consumer<Event<Map<String, Object>>> {\n");
	    	            	out.write("\n\t@Autowired\n" + 
	    	            			"	private BlazonEventLoggingServiceAPI blazonEventLoggingServiceAPI;\n" + 
	    	            			"	\n" + 
	    	            			"	public void accept(Event<Map<String, Object>> ev) {\n" + 
	    	            			"		\n" + 
	    	            			"		\n" + 
	    	            			"		BlazonEventLogging auditLogging = new BlazonEventLoggingBuilder()\n" + 
	    	            			"           .type(\"" + eventName + "\")\n" + 
	    	            			"			.addAttribute(\"name\", \"name\")\n" + 
	    	            			"			.build();\n" + 
	    	            			"		\n" + 
	    	            			"		blazonEventLoggingServiceAPI.success(auditLogging);\n" + 
	    	            			"		\n" + 
	    	            			"	}");
	    	            out.write("\n}");

	    	            out.flush();
	    	            out.close();
	        		}
	        		eventName = reader.readLine();
	        	}
	            
	            System.out.println("OK");

	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        }
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
