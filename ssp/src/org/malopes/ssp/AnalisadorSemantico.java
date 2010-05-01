package org.malopes.ssp;

import java.io.ObjectInputStream.GetField;
import java.util.ArrayList;
import java.util.List;

public class AnalisadorSemantico {

	private Node raiz;
	private List<String> erros = new ArrayList<String>();
	
	public AnalisadorSemantico(Node raiz) {
		this.raiz = raiz;
	}

	public boolean analisar() {
		analisar(raiz);
		if (erros.size() == 0) {
			return true;
		}
		return false;
	}

	private Object analisar(Node node) {
		switch (node.getTipo()) {
		case Program:
			program(node);
			break;

		case ListDef:
			listDef(node);
			break;
		
		case Def:
			def(node);
			break;

		case ListArg:
			listArg(node);
			break;

		case ListArg2:
			listArg2(node);
			break;
		
		case Arg:
			arg(node);
			break;
			
		case Tipo:
			return tipo(node);
		
		case ListComand:
			listComand(node);
			break;
		
		case Comand:
			comand(node);
			break;

		case Atrib:
			atrib(node);
			break;

		case ExprAtrib:
			return exprAtrib(node);

		case ExprAtrib2:
			return exprAtrib2(node);
			
		case Operan:
			return operan(node);
			
		default:
			System.out.println("Tipo de node desconhecido: " + node.getTipo().name());
			break;
		}
		return null;
	}

	/**
	 * <Program>   ::= <ListDef>
	 */
	private void program(Node node) {
		analisar(node.getFilho(0));
	}

	/**
	 * <ListDef>   ::= <Def> <ListDef> |
	 */
	private void listDef(Node node) {
		for(Node no : node.getFilhos()) {
			analisar(no);
		}
	}
	
	/**
	 * <def> ::= 'def' Identifier '(' <ListArg> ')' ':' <Tipo> '{' <ListComand>
	 * '}'
	 */
	private Object def(Node node) {
		String tipo = (String) analisar(node.getFilho(6));
		Token id = node.getFilho(1).getToken();
		String tipoBuscado = TabelaSimbolos.getTipoSimbolo(id);
		if (tipoBuscado != null) {
			erros.add("Erro semantico: identificador de funcao '" + id.getImagem() + "' redeclarado! Linha: " + id.getLinha() + ", coluna: " + id.getColuna() );
		}
		TabelaSimbolos.setTipoSimbolo(id, tipo);
		
		analisar(node.getFilho(3));
		analisar(node.getFilho(8));
		return null;
	}

	/**
	 *	<ListArg>   ::= <Arg> <ListArg2> | 
	 */
	private void listArg(Node node) {
		if (node.getFilhos().size() > 0) {
			analisar(node.getFilho(0));
			analisar(node.getFilho(1));
		}
	}
	
	/**
	 * <ListArg2>  ::= ',' <Arg> <ListArg2> |
	 */
	private void listArg2(Node node) {
		if (node.getFilhos().size() > 0) {
			analisar(node.getFilho(1));
			analisar(node.getFilho(2));
		}
	}

	/**
	 * <Arg>       ::= Identifier ':' <Tipo>
	 */
	private void arg(Node node) {
		String tipo = (String) analisar(node.getFilho(2));
		Token id = node.getFilho(0).getToken();
		String tipoBuscado = TabelaSimbolos.getTipoSimbolo(id);
		if (tipoBuscado != null) {
			erros.add("Erro semantico: identificador de argumento '" + id.getImagem() + "' redeclarado! Linha: " + id.getLinha() + ", coluna: " + id.getColuna() );
		}
		TabelaSimbolos.setTipoSimbolo(id, tipo);
		
	}
	
	/**
	 * <Tipo>      ::= 'Int' | 'Real' | 'Str' | 'Nada'
	 */
	private Object tipo(Node node) {
		return node.getFilho(0).getToken().getImagem();
	}
	
	/**
	 * <ListComand> ::= <Comand> <ListComand> |
	 */
	private Object listComand(Node node) {
		if(node.getFilhos().size() > 0) {
			analisar(node.getFilho(0));
			analisar(node.getFilho(1));	
		}
		
		return null;
	}

	/**
	 * <Comand> ::= <Decl> ';' | <Atrib> ';' | <While> | <If> | <Ler> ';' |
	 * <Ver> ';' | <Ret> ';' | <Call> ';' | '{' <ListComand> '}'
	 */
	private Object comand(Node node) {
		
		if(node.getFilhos().size() < 3) {
			analisar(node.getFilho(0));
		} else {
			analisar(node.getFilho(1));
		}
		
		return null;
	}

	/**
	 * <Atrib> ::= Identifier '=' <ExpAtrib>
	 */
	private Object atrib(Node node) {
		Token id = node.getFilho(0).getToken();
		List<Token> listOperan = (List<Token>) analisar(node.getFilho(2));
		
		String tipoId = TabelaSimbolos.getTipoSimbolo(id);
		if (tipoId == null) {
			erros.add("Erro semantico: identificador de variável '" + id.getImagem() + "' não declarado! Linha: " + id.getLinha() + ", coluna: " + id.getColuna() );
		} else {
			for(Token operan : listOperan) {
				String tipoOperan = null;
				if(operan.getClasse() == Classe.Identificador) {
					tipoOperan = TabelaSimbolos.getTipoSimbolo(operan);
					if (tipoOperan == null) {
						erros.add("Erro semantico: identificador de variável '" + operan.getImagem() + "' não declarado! Linha: " + operan.getLinha() + ", coluna: " + operan.getColuna() );
						break;
					}
				} else {
					tipoOperan = TabelaSimbolos.getTipoCompativel(operan.getClasse());
				}
				if (!tipoId.equals(tipoOperan)) {
					erros.add("Erro semantico: operando '" + operan.getImagem() + "' com tipo incimpativel! Linha: " + operan.getLinha() + ", coluna: " + operan.getColuna() );
					break;
				}
			}
		}
		
		return null;
	}

	/**
	 * <ExpAtrib> ::= <Operan> <ExpAtrib2>
	 */
	private Object exprAtrib(Node node) {
		Token operan = (Token) analisar(node.getFilho(0));
		List<Token> listOperan = (List<Token>) analisar(node.getFilho(1));
		listOperan.add(operan);
		
		return listOperan;
	}

	/**
	 * <ExpAtrib2> ::= <OpArit> <Operan> <ExpAtrib2> |
	 */
	private Object exprAtrib2(Node node) {
		if(node.getFilhos().size() == 0) {
			return new ArrayList<Token>();
		}
				
		Token operan = (Token) analisar(node.getFilho(1));
		List<Token> listOperan = (List<Token>) analisar(node.getFilho(2));
		listOperan.add(operan);
		
		return listOperan;
	}

	/**
	 * <Operan>   ::= Identifier | IntegerLiteral | RealLiteral | StringLiteral | <Call>
	 */
	private Object operan(Node node) {
		return node.getFilho(0);
	}

	public void mostraErros() {
		for (String erro : erros) {
			System.err.println(erro);
		}
	}
	
	
}
