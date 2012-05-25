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

	private Object analisar(Node no) {
		switch (no.getTipo()) {

		case Query_List:
			queryList(no);
			break;
			
		case Query:
			query(no);
			break;
			
		case Create_Stm:
			createStm(no);
			break;
			
		case Field_Def_List:
			fieldDefList(no);
			break;
			
		case Field_Def_List_2:
			fieldDefList2(no);
			break;
			
		case Field_Def:
			fieldDef(no);
			break;
			
		case Type:
			return type(no);
			
		default:
			System.out.println("Tipo de node desconhecido: " + no.getTipo().name());
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
		Token tableId = no.getFilho(2).getToken();
		String tipoIdTable = TabelaSimbolos.getTipoSimbolo(tableId);
		if(tipoIdTable != null) {
			erros.add("Erro semântico: identificador de tabela redeclarado: " + tableId);
		} else {
			TabelaSimbolos.setTipoSimbolo(tableId, "table");
		}
		analisar(no.getFilho(4));
		return null;
	}

	/**
	 *  <Field Def List> ::= <Field Def> <Field Def List 2>
	 */
	public Object fieldDefList(Node no){
		analisar(no.getFilho(0));
		analisar(no.getFilho(1));
		return null;
	}
	
	
	/**
	 * <Field Def List 2> ::= ',' <Field Def> <Field Def List 2> | <Constraint List>
	 */
	public Object fieldDefList2(Node no){
		if(no.getFilhos().size() == 1) {
			analisar(no.getFilho(0));
		} else if(no.getFilhos().size() == 3) {
			analisar(no.getFilho(1));
			analisar(no.getFilho(2));
		}
		
		return null;
	}
	
	/**
	 * <Field Def>   ::= Id <Type> <Not Null>
	 */
	public Object fieldDef(Node no){
		Token id = no.getFilho(0).getToken();
		Token type = (Token) analisar(no.getFilho(1));
		
		String tipoId = TabelaSimbolos.getTipoSimbolo(id);
		if(tipoId != null) {
			erros.add("Erro semântico: identificador de campo redeclarado: " + id);
		} else {
			String tipoCompativel = TabelaSimbolos.getTipoJavaEquivalente(type.getImagem());
			TabelaSimbolos.setTipoSimbolo(id, tipoCompativel);
		}
		
		return null;
	}
	
	/**
	 * <Type>  ::=  bit  | date  |  time | timestamp |  decimal  |  real |  float
          |  smallint |  integer | int  |  interval |  character |  varchar <Tamanho>
	 */
	public Object type(Node no){
		return no.getFilho(0).getToken();
	}
	
	public void mostraErros() {
		for (String erro : erros) {
			System.err.println(erro);
		}
	}
	
}
