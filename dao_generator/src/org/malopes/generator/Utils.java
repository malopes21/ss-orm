package org.malopes.generator;

import org.malopes.generator.defs.Token;

public class Utils {
	
	public static String formatErro(String nomeMetodo, Token token) {
		return "["+nomeMetodo+"]. Esperado token 'def'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna();
	}

}
