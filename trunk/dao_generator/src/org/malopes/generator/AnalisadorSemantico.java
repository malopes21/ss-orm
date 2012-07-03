package org.malopes.generator;

import java.util.ArrayList;
import java.util.List;

public class AnalisadorSemantico {

	private Node raiz;
	private List<String> erros = new ArrayList<String>();
	private Token tableId;
	
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
			
		case Constraint_List:
			constraintList(no);
			break;
			
		case Constraint_Type:
			constraintType(no);
			break;
			
		case Id_List:
			return idList(no);
			
		case Id_List_2:
			return idList2(no);
			
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
		tableId = no.getFilho(2).getToken();
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
	 * <Constraint List> ::= ',' <Constraint Type> <Constraint List> |  
	 */
	public Object constraintList(Node no){
		if(no.getFilhos().size() > 0) {
			analisar(no.getFilho(1));
			analisar(no.getFilho(2));
		}
		return null;
	}

	/**
	 * <Constraint Type> ::= primary key '(' <Id List> ')'
                    | foreign key '(' <Id List> ')' references Id '(' <Id List> ')'
	 */
	public Object constraintType(Node no){
		if(no.getFilho(0).getToken().getImagem().equals("primary")) {
			Chave key = TabelaSimbolos.getPrimaryKeyBySimbolo(tableId);
			if(key != null) {
				erros.add("Erro semântico: redeclaração de primary key para a tabela: " + tableId.getImagem() + ". Linha: "+ no.getFilho(0).getToken() );
			} else {
				List<Token> keyIds = (List<Token>) analisar(no.getFilho(3));
				TabelaSimbolos.addChaveToSimbolo(keyIds, tableId, TipoOfKey.Primary, null);
			}
		} else if(no.getFilho(0).getToken().getImagem().equals("foreign")) {
			//List<Chave> chaves = TabelaSimbolos.getForeignKeysBySimbolo(tableId);
			List<Token> keyIds = (List<Token>) analisar(no.getFilho(3));
			Token reference = no.getFilho(6).getToken();
			TabelaSimbolos.addChaveToSimbolo(keyIds, tableId, TipoOfKey.Foreign, reference);
		}
		return null;
	}
	
	/**
	 * <Id List>     ::= Id <Id List 2>
	 */
	private Object idList(Node no){
		List<Token> idList2 = (List<Token>) analisar(no.getFilho(1));
		idList2.add(no.getFilho(0).getToken());
		return idList2;
	}
	
	/**
	 * <Id List 2> ::= ',' Id <Id List 2> |
	 */
	private Object idList2(Node no){
		if(no.getFilhos().size() == 0) {
			return new ArrayList<Token>();
		} else {
			List<Token> idList2 = (List<Token>) analisar(no.getFilho(2));
			idList2.add(no.getFilho(1).getToken());
			return idList2;
		}
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
