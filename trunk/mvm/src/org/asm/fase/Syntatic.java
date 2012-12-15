package org.asm.fase;

import java.util.ArrayList;
import java.util.List;

import org.asm.def.Clazz;
import org.asm.def.Node;
import org.asm.def.Simbolo;
import org.asm.def.TabelaSimbolos;
import org.asm.def.Token;

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
