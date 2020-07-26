package blazon.attributes.generator;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;

public class MalopesAttributeGenerator {

	public static void main(String[] args) throws IOException {
		
		String in = "	private Long assignRoleAverage;\n" + 
				"\n" + 
				"	private Long assignEntitlementAverage;\n" + 
				"\n" + 
				"	private Long changeStatusAccountAverage;\n" + 
				"\n" + 
				"	private Long changeStatusUserAverage;\n" + 
				"\n" + 
				"	private Long createAccountAverage;\n" + 
				"\n" + 
				"	private Long multipleRequestsAverage;\n" + 
				"\n" + 
				"	private Long newUserAverage;\n" + 
				"\n" + 
				"	private Long removeAccountAverage;\n" + 
				"\n" + 
				"	private Long removeEntitlementFromAccountAverage;\n" + 
				"\n" + 
				"	private Long resetPasswordAverage;\n" + 
				"\n" + 
				"	private Long removeUserAverage;\n" + 
				"\n" + 
				"	private Long averageFinishingTime;\n" + 
				"\n" + 
				"	private Long averageApprovingTime;\n" + 
				"\n" + 
				"	private Long updateUserAverage;";
		
		BufferedReader br = new BufferedReader(new StringReader(in));
		
		String linha = br.readLine();
		while(linha != null) {
			
			linha = linha.trim();
			
			if(linha.length() > 1) {
				
				String attribute = linha.split(" ")[2];
				String letter = attribute.substring(0, 1);
				String finalAttribute = letter.toUpperCase() +  attribute.substring(1, attribute.length()-1);
				System.out.println("histogram.set"+finalAttribute+"(result.getLong(\"" + attribute.substring(0, attribute.length()-1) + "\"));");
			}
			
			linha = br.readLine();
		}
	}
}
