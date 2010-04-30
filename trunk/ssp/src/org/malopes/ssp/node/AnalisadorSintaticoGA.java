package org.malopes.ssp.node;

import java.util.ArrayList;
import java.util.List;

import org.malopes.ssp.Classe;
import org.malopes.ssp.Simbolo;
import org.malopes.ssp.TabelaSimbolos;
import org.malopes.ssp.Token;
import org.malopes.ssp.node.NodeArg;
import org.malopes.ssp.node.NodeAtrib;
import org.malopes.ssp.node.NodeCall;
import org.malopes.ssp.node.NodeComand;
import org.malopes.ssp.node.NodeDecl;
import org.malopes.ssp.node.NodeDef;
import org.malopes.ssp.node.NodeEnquanto;
import org.malopes.ssp.node.NodeExprAtrib;
import org.malopes.ssp.node.NodeExprAtrib2;
import org.malopes.ssp.node.NodeExprCond;
import org.malopes.ssp.node.NodeLer;
import org.malopes.ssp.node.NodeListArg;
import org.malopes.ssp.node.NodeListArg2;
import org.malopes.ssp.node.NodeListComand;
import org.malopes.ssp.node.NodeListDef;
import org.malopes.ssp.node.NodeListId;
import org.malopes.ssp.node.NodeListId2;
import org.malopes.ssp.node.NodeListParam;
import org.malopes.ssp.node.NodeListParam2;
import org.malopes.ssp.node.NodeOpArit;
import org.malopes.ssp.node.NodeOpCond;
import org.malopes.ssp.node.NodeOperan;
import org.malopes.ssp.node.NodeProgram;
import org.malopes.ssp.node.NodeRet;
import org.malopes.ssp.node.NodeSe;
import org.malopes.ssp.node.NodeSenao;
import org.malopes.ssp.node.NodeTipo;
import org.malopes.ssp.node.NodeToken;
import org.malopes.ssp.node.NodeVer;
import org.malopes.ssp.node.Node;

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

	public boolean analisa() {
		pToken = 0;
		nextToken();
		raiz = program();
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
	private Node program() {
		Node nodeProgram = new NodeProgram(1);
		nodeProgram.addFilho(listDef());
		return nodeProgram;
	}

	/**
	 * <ListDef> ::= <Def> <ListDef> |
	 */
	private Node listDef() {
		Node nodeListDef = new NodeListDef(2);
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
		Node nodeDef = new NodeDef(10);
		if (token.getImagem().equals("def")) {
			nodeDef.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token 'def'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getClasse() == Classe.Identificador) {
			tokenIdFuncao = token;
			nodeDef.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[def]. Esperado token identificador de fun��o. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeDef.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeDef.addFilho(listArg());

		if (token.getImagem().equals(")")) {
			nodeDef.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token ')'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		
		if (token.getImagem().equals(":")) {
			nodeDef.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token ':'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeDef.addFilho(tipo());

		if (token.getImagem().equals("{")) {
			nodeDef.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token '{'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeDef.addFilho(listComand());

		if (token.getImagem().equals("}")) {
			nodeDef.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[AnalisadorSintatico.def]. Esperado token '}'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		
		return nodeDef;
	}

	/**
	 * <ListArg> ::= <Arg> <ListArg2> |
	 */
	private Node listArg() {
		Node nodeListArg = new NodeListArg(2);
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
		Node nodeListArg2 = new NodeListArg2(3);
		if (token.getImagem().equals(",")) {
			nodeListArg2.addFilho( new NodeToken(token) );
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
		Node nodeArg = new NodeArg(3);
		if (token.getClasse() == Classe.Identificador) {
			nodeArg.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[def]. Esperado token identificador de variavel. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals(":")) {
			nodeArg.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[def]. Esperado token ':'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
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
		Node nodeTipo = new NodeTipo(1);
		if (token.getImagem().equals("Int") || token.getImagem().equals("Real") || token.getImagem().equals("Str") || token.getImagem().equals("Nada")) {
			nodeTipo.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[def]. Esperado token 'Int' ou 'Real' ou 'Str' ou 'Nada'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
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
		Node nodeListComand = new NodeListComand(2);
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
		Node nodeComand = new NodeComand(3);
		if (token.getImagem().equals("var")) {
			nodeComand.addFilho( decl() );

			if (token.getImagem().equals(";")) {
				nodeComand.addFilho( new NodeToken(token) );
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
				nodeComand.addFilho( new NodeToken(token) );
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
				nodeComand.addFilho( new NodeToken(token) );
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return null;
			}
		} else if (token.getImagem().equals("ver")) {
			nodeComand.addFilho( ver() );

			if (token.getImagem().equals(";")) {
				nodeComand.addFilho( new NodeToken(token) );
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return null;
			}
		} else if (token.getImagem().equals("ret")) {
			nodeComand.addFilho( ret() );
			
			if (token.getImagem().equals(";")) {
				nodeComand.addFilho( new NodeToken(token) );
				nextToken();
			} else {
				erros.add("[comand]. Esperado token ';'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
				// resincronizar();
				return null;
			}
			
		} else if (token.getImagem().equals("{")) {
			nodeComand.addFilho( new NodeToken(token) );
			nextToken();

			nodeComand.addFilho( listComand() );

			if (token.getImagem().equals("}")) {
				nodeComand.addFilho( new NodeToken(token) );
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
		Node nodeDecl = new NodeDecl(4);
		if (token.getImagem().equals("var")) {
			nodeDecl.addFilho( new NodeToken(token) );
			nextToken();
		} else {
			erros.add("[decl]. Esperado token 'var'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}
		
		nodeDecl.addFilho( listId() );
		
		if (token.getImagem().equals(":")) {
			nodeDecl.addFilho( new NodeToken(token) );
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
		Node nodeListId = new NodeListId(2);
		if (token.getClasse() == Classe.Identificador) {
			nodeListId.addFilho( new NodeToken(token) );
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
		Node nodeListId2 = new NodeListId2(3);
		if (token.getImagem().equals(",")) {
			
			nodeListId2.addFilho( new NodeToken(token) );
			nextToken();
		
			if (token.getClasse() == Classe.Identificador) {
				nodeListId2.addFilho( new NodeToken(token) );
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
		Node nodeAtrib = new NodeAtrib(3);
		if (token.getClasse() == Classe.Identificador) {
			nodeAtrib.addFilho( new NodeToken(token) );
			nextToken();
		} else {
			erros.add("[atrib]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("=")) {
			nodeAtrib.addFilho( new NodeToken(token) );
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
		Node nodeExprAtrib = new NodeExprAtrib(2);
		nodeExprAtrib.addFilho( operan() );
		nodeExprAtrib.addFilho( exprAtrib2() );
		return nodeExprAtrib;
	}

	/**
	 * <ExpAtrib2> ::= <OpArit> <Operan> <ExpAtrib2> |
	 */
	private Node exprAtrib2() {
		Node nodeExprAtrib2 = new NodeExprAtrib2(3);
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
		Node nodeOpArit = new NodeOpArit(1);
		if (token.getImagem().equals("+") || token.getImagem().equals("-") || token.getImagem().equals("*") || token.getImagem().equals("/")) {
			nodeOpArit.addFilho(new NodeToken(token));
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
		Node nodeOperan = new NodeOperan(1);
		if (token.getClasse() == Classe.Identificador) {
			Token ahead = lookAhead(token);
			if (ahead.getImagem().equals("(")) {
				nodeOperan.addFilho( call() );
			} else {
				nodeOperan.addFilho(new NodeToken(token));
				nextToken();
			}
		} else if (token.getClasse() == Classe.ConstanteLiteralInteira || token.getClasse() == Classe.ConstanteLiteralReal || token.getClasse() == Classe.ConstanteLiteralString) {
			nodeOperan.addFilho(new NodeToken(token));
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
		Node nodeEnquanto = new NodeEnquanto(5);
		if (token.getImagem().equals("enquanto")) {
			nodeEnquanto.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[enquanto]. Esperado token 'enquanto'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeEnquanto.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[enquanto]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeEnquanto.addFilho( exprCond() );

		if (token.getImagem().equals(")")) {
			nodeEnquanto.addFilho(new NodeToken(token));
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
		Node nodeExprCond = new NodeExprCond(3);
		nodeExprCond.addFilho( operan() );
		nodeExprCond.addFilho( opCond() );
		nodeExprCond.addFilho( operan() );
		return nodeExprCond;
	}

/**
	 * <OpCond>    ::= '>' | '<' | '>=' | '<=' | '!=' | '=='
	 */
	private Node opCond() {
		Node nodeOpCond = new NodeOpCond(1);
		if (token.getImagem().equals(">") || token.getImagem().equals("<") || token.getImagem().equals(">=") || token.getImagem().equals("<=") || token.getImagem().equals("!=")
				|| token.getImagem().equals("==")) {
			nodeOpCond.addFilho(new NodeToken(token));
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
		Node nodeSe = new NodeSe(6);
		if (token.getImagem().equals("se")) {
			nodeSe.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[se]. Esperado token 'se'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeSe.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[se]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeSe.addFilho( exprCond() );

		if (token.getImagem().equals(")")) {
			nodeSe.addFilho(new NodeToken(token));
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
		Node nodeSenao = new NodeSenao(2);
		if (token.getImagem().equals("senao")) {
			nodeSenao.addFilho(new NodeToken(token));
			nextToken();
			nodeSenao.addFilho( comand() );
		}
		return nodeSenao;
	}

	/**
	 * <Ler> ::= 'ler' '(' Identifier ')'
	 */
	private Node ler() {
		Node nodeLer = new NodeLer(4);
		if (token.getImagem().equals("ler")) {
			nodeLer.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[ler]. Esperado token 'ler'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeLer.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[ler]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getClasse() == Classe.Identificador) {
			nodeLer.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[ler]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals(")")) {
			nodeLer.addFilho(new NodeToken(token));
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
		Node nodeVer = new NodeVer(4);
		if (token.getImagem().equals("ver")) {
			nodeVer.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[ver]. Esperado token 'ver'. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeVer.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[ver]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeVer.addFilho( operan() );

		if (token.getImagem().equals(")")) {
			nodeVer.addFilho(new NodeToken(token));
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
		Node nodeRet = new NodeRet(2);
		if (token.getImagem().equals("ret")) {
			nodeRet.addFilho(new NodeToken(token));
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
		Node nodeCall = new NodeCall(4);
		if (token.getClasse() == Classe.Identificador) {
			nodeCall.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[call]. Esperado token id. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		if (token.getImagem().equals("(")) {
			nodeCall.addFilho(new NodeToken(token));
			nextToken();
		} else {
			erros.add("[call]. Esperado token '('. Linha: " + token.getLinha() + ", coluna: " + token.getColuna());
			// resincronizar();
			return null;
		}

		nodeCall.addFilho( listParam() );

		if (token.getImagem().equals(")")) {
			nodeCall.addFilho(new NodeToken(token));
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
		Node nodeListParam = new NodeListParam(2);
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
		Node nodeListParam2 = new NodeListParam2(3);
		if (token.getImagem().equals(",")) { // if de First e consumo de token
			nodeListParam2.addFilho(new NodeToken(token));
			nextToken();
			nodeListParam2.addFilho( operan() );
			nodeListParam2.addFilho( listParam2() );
		}
		
		return nodeListParam2;
	}

	private Token lookAhead(Token token2) {
		return tokens.get(pToken);
	}

}
