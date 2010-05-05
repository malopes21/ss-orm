package org.malopes.ssp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
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
		/*for (Entry<String, Node> entrada : mapDefs.entrySet()) {
			System.out.println(entrada.getKey() + " -> " + entrada.getValue().getFilho(0).getToken().getImagem() + " : " + entrada.getValue().getFilho(1).getToken().getImagem());
		}*/
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
			return def(node);

		case ListComand:
			listComand(node);
			break;

		case Comand:
			comand(node);
			break;

		case Decl:
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
			
		case Ver:
			ver(node);
			break;
			
		case Ler:
			ler(node);
			break;
			
		case Enquanto:
			enquanto(node);
			break;
			
		case ExprCond:
			return expCond(node);
			
		case Se:
			se(node);
			break;
			
		case Senao:
			senao(node);
			break;
			
		case Call:
			return call(node);
			
		case ListParam:
			return listParam(node);
			
		case ListParam2:
			return listParam2(node);
			
		case Ret:
			return ret(node);
			
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
		try {
			interpretar(node.getFilho(8)); // ListComand
		} catch(RetCommandException rcex) {
			return rcex.getValorRetorno();
		}
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
		} else if ("-".equals(operador)) {
			return subt(operan, exprAtrib2);
		} else if ("*".equals(operador)) {
			return mult(operan, exprAtrib2);
		} else if ("/".equals(operador)) {
			return divi(operan, exprAtrib2);
		}
		return null;
	}

	private Object soma(Object operan, Object exprAtrib2) {

		if (operan instanceof Integer) {
			return (Integer) operan + (Integer) exprAtrib2;
		} else if(operan instanceof Double) {
			return (Double) operan + (Double) exprAtrib2;
		}
		return null;
	}

	private Object subt(Object operan, Object exprAtrib2) {

		if (operan instanceof Integer) {
			return (Integer) operan - (Integer) exprAtrib2;
		} else if(operan instanceof Double) {
			return (Double) operan - (Double) exprAtrib2;
		}
		return null;
	}
	
	private Object mult(Object operan, Object exprAtrib2) {

		if (operan instanceof Integer) {
			return (Integer) operan * (Integer) exprAtrib2;
		} else if(operan instanceof Double) {
			return (Double) operan * (Double) exprAtrib2;
		}
		return null;
	}

	private Object divi(Object operan, Object exprAtrib2) {

		if (operan instanceof Integer) {
			return (Integer) operan / (Integer) exprAtrib2;
		} else if(operan instanceof Double) {
			return (Double) operan / (Double) exprAtrib2;
		}
		return null;
	}

	
	/**
	 * <ExpAtrib2> ::= <OpArit> <Operan> <ExpAtrib2> |
	 */
	private Object exprAtrib2(Node node) {
		Object operan = interpretar(node.getFilho(1));
		if (node.getFilho(2).getFilhos().size() > 0) {
			String operador = node.getFilho(2).getFilho(0).getFilho(0).getToken().getImagem();
			Object exprAtrib2 = interpretar(node.getFilho(2));
			return calcula(operan, exprAtrib2, operador);
		}
		return operan;
	}
	

	/**
	 * <Operan>   ::= Identifier | IntegerLiteral | RealLiteral | StringLiteral | <Call>
	 */
	private Object operan(Node node) {
		if(node.getFilho(0).getTipo() != TipoOfNode.Call) {
			Token operan = node.getFilho(0).getToken();
			if (operan.getClasse() == Classe.Identificador) {
				return TabelaSimbolos.getValor(operan);
			} else {
				return imagemToValor(operan);
			}
		} else {
			return interpretar(node.getFilho(0));
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
	

	/**
	 * <Ver>       ::= 'ver' '(' <Operan> ')'
	 */
	private void ver(Node node) {
		Node nodeOperan = node.getFilho(2);
		Object valorOut = null;
		if (nodeOperan.getFilho(0).getTipo() == TipoOfNode.Call) {
			valorOut = interpretar(nodeOperan);
		} else {
			if (nodeOperan.getFilho(0).getToken().getClasse() == Classe.Identificador) {
				valorOut = TabelaSimbolos.getValor(nodeOperan.getFilho(0).getToken());
			} else if (nodeOperan.getFilho(0).getToken().getClasse() == Classe.ConstanteLiteralString) { 
				//TODO: consertar a impressao do \n
				valorOut = nodeOperan.getFilho(0).getToken().getImagem();
			} else {
				valorOut = nodeOperan.getFilho(0).getToken().getImagem();
			}
		} 
		
		System.out.println(valorOut);
	}
	
	/**
	 * <Ler>       ::= 'ler' '(' Identifier ')'
	 */
	private void ler(Node node) {
		try {
			Token id = node.getFilho(2).getToken();
			Scanner sc = new Scanner(System.in);
			String entrada = sc.nextLine();
			String tipoId = TabelaSimbolos.getTipoSimbolo(id);
			if (tipoId.equals("Int")) {
				TabelaSimbolos.setValor(id, Integer.parseInt(entrada));
			} else if (tipoId.equals("Real")) {
				TabelaSimbolos.setValor(id, Double.parseDouble(entrada));
			} else if (tipoId.equals("Str")) {
				TabelaSimbolos.setValor(id, entrada);
			} else if (tipoId.equals("Nada")) {
				System.err.println("Excecao: variavel do tipo Nada não pode receber valor!");
			} 
		} catch (Exception e) {
			System.err.println("Excecao: entrada com formato invalido para conversao!");
		}
	}
	

	/**
	 * <While>     ::= 'enquanto' '(' <ExpCond> ')' <Comand>
	 */
	private void enquanto(Node node) {
		Boolean expCond = (Boolean) interpretar(node.getFilho(2));
		while(expCond) {
			interpretar(node.getFilho(4));
			expCond = (Boolean) interpretar(node.getFilho(2));
		}
	}
	
	/**
	 * <ExpCond>   ::= <Operan> <OpCond> <Operan>
	 */
	private Object expCond(Node node) {
		Object valorOp1 = interpretar(node.getFilho(0));
		Object valorOp2 = interpretar(node.getFilho(2));
		String opCond = node.getFilho(1).getFilho(0).getToken().getImagem();
		if (opCond.equals(">")) {
			return maior(valorOp1, valorOp2);
		} else if (opCond.equals("<")) {
			return menor(valorOp1, valorOp2);
		} else if (opCond.equals(">=")) {
			return maiorIgual(valorOp1, valorOp2);
		} else if (opCond.equals("<=")) {
			return menorIgual(valorOp1, valorOp2);
		} else if (opCond.equals("==")) {
			return igual(valorOp1, valorOp2);
		} else if (opCond.equals("!=")) {
			return diferente(valorOp1, valorOp2);
		} 
		return null;
	}

	private Object maior(Object valorOp1, Object valorOp2) {
		if (valorOp1 instanceof Integer) {
			return (Integer) valorOp1 > (Integer)valorOp2;
		} else if (valorOp1 instanceof Double) {
			return (Double) valorOp1 > (Double)valorOp2;
		} else if (valorOp1 instanceof String) {
			return ((String)valorOp1).compareTo((String)valorOp2) > 0;
		} 
		return false;
	}
	
	private Object menor(Object valorOp1, Object valorOp2) {
		if (valorOp1 instanceof Integer) {
			return (Integer) valorOp1 < (Integer)valorOp2;
		} else if (valorOp1 instanceof Double) {
			return (Double) valorOp1 < (Double)valorOp2;
		} else if (valorOp1 instanceof String) {
			return ((String)valorOp1).compareTo((String)valorOp2) < 0;
		} 
		return false;
	}
	
	private Object maiorIgual(Object valorOp1, Object valorOp2) {
		if (valorOp1 instanceof Integer) {
			return (Integer) valorOp1 >= (Integer)valorOp2;
		} else if (valorOp1 instanceof Double) {
			return (Double) valorOp1 >= (Double)valorOp2;
		} else if (valorOp1 instanceof String) {
			return ((String)valorOp1).compareTo((String)valorOp2) >= 0;
		} 
		return false;
	}

	private Object menorIgual(Object valorOp1, Object valorOp2) {
		if (valorOp1 instanceof Integer) {
			return (Integer) valorOp1 <= (Integer)valorOp2;
		} else if (valorOp1 instanceof Double) {
			return (Double) valorOp1 <= (Double)valorOp2;
		} else if (valorOp1 instanceof String) {
			return ((String)valorOp1).compareTo((String)valorOp2) <= 0;
		} 
		return false;
	}

	private Object igual(Object valorOp1, Object valorOp2) {
		if (valorOp1 instanceof Integer) {
			return ((Integer) valorOp1).intValue() == ((Integer)valorOp2).intValue();
		} else if (valorOp1 instanceof Double) {
			return ((Double) valorOp1).doubleValue() == ((Double)valorOp2).doubleValue();
		} else if (valorOp1 instanceof String) {
			return ((String)valorOp1).compareTo((String)valorOp2) == 0;
		} 
		return false;
	}

	private Object diferente(Object valorOp1, Object valorOp2) {
		if (valorOp1 instanceof Integer) {
			return ((Integer) valorOp1).intValue() != ((Integer)valorOp2).intValue();
		} else if (valorOp1 instanceof Double) {
			return ((Double) valorOp1).doubleValue() != ((Double)valorOp2).doubleValue();
		} else if (valorOp1 instanceof String) {
			return ((String)valorOp1).compareTo((String)valorOp2) != 0;
		} 
		return false;
	}
	

	/**
	 * <If>        ::= 'se' '(' <ExpCond> ')' <Comand> <Else>
	 */
	private void se(Node node) {
		Boolean expCond = (Boolean) interpretar(node.getFilho(2));
		if (expCond) {
			interpretar(node.getFilho(4));
		} else {
			interpretar(node.getFilho(5));
		}
	}
	
	/**
	 * <Else>      ::= 'senao' <Comand> | 
	 */
	private void senao(Node node) {
		if (node.getFilhos().size() > 0) {
			interpretar(node.getFilho(1));
		}
	}

	/**
	 * <Call>      ::= Identifier '(' <ListParam> ')'
	 */
	private Object call(Node node) {
		Token defId = node.getFilho(0).getToken();
		Node nodeDefId = mapDefs.get(defId.getImagem());
		List<Token> listParamFormal = TabelaSimbolos.getParamsBySimbolo(defId);
		List<Object> listParamAtual = (List<Object>) interpretar(node.getFilho(2));
		Collections.reverse(listParamAtual);
		for(int i=0; i < listParamFormal.size(); i++) {
			Token paramFormal = listParamFormal.get(i);
			Object valorParamAtual = listParamAtual.get(i);
						
			TabelaSimbolos.setValor(paramFormal, valorParamAtual);
		}
		
		return interpretar(nodeDefId);
	}

	/*
	 * <ListParam> ::= <Operan> <ListParam2> |
	 */
	private Object listParam(Node node) {
		if(node.getFilhos().size() == 0) {
			return new ArrayList<Object>();
		}
		Object operan = interpretar(node.getFilho(0));
		List<Object> listParam2 = (List<Object>) interpretar(node.getFilho(1));
		listParam2.add(operan);
		return listParam2;
	}

	/*
	 * <ListParam2> ::= ',' <Operan> <ListParam2> |
	 */
	private Object listParam2(Node node) {
		if(node.getFilhos().size() == 0) {
			return new ArrayList<Object>();
		}
		Object operan = interpretar(node.getFilho(1));
		List<Object> listParam2 = (List<Object>) interpretar(node.getFilho(2));
		listParam2.add(operan);
		return listParam2;
	}
	
	/**
	 * <Ret>       ::= 'ret' <Operan>
	 */
	private Object ret(Node node) {
		Object retorno = interpretar(node.getFilho(1));
		throw new RetCommandException(retorno);
	}

}
