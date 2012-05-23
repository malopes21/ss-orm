package org.malopes.generator;

import java.util.ArrayList;
import java.util.Collections;
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

		case Query_List:
			queryList(node);
			break;
			
		case Query:
			query(node);
			break;
			
		default:
			System.out.println("Tipo de node desconhecido: " + node.getTipo().name());
			break;
		}
		return null;
	}

	/**
	 * <Query_List> ::=  <Query> ';' <Query_List> | 
	 */
	private Object queryList(Node no) {
		if(no.getFilhos().size() > 0) {
			analisar(no.getFilho(0));
			analisar(no.getFilho(2));
		}
		return null;
	}


	/**
	 * <Query>       ::= <Alter Stm>   | <Create Stm>
	 */
	private Object query(Node no) {
		analisar(no.getFilho(0));
		return null;
	}

	/**
	 * <Create Stm>  ::= create table Id '(' <Field Def List> ')' 
	 */
	public Object createStm(Node no) {
		
		return null;
	}
	
	
	public void mostraErros() {
		for (String erro : erros) {
			System.err.println(erro);
		}
	}
	
}
