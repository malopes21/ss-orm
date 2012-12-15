package org.asm;

import java.util.ArrayList;
import java.util.List;

public class Syntatic {
	
	private List<Token> tokens = null;
    private int pToken;
    private Token token;
    private List<String> erros = new ArrayList<String>();
    private Node raiz;
	
	public Syntatic(List<Token> tokens) {
		this.tokens = tokens;
	}
	
    public Node getRaiz() {
        return raiz;
    }

    private void nextToken() {
        if (token != null && token.getClazz() == Clazz.Identifier) {
                Simbolo simbolo = new Simbolo(token, "", null, null);
                TabelaSimbolos.addSimbolo(simbolo);
        }

        token = tokens.get(pToken);
        pToken++;
}

	public boolean analyze() {
		return false;
	}

	public void showErrors() {
		
	}

}
