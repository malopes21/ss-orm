package org.malopes.ssp;

import java.util.ArrayList;
import java.util.List;

public class AnalisadorSintaticoGA {

	private int pToken;
	private Token token;
	private List<Token> tokens;
	private List<String> erros = new ArrayList<String>();
	private Token tokenIdFuncao;
	private String escopoAtual;
	private Node raiz;

	public AnalisadorSintaticoGA(List<Token> tokens) {
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
	
	public Node getRaiz() {
		return raiz;
	}

	public boolean analisa() {
		pToken = 0;
		nextToken();
		raiz = program();
		if (token.getClasse() != Classe.EOF) {
			erros.add("[analisa]. Esperado token 'def'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
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
	private Node program() {
		Node nodeProgram = new Node(1, TipoOfNode.Program);
		nodeProgram.addFilho(listDef());
		return nodeProgram;
	}

	/**
	 * <ListDef> ::= <Def> <ListDef> |
	 */
	private Node listDef() {
		Node nodeListDef = new Node(2, TipoOfNode.ListDef);
		if (token.getImagem().equals("def")) { // if de first
			nodeListDef.addFilho(def());
			nodeListDef.addFilho(listDef());
		}
		return nodeListDef;
	}

	/**
	 * <def> ::= 'def' Identifier '(' <ListArg> ')' ':' <Tipo> '{' <ListComand>	 '}'
	 */
	private Node def() {
		Node nodeDef = new Node(10, TipoOfNode.Def);
		if (token.getImagem().equals("def")) {
			nodeDef.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[def]. Esperado token 'def'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getClasse() == Classe.Identificador) {
			tokenIdFuncao = token;
			nodeDef.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[def]. Esperado token identificador de fun��o. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeDef.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[def]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeDef.addFilho(listArg());

		if (token.getImagem().equals(")")) {
			nodeDef.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[def]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		
		if (token.getImagem().equals(":")) {
			nodeDef.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[def]. Esperado token ':'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeDef.addFilho(tipo());

		if (token.getImagem().equals("{")) {
			nodeDef.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[def]. Esperado token '{'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeDef.addFilho(listComand());

		if (token.getImagem().equals("}")) {
			nodeDef.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[def]. Esperado token '}'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		
		return nodeDef;
	}

	/**
	 * <ListArg> ::= <Arg> <ListArg2> |
	 */
	private Node listArg() {
		Node nodeListArg = new Node(2, TipoOfNode.ListArg);
		if (token.getClasse() == Classe.Identificador) { // if de first
			nodeListArg.addFilho( arg() );
			nodeListArg.addFilho( listArg2() );
		}
		return nodeListArg;
	}

	/**
	 * <ListArg2> ::= ',' <Arg> <ListArg2> |
	 */
	private Node listArg2() {
		Node nodeListArg2 = new Node(3, TipoOfNode.ListArg2);
		if (token.getImagem().equals(",")) {
			nodeListArg2.addFilho( new Node(token) );
			nextToken();
			nodeListArg2.addFilho( arg() );
			nodeListArg2.addFilho( listArg2() );
		}
		return nodeListArg2;
	}

	/**
	 * <Arg> ::= Identifier ':' <Tipo>
	 */
	private Node arg() {
		Node nodeArg = new Node(3, TipoOfNode.Arg);
		if (token.getClasse() == Classe.Identificador) {
			nodeArg.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[arg]. Esperado token identificador de variavel. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals(":")) {
			nodeArg.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[arg]. Esperado token ':'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeArg.addFilho( tipo() );
		return nodeArg;
	}

	/**
	 * <Tipo> ::= 'Int' | 'Real' | 'Str' | 'Nada'
	 */
	private Node tipo() {
		Node nodeTipo = new Node(1, TipoOfNode.Tipo);
		if (token.getImagem().equals("Int") || token.getImagem().equals("Real") || token.getImagem().equals("Str") || token.getImagem().equals("Nada")) {
			nodeTipo.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[tipo]. Esperado token 'Int' ou 'Real' ou 'Str' ou 'Nada'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		return nodeTipo;
	}

	/**
	 * <ListComand> ::= <Comand> <ListComand> | 
	 * First: var id id enquanto se ler ver ret {
	 */
	private Node listComand() {
		Node nodeListComand = new Node(2, TipoOfNode.ListComand);
		if (token.getImagem().equals("var")
				|| // if de first
				token.getClasse() == Classe.Identificador
				|| // conflito de analise preditiva: usar LookAhead(2) no metodo
					// comand()
				token.getImagem().equals("enquanto") || token.getImagem().equals("se") || token.getImagem().equals("ler") || token.getImagem().equals("ver")
				|| token.getImagem().equals("ret")) {

			nodeListComand.addFilho( comand() );
			nodeListComand.addFilho( listComand() );
		}
		return nodeListComand;
	}

	/**
	 * <Comand> ::= <Decl> ';' | <Atrib> ';' | <While> | <If> | <Ler> ';' |
	 * <Ver> ';' | <Ret> ';' | <Call> ';' | '{' <ListComand> '}' 
	 * First(<Atrib> * ';') = {id} e First(<Call> ';') = {id}. Solucao usar LookAhead(2). Para
	 * <Atrib> o lookAhead eh '=' e para <Call> o lookAhead eh '('
	 */
	private Node comand() {
		Node nodeComand = new Node(3, TipoOfNode.Comand);
		if (token.getImagem().equals("var")) {
			nodeComand.addFilho( decl() );

			if (token.getImagem().equals(";")) {
				nodeComand.addFilho( new Node(token) );
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return null;
			}

		} else if (token.getClasse() == Classe.Identificador) {
			Token ahead = lookAhead(token);
			if (ahead.getImagem().equals("=")) {
				nodeComand.addFilho( atrib() );
			} else if (ahead.getImagem().equals("(")) {
				nodeComand.addFilho( call() );
			} else {
				erros.add("[comand]. Esperado token de lookahead '=' ou '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return null;
			}
			
			if (token.getImagem().equals(";")) {
				nodeComand.addFilho( new Node(token) );
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return null;
			}
			
		} else if (token.getImagem().equals("enquanto")) {
			nodeComand.addFilho( enquanto() );
		} else if (token.getImagem().equals("se")) {
			nodeComand.addFilho( se() );
		} else if (token.getImagem().equals("ler")) {
			nodeComand.addFilho( ler() );

			if (token.getImagem().equals(";")) {
				nodeComand.addFilho( new Node(token) );
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return null;
			}
		} else if (token.getImagem().equals("ver")) {
			nodeComand.addFilho( ver() );

			if (token.getImagem().equals(";")) {
				nodeComand.addFilho( new Node(token) );
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return null;
			}
		} else if (token.getImagem().equals("ret")) {
			nodeComand.addFilho( ret() );
			
			if (token.getImagem().equals(";")) {
				nodeComand.addFilho( new Node(token) );
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return null;
			}
			
		} else if (token.getImagem().equals("{")) {
			nodeComand.addFilho( new Node(token) );
			nextToken();

			nodeComand.addFilho( listComand() );

			if (token.getImagem().equals("}")) {
				nodeComand.addFilho( new Node(token) );
				nextToken();
			} else {
				erros.add("[comand]. Esperado token '}'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return null;
			}
		} else {
			erros.add("[comand]. Esperado token id ou 'var' ou 'enquanto' ou 'se' ou 'ler' ou 'ver' ou 'ret' ou '{'. Linha: " + token.getLinha() + ", coluna: "
							+ token.getColuna());
			// resincronizar();
			return null;
		}
		return nodeComand;
	}
	
	/**
	 * <Decl>  ::= 'var' <ListId> ':' <Tipo>
	 */
	private Node decl() {
		Node nodeDecl = new Node(4, TipoOfNode.Decl);
		if (token.getImagem().equals("var")) {
			nodeDecl.addFilho( new Node(token) );
			nextToken();
		} else {
			erros.add("[decl]. Esperado token 'var'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		
		nodeDecl.addFilho( listId() );
		
		if (token.getImagem().equals(":")) {
			nodeDecl.addFilho( new Node(token) );
			nextToken();
		} else {
			erros.add("[decl]. Esperado token ':'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		
		nodeDecl.addFilho( tipo() );
		return nodeDecl;
	}

	/**
	 * <ListId> ::= Identifier <ListId2> 
	 */
	private Node listId() {
		Node nodeListId = new Node(2, TipoOfNode.ListId);
		if (token.getClasse() == Classe.Identificador) {
			nodeListId.addFilho( new Node(token) );
			nextToken();
		} else {
			erros.add("[listId]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		
		nodeListId.addFilho( listId2() );
		return nodeListId;
	}

	/**
	 * <ListId2>  ::=  ',' Identifier <ListId2> | 
	 */
	private Node listId2() {
		Node nodeListId2 = new Node(3, TipoOfNode.ListId2);
		if (token.getImagem().equals(",")) {
			
			nodeListId2.addFilho( new Node(token) );
			nextToken();
		
			if (token.getClasse() == Classe.Identificador) {
				nodeListId2.addFilho( new Node(token) );
				nextToken();
			} else {
				erros.add("[listId2]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return null;
			}
			
			nodeListId2.addFilho( listId2() );
		}
		return nodeListId2;
	}

	/**
	 * <Atrib> ::= Identifier '=' <ExpAtrib>
	 */
	private Node atrib() {
		Node nodeAtrib = new Node(3, TipoOfNode.Atrib);
		if (token.getClasse() == Classe.Identificador) {
			nodeAtrib.addFilho( new Node(token) );
			nextToken();
		} else {
			erros.add("[atrib]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("=")) {
			nodeAtrib.addFilho( new Node(token) );
			nextToken();
		} else {
			erros.add("[atrib]. Esperado token '='. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeAtrib.addFilho( exprAtrib() );
		return nodeAtrib;
	}

	/**
	 * <ExpAtrib> ::= <Operan> <ExpAtrib2>
	 */
	private Node exprAtrib() {
		Node nodeExprAtrib = new Node(2, TipoOfNode.ExprAtrib);
		nodeExprAtrib.addFilho( operan() );
		nodeExprAtrib.addFilho( exprAtrib2() );
		return nodeExprAtrib;
	}

	/**
	 * <ExpAtrib2> ::= <OpArit> <Operan> <ExpAtrib2> |
	 */
	private Node exprAtrib2() {
		Node nodeExprAtrib2 = new Node(3, TipoOfNode.ExprAtrib2);
		if (token.getImagem().equals("+") || // if de First
			token.getImagem().equals("-") || 
			token.getImagem().equals("*") || 
			token.getImagem().equals("/")) {

			nodeExprAtrib2.addFilho( opArit() );
			nodeExprAtrib2.addFilho( operan() );
			nodeExprAtrib2.addFilho( exprAtrib2() );
		}
		return nodeExprAtrib2;
	}

	/**
	 * <OpArit> ::= '+' | '-' | '*' | '/'
	 */
	private Node opArit() {
		Node nodeOpArit = new Node(1, TipoOfNode.OpArit);
		if (token.getImagem().equals("+") || token.getImagem().equals("-") || token.getImagem().equals("*") || token.getImagem().equals("/")) {
			nodeOpArit.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[opArit]. Esperado token '+' ou '-' ou '*' ou '/'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		return nodeOpArit;
	}

	/**
	 * <Operan> ::= Identifier | IntegerLiteral | RealLiteral | StringLiteral | <Call> 
	 * First(id) = {id} e First(<Call>) = {id}. Solucao usar
	 * LookAhead(2). Para <Call> o lookAhead eh '('
	 */
	private Node operan() {
		Node nodeOperan = new Node(1, TipoOfNode.Operan);
		if (token.getClasse() == Classe.Identificador) {
			Token ahead = lookAhead(token);
			if (ahead.getImagem().equals("(")) {
				nodeOperan.addFilho( call() );
			} else {
				nodeOperan.addFilho(new Node(token));
				nextToken();
			}
		} else if (token.getClasse() == Classe.ConstanteLiteralInteira || token.getClasse() == Classe.ConstanteLiteralReal || token.getClasse() == Classe.ConstanteLiteralString) {
			nodeOperan.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[operan]. Esperado token id ou IntegerLiteral ou RealLiteral ou StringLiteral. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		return nodeOperan;
	}

	/**
	 * <While> ::= 'enquanto' '(' <ExpCond> ')' <Comand>
	 */
	private Node enquanto() {
		Node nodeEnquanto = new Node(5, TipoOfNode.Enquanto);
		if (token.getImagem().equals("enquanto")) {
			nodeEnquanto.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[enquanto]. Esperado token 'enquanto'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeEnquanto.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[enquanto]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeEnquanto.addFilho( exprCond() );

		if (token.getImagem().equals(")")) {
			nodeEnquanto.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[enquanto]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeEnquanto.addFilho( comand() );
		return nodeEnquanto;
	}

	/**
	 * <ExpCond> ::= <Operan> <OpCond> <Operan>
	 */
	private Node exprCond() {
		Node nodeExprCond = new Node(3, TipoOfNode.ExprCond);
		nodeExprCond.addFilho( operan() );
		nodeExprCond.addFilho( opCond() );
		nodeExprCond.addFilho( operan() );
		return nodeExprCond;
	}

/**
	 * <OpCond>    ::= '>' | '<' | '>=' | '<=' | '!=' | '=='
	 */
	private Node opCond() {
		Node nodeOpCond = new Node(1, TipoOfNode.OpCond);
		if (token.getImagem().equals(">") || token.getImagem().equals("<") || token.getImagem().equals(">=") || token.getImagem().equals("<=") || token.getImagem().equals("!=")
				|| token.getImagem().equals("==")) {
			nodeOpCond.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[opCond]. Esperado token '>' ou '<' ou '>=' ou '<=' ou '!=' ou '=='. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		return nodeOpCond;
	}

	/**
	 * <If> ::= 'se' '(' <ExpCond> ')' <Comand> <Else>
	 */
	private Node se() {
		Node nodeSe = new Node(6, TipoOfNode.Se);
		if (token.getImagem().equals("se")) {
			nodeSe.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[se]. Esperado token 'se'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeSe.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[se]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeSe.addFilho( exprCond() );

		if (token.getImagem().equals(")")) {
			nodeSe.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[se]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeSe.addFilho( comand() );

		nodeSe.addFilho( senao() );

		return nodeSe;
	}

	/**
	 * <Else> ::= 'senao' <Comand> |
	 */
	private Node senao() {
		Node nodeSenao = new Node(2, TipoOfNode.Senao);
		if (token.getImagem().equals("senao")) {
			nodeSenao.addFilho(new Node(token));
			nextToken();
			nodeSenao.addFilho( comand() );
		}
		return nodeSenao;
	}

	/**
	 * <Ler> ::= 'ler' '(' Identifier ')'
	 */
	private Node ler() {
		Node nodeLer = new Node(4, TipoOfNode.Ler);
		if (token.getImagem().equals("ler")) {
			nodeLer.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[ler]. Esperado token 'ler'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeLer.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[ler]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getClasse() == Classe.Identificador) {
			nodeLer.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[ler]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals(")")) {
			nodeLer.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[ler]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		
		return nodeLer;
	}

	/**
	 * <Ver> ::= 'ver' '(' <Operan> ')'
	 */
	private Node ver() {
		Node nodeVer = new Node(4, TipoOfNode.Ver);
		if (token.getImagem().equals("ver")) {
			nodeVer.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[ver]. Esperado token 'ver'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeVer.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[ver]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeVer.addFilho( operan() );

		if (token.getImagem().equals(")")) {
			nodeVer.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[ver]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		
		return nodeVer;

	}

	/**
	 * <Ret> ::= 'ret' <Operan>
	 */
	private Node ret() {
		Node nodeRet = new Node(2, TipoOfNode.Ret);
		if (token.getImagem().equals("ret")) {
			nodeRet.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[ret]. Esperado token 'ret'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeRet.addFilho( operan() );
		
		return nodeRet;
	}

	/**
	 * <Call> ::= Identifier '(' <ListParam> ')'
	 */
	private Node call() {
		Node nodeCall = new Node(4, TipoOfNode.Call);
		if (token.getClasse() == Classe.Identificador) {
			nodeCall.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[call]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeCall.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[call]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeCall.addFilho( listParam() );

		if (token.getImagem().equals(")")) {
			nodeCall.addFilho(new Node(token));
			nextToken();
		} else {
			erros.add("[call]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		
		return nodeCall;
	}

	/**
	 * <ListParam> ::= <Operan> <ListParam2> |
	 */
	private Node listParam() {
		Node nodeListParam = new Node(2, TipoOfNode.ListParam);
		if (token.getClasse() == Classe.Identificador || token.getClasse() == Classe.ConstanteLiteralInteira || token.getClasse() == Classe.ConstanteLiteralReal
				|| token.getClasse() == Classe.ConstanteLiteralString) {

			nodeListParam.addFilho( operan() );
			nodeListParam.addFilho( listParam2() );
		}
		return nodeListParam;
	}

	/**
	 * <ListParam2> ::= ',' <Operan> <ListParam2> |
	 */
	private Node listParam2() {
		Node nodeListParam2 = new Node(3, TipoOfNode.ListParam2);
		if (token.getImagem().equals(",")) { // if de First e consumo de token
			nodeListParam2.addFilho(new Node(token));
			nextToken();
			nodeListParam2.addFilho( operan() );
			nodeListParam2.addFilho( listParam2() );
		}
		
		return nodeListParam2;
	}

	private Token lookAhead(Token token2) {
		return tokens.get(pToken);
	}

	public void mostraArvore() {
		String espacamento = "";
		System.out.println("");
		mostraNo(raiz, espacamento);
	}

	private void mostraNo(Node no, String espacamento) {
		mostraTipoNo(no, espacamento);
		if (no != null && no.getFilhos() != null){
			for(Node node: no.getFilhos()){
				mostraNo(node, espacamento+"    ");
			}
		}
	}

	private void mostraTipoNo(Node no, String espacamento) {
		if (no.getTipo() == TipoOfNode.Token) {
			//System.out.println(espacamento+"Token("+no.getToken().getImagem()+")");
			System.out.println(espacamento+no.getToken().getImagem());
		} else {
			System.out.println(espacamento+no.getTipo().name());
		}
	}


}
