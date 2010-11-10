package org.malopes.ssp;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Stack;
import java.util.Map.Entry;

public class GeradorCodigo {

	private Node raiz;
	private Map<String, Node> mapDefs;
	private Stack<HashMap<String, Object>> pilha = new Stack<HashMap<String, Object>>();
	private PrintWriter out;

	public GeradorCodigo(Node raiz, PrintWriter out) {
		this.raiz = raiz;
		this.out = out;
	}

	public void gerar() {
		mapDefs = getDefs();
		Node defPrincipal = mapDefs.get("principal");
				
		gerarCabecalho();
		/*gerar(defPrincipal);
		
		for(Entry<String, Node> entrada : mapDefs.entrySet()) {
			if(!entrada.getKey().equals("principal")) {
				gerar(entrada.getValue());
			}
		}
		gerarRodape();*/

	}


	private void gerarCabecalho() {
		out.write(".486 \n");
		out.write(".model flat, stdcall \n");		
	}

	private void gerarRodape() {
		// TODO Auto-generated method stub
		
	}

	private Object gerar(Node node) {
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
		
		return null;
	}

	private void populaStackFrame(HashMap<String, Object> stackFrame, String imagemDefId) {
		System.out.println("STACKFRAME "+imagemDefId);
		for(Simbolo simb : TabelaSimbolos.getSimbolosByEscopo(imagemDefId)) {
			stackFrame.put(simb.getToken().getImagem(), simb.getValor());
			System.out.println("Imagem "+ simb.getToken().getImagem() + " | Valor : " + simb.getValor());
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
	
	private Object getValor(String imagem) {
		return pilha.peek().get(imagem);
	}
	
	private void setValor(String imagem, Object valor) {
		pilha.peek().put(imagem, valor);
	}

	/**
	 * <ListComand> ::= <Comand> <ListComand> |
	 */
	private Object listComand(Node node) {
		if (node.getFilhos().size() > 0) {
			gerar(node.getFilho(0)); // Comand
			gerar(node.getFilho(1)); // ListComand
		}

		return null;
	}

	/**
	 * <Comand> ::= <Decl> ';' | <Atrib> ';' | <While> | <If> | <Ler> ';' |
	 * <Ver> ';' | <Ret> ';' | <Call> ';' | '{' <ListComand> '}'
	 */
	private Object comand(Node node) {
		if (node.getFilhos().size() > 2) {
			gerar(node.getFilho(1));
		} else {
			gerar(node.getFilho(0));
		}
		return null;
	}

	/**
	 * <Atrib> ::= Identifier '=' <ExpAtrib>
	 */
	private Object atrib(Node node) {
		Object exprAtrib = gerar(node.getFilho(2));
		//TabelaSimbolos.setValor(node.getFilho(0).getToken(), exprAtrib);
		setValor(node.getFilho(0).getToken().getImagem(), exprAtrib);
		return null;
	}

	/**
	 * <ExpAtrib> ::= <Operan> <ExpAtrib2>
	 */
	private Object exprAtrib(Node node) {
		Object operan = gerar(node.getFilho(0));
		if (node.getFilho(1).getFilhos().size() > 0) {
			String operador = node.getFilho(1).getFilho(0).getFilho(0).getToken().getImagem();
			Object exprAtrib2 = gerar(node.getFilho(1));
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
		Object operan = gerar(node.getFilho(1));
		if (node.getFilho(2).getFilhos().size() > 0) {
			String operador = node.getFilho(2).getFilho(0).getFilho(0).getToken().getImagem();
			Object exprAtrib2 = gerar(node.getFilho(2));
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
				//return TabelaSimbolos.getValor(operan);
				return getValor(operan.getImagem());
			} else {
				return imagemToValor(operan);
			}
		} else {
			return gerar(node.getFilho(0));
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
			valorOut = gerar(nodeOperan);
		} else {
			if (nodeOperan.getFilho(0).getToken().getClasse() == Classe.Identificador) {
				//valorOut = TabelaSimbolos.getValor(nodeOperan.getFilho(0).getToken());
				valorOut = getValor(nodeOperan.getFilho(0).getToken().getImagem());
			} else if (nodeOperan.getFilho(0).getToken().getClasse() == Classe.ConstanteLiteralString) { 
				//o replaceALL serve consertar a impressao do \n
				valorOut = nodeOperan.getFilho(0).getToken().getImagem().replaceAll("\\\\n", "\n");
			} else {
				valorOut = nodeOperan.getFilho(0).getToken().getImagem();
			}
		} 
		
		System.out.print(valorOut);
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
				//TabelaSimbolos.setValor(id, Integer.parseInt(entrada));
				setValor(id.getImagem(), Integer.parseInt(entrada));
			} else if (tipoId.equals("Real")) {
				//TabelaSimbolos.setValor(id, Double.parseDouble(entrada));
				setValor(id.getImagem(), Double.parseDouble(entrada));
			} else if (tipoId.equals("Str")) {
				//TabelaSimbolos.setValor(id, entrada);
				setValor(id.getImagem(), entrada);
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
		Boolean expCond = (Boolean) gerar(node.getFilho(2));
		while(expCond) {
			gerar(node.getFilho(4));
			expCond = (Boolean) gerar(node.getFilho(2));
		}
	}
	
	/**
	 * <ExpCond>   ::= <Operan> <OpCond> <Operan>
	 */
	private Object expCond(Node node) {
		Object valorOp1 = gerar(node.getFilho(0));
		Object valorOp2 = gerar(node.getFilho(2));
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
		Boolean expCond = (Boolean) gerar(node.getFilho(2));
		if (expCond) {
			gerar(node.getFilho(4));
		} else {
			gerar(node.getFilho(5));
		}
	}
	
	/**
	 * <Else>      ::= 'senao' <Comand> | 
	 */
	private void senao(Node node) {
		if (node.getFilhos().size() > 0) {
			gerar(node.getFilho(1));
		}
	}

	/**
	 * <Call>      ::= Identifier '(' <ListParam> ')'
	 */
	private Object call(Node node) {
		Token defId = node.getFilho(0).getToken();

		HashMap<String, Object> stackFrame = new HashMap<String, Object>();
		populaStackFrame(stackFrame, defId.getImagem());
				
		Node nodeDefId = mapDefs.get(defId.getImagem());
		List<Token> listParamFormal = TabelaSimbolos.getParamsBySimbolo(defId);
		List<Object> listParamAtual = (List<Object>) gerar(node.getFilho(2));
		Collections.reverse(listParamAtual);
		
		pilha.push(stackFrame);
		for(int i=0; i < listParamFormal.size(); i++) {
			Token paramFormal = listParamFormal.get(i);
			Object valorParamAtual = listParamAtual.get(i);
						
			//TabelaSimbolos.setValor(paramFormal, valorParamAtual);
			setValor(paramFormal.getImagem(), valorParamAtual);
		}
		
		return gerar(nodeDefId);
	}

	/*
	 * <ListParam> ::= <Operan> <ListParam2> |
	 */
	private Object listParam(Node node) {
		if(node.getFilhos().size() == 0) {
			return new ArrayList<Object>();
		}
		Object operan = gerar(node.getFilho(0));
		List<Object> listParam2 = (List<Object>) gerar(node.getFilho(1));
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
		Object operan = gerar(node.getFilho(1));
		List<Object> listParam2 = (List<Object>) gerar(node.getFilho(2));
		listParam2.add(operan);
		return listParam2;
	}
	
	/**
	 * <Ret>       ::= 'ret' <Operan>
	 */
	private Object ret(Node node) {
		Object retorno = gerar(node.getFilho(1));
		throw new RetCommandException(retorno);
	}

}
