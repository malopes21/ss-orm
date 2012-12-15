package org.asm;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import org.asm.def.TabelaSimbolos;
import org.asm.fase.Lexer;
import org.asm.fase.Syntatic;

public class Main {
	
	public static void main(String[] args) throws IOException {
		String fileRelPath = "prog01.asm";
		BufferedReader in = null;
		try {

			in = new BufferedReader(new FileReader(fileRelPath));
		}catch (Exception e) {
			System.err.println("Read file error: " + e.getMessage());
			System.exit(-1);
		}
		
		Lexer lexer = new Lexer(in);
		if(!lexer.analyze()) {
			System.out.println("Lexical error: ");
			lexer.showErrors();
			System.exit(-1);
		}
		
		System.out.println("TOKENS: ");
		lexer.showTokens();
		
		Syntatic syntatic = new Syntatic(lexer.getTokens());
		if(!syntatic.analyze()) {
			System.out.println("Syntatic error: ");
			syntatic.showErrors();
			System.exit(-1);
		}
		
		System.out.println("OK Sintaxe! Simbols:");
		TabelaSimbolos.listaTabela();
		System.out.println("TOKENS AGAIN: ");
		lexer.showTokens();
		
		syntatic.mostraArvore();
		
		
	}

}
