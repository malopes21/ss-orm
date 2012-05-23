package org.malopes.generator;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

public class AnalisadorLexico {
	
	private List<Token> tokens = new ArrayList<Token>();
	private Pattern cte_int  = Pattern.compile("\\d+");
	private Pattern cte_real  = Pattern.compile("\\d+\\.\\d+");
	private Pattern id  = Pattern.compile("\\D[_\\p{Alnum}]*");
	private List<String> erros = new ArrayList<String>();
	
	public List<String> getErros() {
		return erros;
	}

	public void setErros(List<String> erros) {
		this.erros = erros;
	}

	public List<Token> getTokens() {
		return tokens;
	}

	public void setTokens(List<Token> tokens) {
		this.tokens = tokens;
	}

	public boolean analisa(String fileRelPath) {
		try {
			//String sFile = getClass().getResource(fileRelPath).getFile().toString(); //usado para teste dentro do eclipse
			//System.out.println(sFile);
			BufferedReader in = new BufferedReader(new FileReader(fileRelPath));
			
			String linha = in.readLine();
			int nLinha = 1;
			while( linha != null) {
				StringTokenizer tokenizador = new StringTokenizer(linha);
			
				while(tokenizador.hasMoreTokens()) {
					String token = tokenizador.nextToken();
					//Matcher m = p.matcher(token);
					
					if (token.charAt(0)=='"') {
						int inicio = linha.indexOf('"');
						int fim = linha.indexOf('"', inicio+1);
						if (fim >0) {
							//System.out.println("string literal:["+linha.substring(inicio+1, fim)+"]");
							tokens.add(new Token(linha.substring(inicio+1, fim), Classe.ConstanteLiteralString, -1, nLinha, 0));
							tokenizador = new StringTokenizer(linha.substring(fim, linha.length()));
							token = tokenizador.nextToken();
						} else {
							System.err.println("simbolo desconhecido: "+linha.substring(inicio, linha.length()-1));
							erros.add("simbolo desconhecido: "+linha.substring(inicio, linha.length()-1));
							break;
						}
					} else if (token.length() > 1 && token.charAt(0) == '/' && token.charAt(1) == '/'  ) {
						break;
					} else if (TabelasEstaticas.containPReservada(token)) {
						//System.out.println("P. reserv.: "+token);
						tokens.add(new Token(token, Classe.PalavraReservada, -1, nLinha, 0));
					} else if (TabelasEstaticas.containDelimitador(token)) {
						//System.out.println("Delimit.: "+token);
						tokens.add(new Token(token, Classe.Delimitador, -1, nLinha, 0));
					} else if (TabelasEstaticas.containOperador(token)) {
						//System.out.println("Operad.: "+token);
						tokens.add(new Token(token, Classe.Operador, -1, nLinha, 0));
					} else if (cte_int.matcher(token).matches()) {
						//System.out.println("Cte int: "+token);
						tokens.add(new Token(token, Classe.ConstanteLiteralInteira, -1, nLinha, 0));
					} else if (cte_real.matcher(token).matches()) {
						//System.out.println("Cte real: "+token);
						tokens.add(new Token(token, Classe.ConstanteLiteralReal, -1, nLinha, 0));
					} else if (id.matcher(token).matches()) {
						//System.out.println("Id: "+token);
						Token tk = new Token(token, Classe.Identificador, -1, nLinha, 0);
						//tabela de simbolos sera criada na analise sintatica devido ao problema do escopo das defs
						/*int indice = TabelaSimbolos.contains(tk); 
						if (indice < 0) {
							indice = TabelaSimbolos.addSimbolo(new Simbolo(tk));
						}
						tk.setIndiceTabSimb(indice);*/
						tokens.add(tk);
						
					} else {
						System.err.println("Erro: "+token);
						erros.add("Simbolo '"+token+"' desconhecido: linha "+nLinha);
					}
				}
				linha = in.readLine();
				nLinha++;
			}
			tokens.add(new Token("$", Classe.EOF, -1, 0, 0));
			
		} catch (FileNotFoundException e) {
			System.err.println("ERRO1: "+e);
		} catch(IOException io) {
			System.err.println("ERRO2: "+io);
		}
		
		return erros.size() == 0;
		
	}

	public static void main(String[] args) {
		AnalisadorLexico analisadorLexico = new AnalisadorLexico();
		analisadorLexico.analisa("../prog02.mpp");
		analisadorLexico.mostraTokens();
		TabelaSimbolos.listaTabela();
	}

	public void mostraTokens() {
		for (Token token : tokens) {
			System.out.printf("%-20s %-30s %-20s %-20s %-20s\n", new Object[]{token.getImagem(), token.getClasse(), token.getIndiceTabSimb(), token.getLinha(), token.getColuna()});
		}
	}

	public void mostraErros() {
		for (String erro : erros) {
			System.err.println(erro);
		}
	}
}
