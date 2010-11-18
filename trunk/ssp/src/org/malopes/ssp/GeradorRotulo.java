package org.malopes.ssp;

public class GeradorRotulo {
	
	private static int n;
	private static String rotulo = "rotulo";
	
	public static String getNextRotulo() {
		n++;
		return rotulo + n;
	}

}
