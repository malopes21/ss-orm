package generator;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.StringTokenizer;


public class JobUpdateBuilderGenerator {

	public static void main(String[] args) throws FileNotFoundException {
		
		String jobPath = "com.blazon.accountmanagement.jobs.FindAccountReadyToRemove";
		
		PrintWriter out = new PrintWriter("saida/" + jobPath);
		
		String names[] = jobPath.split("\\.");
		
		String jobName = generateJobName(names[names.length-1]);
		
		String jobSimpleClassName = names[names.length-1];
		
		String jobFullName = jobPath;
		
		String saidaUpdate = "UPDATE JobInstance set \n" + 
				"name = '%s',\n" + 
				"description = '%s.',\n" + 
				"externalJobDetailId = '%s'\n" + 
				"where job_id in ( select id from Job where className like '%%" + jobSimpleClassName + "');\n" + 
				"\n" + 
				"update Job \n" + 
				"set className = '%s',\n" + 
				"description = '%s.',\n" + 
				"displayName = '%s'\n" + 
				"where className like '%%"+jobSimpleClassName+"';";
		
		out.println(String.format(saidaUpdate, jobName, jobName, jobName, jobFullName, jobName, jobName));
		
		out.flush();
		out.close();
	}


	private static String generateJobName(String name) {
		
		StringTokenizer tokenizer =  new StringTokenizer(name, "ABCDEFGHIJKLMNOPQRSTUVWXYZ");
		
		String saida = "";
		
		while(tokenizer.hasMoreElements()) {
			saida = saida + " " + tokenizer.nextElement();
		}
		
		return saida;
	}


	private static String capitalize(String name) {

		return ("" + name.charAt(0)).toUpperCase() + name.substring(1) ;
	}
	
	private static String descapitalize(String name) {

		return ("" + name.charAt(0)).toLowerCase() + name.substring(1) ;
	}

}
