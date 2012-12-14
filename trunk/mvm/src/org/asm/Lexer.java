package org.asm;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class Lexer {

    private BufferedReader br = null;
	private List<String> erros = new ArrayList<>();
	private List<Token> tokens = new ArrayList<Token>();
    
	private Pattern cte_int_dec  = Pattern.compile("\\d+d?");
    private Pattern cte_int_hex  = Pattern.compile("\\d+h?");
    private Pattern id  = Pattern.compile("\\D[_\\p{Alnum}]*");
	
	public Lexer(BufferedReader br){
		this.br = br;
	}

	public boolean analyze() {
		
		return erros.size() == 0;
	}

	public void showErrors() {
		for(String erro: erros) {
			System.out.println(erro);
		}
	}
}
