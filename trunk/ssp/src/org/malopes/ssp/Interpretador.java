package org.malopes.ssp;

import java.util.HashMap;
import java.util.Map;
import java.util.Stack;
import java.util.Map.Entry;

public class Interpretador {

	private Node raiz;
	private Map<String, Node> mapDefs;
	private Stack<HashMap<String, Object>> pilha = new Stack<HashMap<String, Object>>();

	public Interpretador(Node raiz) {
		this.raiz = raiz;
	}

	public void interpretar() {
		mapDefs = getDefs();
		Node defPrincipal = mapDefs.get("principal");
		for (Entry<String, Node> entrada : mapDefs.entrySet()) {
			System.out.println(entrada.getKey() + " -> " + entrada.getValue().getFilho(0).getToken().getImagem() + " : " + entrada.getValue().getFilho(1).getToken().getImagem());
		}
		interpretar(defPrincipal);
		/*
		 * mostraTipoNo(no, espacamento); if (no != null && no.getFilhos() !=
		 * null){ for(Node node: no.getFilhos()){ mostraNo(node,
		 * espacamento+"    "); } }
		 */
	}

	private Object interpretar(Node node) {
		switch (node.getTipo()) {
		case Def:
			def(node);
			break;

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
	 * <def> ::= 'def' Identifier '(' <ListArg> ')' ':' <Tipo> '{' <ListComand>
	 * '}'
	 */
	private Object def(Node node) {
		HashMap<String, Object> stackFrame = new HashMap<String, Object>();
		populaStackFrame(stackFrame, node.getFilho(1));
		pilha.push(stackFrame);
		interpretar(node.getFilho(8)); // ListComand
		pilha.pop();
		return null;
	}

	private void populaStackFrame(HashMap<String, Object> stackFrame, Node defId) {
		for(Simbolo simb : TabelaSimbolos.getSimbolosByEscopo(defId.getToken().getImagem())) {
			stackFrame.put(simb.getToken().getImagem(), simb.getValor());
		}
	}

	private Map<String, Node> getDefs() {
		Map<String, Node> mapDefsLocal = new HashMap<String, Node>();
		Node listDef = raiz.getFilho(0);
		addDefsRec(listDef, mapDefsLocal);
		return mapDefsLocal;
	}

	private void addDefsRec(Node listDef, Map<String, Node> mapDefsLocal) {
		if (listDef.getFilhos().size() > 0) {
			Node def = listDef.getFilho(0);
			String idDef = def.getFilho(1).getToken().getImagem();
			mapDefsLocal.put(idDef, def);
			addDefsRec(listDef.getFilho(1), mapDefsLocal);
		}
	}

	/**
	 * <ListComand> ::= <Comand> <ListComand> |
	 */
	private Object listComand(Node node) {
		if (node.getFilhos().size() > 0) {
			interpretar(node.getFilho(0)); // Comand
			interpretar(node.getFilho(1)); // ListComand
		}

		return null;
	}

	/**
	 * <Comand> ::= <Decl> ';' | <Atrib> ';' | <While> | <If> | <Ler> ';' |
	 * <Ver> ';' | <Ret> ';' | <Call> ';' | '{' <ListComand> '}'
	 */
	private Object comand(Node node) {
		if (node.getFilhos().size() > 2) {
			interpretar(node.getFilho(1));
		} else {
			interpretar(node.getFilho(0));
		}
		return null;
	}

	/**
	 * <Atrib> ::= Identifier '=' <ExpAtrib>
	 */
	private Object atrib(Node node) {
		Object exprAtrib = interpretar(node.getFilho(2));
		TabelaSimbolos.setValor(node.getFilho(0).getToken(), exprAtrib);
		return null;
	}

	/**
	 * <ExpAtrib> ::= <Operan> <ExpAtrib2>
	 */
	private Object exprAtrib(Node node) {
		Object operan = interpretar(node.getFilho(0));
		if (node.getFilho(1).getFilhos().size() > 0) {
			String operador = node.getFilho(1).getFilho(0).getFilho(0).getToken().getImagem();
			Object exprAtrib2 = interpretar(node.getFilho(1));
			return calcula(operan, exprAtrib2, operador);
		}
		return operan;
	}

	private Object calcula(Object operan, Object exprAtrib2, String operador) {
		if ("+".equals(operador)) {
			return soma(operan, exprAtrib2);
		}
		return null;
	}

	private Object soma(Object operan, Object exprAtrib2) {

		if (operan instanceof Integer) {
			return (Integer) operan + (Integer) exprAtrib2;
		} else if(operan instanceof Double) {
			return (Integer) operan + (Integer) exprAtrib2;
		}
		return null;
	}

	/**
	 * <ExpAtrib2> ::= <OpArit> <Operan> <ExpAtrib2> |
	 */
	private Object exprAtrib2(Node node) {
		Object operan = interpretar(node.getFilho(1));
		if (node.getFilho(2).getFilhos().size() > 0) {
			String operador = node.getFilho(2).getFilho(0).getToken().getImagem();
			Object exprAtrib2 = interpretar(node.getFilho(2));
			return calcula(operan, exprAtrib2, operador);
		}
		return operan;
	}
	

	/**
	 * <Operan>   ::= Identifier | IntegerLiteral | RealLiteral | StringLiteral | <Call>
	 */
	private Object operan(Node node) {
		Token operan = node.getFilho(0).getToken();
		if (operan.getClasse() == Classe.Identificador) {
			return TabelaSimbolos.getValor(operan);
		} else {
			return imagemToValor(operan);
		}
		
	}

	private Object imagemToValor(Token operan) {
		switch (operan.getClasse()) {
		case ConstanteLiteralInteira:
			return new Integer(operan.getImagem());
		case ConstanteLiteralString:
			return operan.getImagem();
		case ConstanteLiteralReal:
			return new Double(operan.getImagem());
		default:
			return null;
		} 
	}

}
