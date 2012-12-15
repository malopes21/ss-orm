package org.asm.fase;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

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
		
		
		
		
	}

}
