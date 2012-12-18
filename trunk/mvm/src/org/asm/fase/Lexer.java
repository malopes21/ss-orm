package org.asm.fase;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

import org.asm.def.Clazz;
import org.asm.def.TabelasEstaticas;
import org.asm.def.Token;

public class Lexer {

	private BufferedReader br = null;
	private List<String> erros = new ArrayList<>();
	private List<Token> tokens = new ArrayList<Token>();

	private Pattern cte_int_dec = Pattern.compile("\\d+d?");
	private Pattern cte_int_hex = Pattern.compile("\\p{XDigit}+h");
	private Pattern cte_char = Pattern.compile("'\\p{Alpha}'");
	private Pattern id = Pattern.compile("\\D[_\\p{Alnum}]*");

	public Lexer(BufferedReader br) {
		this.br = br;
	}

	public boolean analyze() throws IOException {

		String linha = br.readLine();
		int nLinha = 1;

		while (linha != null) {
			StringTokenizer tokenizador = new StringTokenizer(linha);

			while (tokenizador.hasMoreTokens()) {
				String token = tokenizador.nextToken();
				if (token.charAt(0) == '"') {
					int inicio = linha.indexOf('"');
					int fim = linha.indexOf('"', inicio + 1);
					if (fim > 0) {
						tokens.add(new Token(linha.substring(inicio + 1, fim), Clazz.Literal_String, -1, nLinha, 0));
						tokenizador = new StringTokenizer(linha.substring(fim, linha.length()));
						token = tokenizador.nextToken();
					} else {
						System.err.println("simbolo desconhecido: " + linha.substring(inicio, linha.length() - 1));
						erros.add("simbolo desconhecido: " + linha.substring(inicio, linha.length() - 1));
						break;
					}
				} else if (token.length() >= 1 && token.charAt(0) == ';') {
					break;
				} else if (TabelasEstaticas.containPReservada(token)) {

					tokens.add(new Token(token, Clazz.Reserved_Word, -1, nLinha, 0));
				} else if (TabelasEstaticas.containDelimitador(token)) {

					tokens.add(new Token(token, Clazz.Delimiter, -1, nLinha, 0));
				} else if (TabelasEstaticas.containOperador(token)) {

					tokens.add(new Token(token, Clazz.Operator, -1, nLinha, 0));
				} else if (cte_int_dec.matcher(token).matches()) {
					if(token.contains("d") || token.contains("d")) {
						token = token.substring(0, token.length()-1);
					}
					tokens.add(new Token(token, Clazz.Literal_Decimal, -1, nLinha, 0));
				} else if (cte_int_hex.matcher(token).matches()) {
					
					token = token.substring(0, token.length()-1);
					tokens.add(new Token(token, Clazz.Literal_Hexa, -1, nLinha, 0));
				} else if (cte_char.matcher(token).matches()) {
					
					token = token.substring(1, token.length()-1);
					tokens.add(new Token(token, Clazz.Literal_Char, -1, nLinha, 0));
				}else if (id.matcher(token).matches()) {

					Token tk = new Token(token, Clazz.Identifier, -1, nLinha, 0);
					// tabela de símbolos aqui!
					tokens.add(tk);

				} else {
					System.err.println("Erro: " + token);
					erros.add("Simbolo '" + token + "' desconhecido: linha " + nLinha);
				}
			}
			linha = br.readLine();
			tokens.add(new Token("\\n", Clazz.Delimiter_newLine, -1, nLinha, 0));
			nLinha++;
		}
		tokens.add(new Token("$", Clazz.EOF, -1, 0, 0));

		return erros.size() == 0;
	}

	public void showErrors() {
		for (String erro : erros) {
			System.out.println(erro);
		}
	}

	public void showTokens() {
		for (Token token : tokens) {
			System.out.println(token);
		}
	}

	public List<Token> getTokens() {
		return tokens;
	}

}
