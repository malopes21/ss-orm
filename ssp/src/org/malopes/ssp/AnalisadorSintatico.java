package org.malopes.ssp;

import java.util.ArrayList;
import java.util.List;

public class AnalisadorSintatico {

	private int pToken;
	private Token token;
	private List<Token> tokens;
	private List<String> erros = new ArrayList<String>();
	private Token tokenIdFuncao;
	private String escopoAtual;

	public AnalisadorSintatico(List<Token> tokens) {
		this.tokens = tokens;
	}
	
	private void nextToken() {
		if (token != null && token == tokenIdFuncao) {
			escopoAtual = token.getImagem();
		}
		if (token != null && token.getClasse() == Classe.Identificador) {
			Simbolo simbolo = new Simbolo(token, escopoAtual, null, null);
			TabelaSimbolos.addSimbolo(simbolo);
		}
		
		token = tokens.get(pToken);
		pToken++;
	}

	public boolean analisa() {
		pToken = 0;
		nextToken();
		program();
		if (token.getClasse() != Classe.EOF) {
			erros.add("[AnalisadorSintatico.analisa]. Esperado token 'def'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
		}
		
		return erros.size() == 0;
	}
	
	public void mostraErros() {
		for (String erro : erros) {
			System.err.println(erro);
		}
	}
	
	/**
	 * <Program> ::= <ListDef>
	 */
	private void program() {
		listDef();
	}

	/**
	 * <ListDef> ::= <Def> <ListDef> |
	 */
	private void listDef() {
		if (token.getImagem().equals("def")) { // if de first
			def();
			listDef();
		}
	}

	/**
	 * <def> ::= 'def' Identifier '(' <ListArg> ')' ':' <Tipo> '{' <ListComand>
	 * '}'
	 */
	private void def() {
		if (token.getImagem().equals("def")) {
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token 'def'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		if (token.getClasse() == Classe.Identificador) {
			tokenIdFuncao = token;
			nextToken();
		} else {
			erros.add("[def]. Esperado token identificador de fun��o. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		if (token.getImagem().equals("(")) {
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		listArg();

		if (token.getImagem().equals(")")) {
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}
		
		if (token.getImagem().equals(":")) {
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token ':'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		tipo();

		if (token.getImagem().equals("{")) {
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token '{'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		listComand();

		if (token.getImagem().equals("}")) {
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token '}'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}
	}

	/**
	 * <ListArg> ::= <Arg> <ListArg2> |
	 */
	private void listArg() {
		if (token.getClasse() == Classe.Identificador) { // if de first
			arg();
			listArg2();
		}
	}

	/**
	 * <ListArg2> ::= ',' <Arg> <ListArg2> |
	 */
	private void listArg2() {
		if (token.getImagem().equals(",")) {
			nextToken();
			arg();
			listArg2();
		}
	}

	/**
	 * <Arg> ::= Identifier ':' <Tipo>
	 */
	private void arg() {
		if (token.getClasse() == Classe.Identificador) {
			nextToken();
		} else {
			erros.add("[def]. Esperado token identificador de vari�vel. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		if (token.getImagem().equals(":")) {
			nextToken();
		} else {
			erros.add("[def]. Esperado token ':'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		tipo();
	}

	/**
	 * <Tipo> ::= 'Int' | 'Real' | 'Str' | 'Nada'
	 */
	private void tipo() {
		if (token.getImagem().equals("Int") || token.getImagem().equals("Real") || token.getImagem().equals("Str") || token.getImagem().equals("Nada")) {
			nextToken();
		} else {
			erros.add("[def]. Esperado token 'Int' ou 'Real' ou 'Str' ou 'Nada'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}
	}

	/**
	 * <ListComand> ::= <Comand> <ListComand> | First: var id id enquanto se ler
	 * ver ret {
	 */
	private void listComand() {
		if (token.getImagem().equals("var")
				|| // if de first
				token.getClasse() == Classe.Identificador
				|| // conflito de analise preditiva: usar LookAhead(2) no metodo
					// comand()
				token.getImagem().equals("enquanto") || token.getImagem().equals("se") || token.getImagem().equals("ler") || token.getImagem().equals("ver")
				|| token.getImagem().equals("ret")) {

			comand();
			listComand();
		}
	}

	/**
	 * <Comand> ::= <Decl> ';' | <Atrib> ';' | <While> | <If> | <Ler> ';' |
	 * <Ver> ';' | <Ret> ';' | <Call> ';' | '{' <ListComand> '}' First(<Atrib>
	 * ';') = {id} e First(<Call> ';') = {id}. Solucao usar LookAhead(2). Para
	 * <Atrib> o lookAhead eh '=' e para <Call> o lookAhead eh '('
	 */
	private void comand() {
		if (token.getImagem().equals("var")) {
			decl();

			if (token.getImagem().equals(";")) {
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return;
			}

		} else if (token.getClasse() == Classe.Identificador) {
			Token ahead = lookAhead(token);
			if (ahead.getImagem().equals("=")) {
				atrib();
			} else if (ahead.getImagem().equals("(")) {
				call();
			} else {
				erros.add("[comand]. Esperado token de lookahead '=' ou '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return;
			}
			
			if (token.getImagem().equals(";")) {
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return;
			}
			
		} else if (token.getImagem().equals("enquanto")) {
			enquanto();
		} else if (token.getImagem().equals("se")) {
			se();
		} else if (token.getImagem().equals("ler")) {
			ler();

			if (token.getImagem().equals(";")) {
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return;
			}
		} else if (token.getImagem().equals("ver")) {
			ver();

			if (token.getImagem().equals(";")) {
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return;
			}
		} else if (token.getImagem().equals("ret")) {
			ret();
			
			if (token.getImagem().equals(";")) {
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return;
			}
			
		} else if (token.getImagem().equals("{")) {
			nextToken();

			listComand();

			if (token.getImagem().equals("}")) {
				nextToken();
			} else {
				erros.add("[comand]. Esperado token '}'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return;
			}
		} else {
			erros
					.add("[comand]. Esperado token id ou 'var' ou 'enquanto' ou 'se' ou 'ler' ou 'ver' ou 'ret' ou '{'. Linha: " + token.getLinha() + ", coluna: "
							+ token.getColuna());
			// resincronizar();
			return;
		}
	}
	
	/**
	 * <Decl>  ::= 'var' <ListId> ':' <Tipo>
	 */
	private void decl() {
		if (token.getImagem().equals("var")) {
			nextToken();
		} else {
			erros.add("[decl]. Esperado token 'var'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}
		
		listId();
		
		if (token.getImagem().equals(":")) {
			nextToken();
		} else {
			erros.add("[decl]. Esperado token ':'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}
		
		tipo();
	}

	/**
	 * <ListId> ::= Identifier <ListId2> 
	 */
	private void listId() {
		if (token.getClasse() == Classe.Identificador) {
			nextToken();
		} else {
			erros.add("[listId]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}
		
		listId2();
	}

	/**
	 * <ListId2>  ::=  ',' Identifier <ListId2> | 
	 */
	private void listId2() {
		if (token.getImagem().equals(",")) {

			nextToken();
		
			if (token.getClasse() == Classe.Identificador) {
				nextToken();
			} else {
				erros.add("[listId2]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return;
			}
			
			listId2();
		}
	}

	/**
	 * <Atrib> ::= Identifier '=' <ExpAtrib>
	 */
	private void atrib() {
		if (token.getClasse() == Classe.Identificador) {
			nextToken();
		} else {
			erros.add("[atrib]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		if (token.getImagem().equals("=")) {
			nextToken();
		} else {
			erros.add("[atrib]. Esperado token '='. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		exprAtrib();
	}

	/**
	 * <ExpAtrib> ::= <Operan> <ExpAtrib2>
	 */
	private void exprAtrib() {
		operan();
		exprAtrib2();
	}

	/**
	 * <ExpAtrib2> ::= <OpArit> <Operan> <ExpAtrib2> |
	 */
	private void exprAtrib2() {
		if (token.getImagem().equals("+") || // if de First
			token.getImagem().equals("-") || 
			token.getImagem().equals("*") || 
			token.getImagem().equals("/")) {

			opArit();
			operan();
			exprAtrib2();
		}
	}

	/**
	 * <OpArit> ::= '+' | '-' | '*' | '/'
	 */
	private void opArit() {
		if (token.getImagem().equals("+") || token.getImagem().equals("-") || token.getImagem().equals("*") || token.getImagem().equals("/")) {
			nextToken();
		} else {
			erros.add("[opArit]. Esperado token '+' ou '-' ou '*' ou '/'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}
	}

	/**
	 * <Operan> ::= Identifier | IntegerLiteral | RealLiteral | StringLiteral |
	 * <Call> First(id) = {id} e First(<Call>) = {id}. Solu��o usar
	 * LookAhead(2). Para <Call> o lookAhead � '('
	 */
	private void operan() {
		if (token.getClasse() == Classe.Identificador) {
			Token ahead = lookAhead(token);
			if (ahead.getImagem().equals("(")) {
				call();
			} else {
				nextToken();
			}
		} else if (token.getClasse() == Classe.ConstanteLiteralInteira || token.getClasse() == Classe.ConstanteLiteralReal || token.getClasse() == Classe.ConstanteLiteralString) {
			nextToken();
		} else {
			erros.add("[operan]. Esperado token id ou IntegerLiteral ou RealLiteral ou StringLiteral. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}
	}

	/**
	 * <While> ::= 'enquanto' '(' <ExpCond> ')' <Comand>
	 */
	private void enquanto() {
		if (token.getImagem().equals("enquanto")) {
			nextToken();
		} else {
			erros.add("[enquanto]. Esperado token 'enquanto'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		if (token.getImagem().equals("(")) {
			nextToken();
		} else {
			erros.add("[enquanto]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		exprCond();

		if (token.getImagem().equals(")")) {
			nextToken();
		} else {
			erros.add("[enquanto]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		comand();
	}

	/**
	 * <ExpCond> ::= <Operan> <OpCond> <Operan>
	 */
	private void exprCond() {
		operan();
		opCond();
		operan();
	}

/**
	 * <OpCond>    ::= '>' | '<' | '>=' | '<=' | '!=' | '=='
	 */
	private void opCond() {
		if (token.getImagem().equals(">") || token.getImagem().equals("<") || token.getImagem().equals(">=") || token.getImagem().equals("<=") || token.getImagem().equals("!=")
				|| token.getImagem().equals("==")) {
			nextToken();
		} else {
			erros.add("[opCond]. Esperado token '>' ou '<' ou '>=' ou '<=' ou '!=' ou '=='. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}
	}

	/**
	 * <If> ::= 'se' '(' <ExpCond> ')' <Comand> <Else>
	 */
	private void se() {
		if (token.getImagem().equals("se")) {
			nextToken();
		} else {
			erros.add("[se]. Esperado token 'se'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		if (token.getImagem().equals("(")) {
			nextToken();
		} else {
			erros.add("[se]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		exprCond();

		if (token.getImagem().equals(")")) {
			nextToken();
		} else {
			erros.add("[se]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		comand();

		senao();

	}

	/**
	 * <Else> ::= 'senao' <Comand> |
	 */
	private void senao() {
		if (token.getImagem().equals("senao")) {
			nextToken();
			comand();
		}
	}

	/**
	 * <Ler> ::= 'ler' '(' Identifier ')'
	 */
	private void ler() {
		if (token.getImagem().equals("ler")) {
			nextToken();
		} else {
			erros.add("[ler]. Esperado token 'ler'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		if (token.getImagem().equals("(")) {
			nextToken();
		} else {
			erros.add("[ler]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		if (token.getClasse() == Classe.Identificador) {
			nextToken();
		} else {
			erros.add("[ler]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		if (token.getImagem().equals(")")) {
			nextToken();
		} else {
			erros.add("[ler]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}
	}

	/**
	 * <Ver> ::= 'ver' '(' <Operan> ')'
	 */
	private void ver() {
		if (token.getImagem().equals("ver")) {
			nextToken();
		} else {
			erros.add("[ver]. Esperado token 'ver'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		if (token.getImagem().equals("(")) {
			nextToken();
		} else {
			erros.add("[ver]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		operan();

		if (token.getImagem().equals(")")) {
			nextToken();
		} else {
			erros.add("[ver]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

	}

	/**
	 * <Ret> ::= 'ret' <Operan>
	 */
	private void ret() {
		if (token.getImagem().equals("ret")) {
			nextToken();
		} else {
			erros.add("[ret]. Esperado token 'ret'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		operan();

	}

	/**
	 * <Call> ::= Identifier '(' <ListParam> ')'
	 */
	private void call() {
		if (token.getClasse() == Classe.Identificador) {
			nextToken();
		} else {
			erros.add("[call]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		if (token.getImagem().equals("(")) {
			nextToken();
		} else {
			erros.add("[call]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}

		listParam();

		if (token.getImagem().equals(")")) {
			nextToken();
		} else {
			erros.add("[call]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return;
		}
	}

	/**
	 * <ListParam> ::= <Operan> <ListParam2> |
	 */
	private void listParam() {
		if (token.getClasse() == Classe.Identificador || token.getClasse() == Classe.ConstanteLiteralInteira || token.getClasse() == Classe.ConstanteLiteralReal
				|| token.getClasse() == Classe.ConstanteLiteralString) {

			operan();
			listParam2();
		}
	}

	/**
	 * <ListParam2> ::= ',' <Operan> <ListParam2> |
	 */
	private void listParam2() {
		if (token.getImagem().equals(",")) { // if de First e consumo de token

			nextToken();
			operan();
			listParam2();
		}

	}

	private Token lookAhead(Token token2) {
		return tokens.get(pToken);
	}



}
