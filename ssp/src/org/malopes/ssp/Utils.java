package org.malopes.ssp;

public class Utils {
	
	public static String formatErro(String nomeMetodo, Token token) {
		return "["+nomeMetodo+"]. Esperado token 'def'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna();
	}
	
	
	
	
	

}
