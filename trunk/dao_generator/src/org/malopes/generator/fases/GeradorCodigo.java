package org.malopes.generator.fases;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

import org.malopes.generator.consts.TipoOfNode;
import org.malopes.generator.defs.Node;
import org.malopes.generator.defs.TabelaSimbolos;
import org.malopes.generator.defs.Token;

public class GeradorCodigo {
	
	private Node raiz;
	private PrintWriter out;
	
	public GeradorCodigo(Node raiz) {
		this.raiz = raiz;
		//this.out = out;
		//this.fileName = fileName;
	}

	public void gerar() {
		//gerarCabecalho();
		gerar(raiz);
		//gerarRodape();
	}



	private Object gerar(Node no) {
		switch (no.getTipo()) {
			case Query_List:
				return queryList(no);
				
			case Query:
				return query(no);
				
			case Alter_Stm:
				return alterStm(no);
				
			case Create_Stm:
				return createStm(no);
			
			case Field_Def_List:
				return fieldDefList(no);
				
			case Field_Def_List_2:
				return fieldDefList2(no);
				
			case Field_Def:
				return fieldDef(no);
				
			case Type:
				return type(no);
			
		}
		
		return null;
	}


	/**
	 * <Query_List> ::=  <Query> ';' <Query_List> | 
	 */
	private Object queryList(Node no) {
		if(no.getFilhos().size() > 0) {
			gerar(no.getFilho(0));
			gerar(no.getFilho(2));
		}
		return null;
	}

	/**
	 * <Query>       ::= <Alter Stm>   | <Create Stm>
	 */
	private Object query(Node no) {
		gerar(no.getFilho(0));
		return null;
	}

	/**
	 * <Create Stm>  ::= create table Id '(' <Field Def List> ')' 
	 */
	private Object createStm(Node no) {
		try {
			Token id = no.getFilho(2).getToken();
			String fileName = id.getImagem();
			out = new PrintWriter(new File("saida\\" + fileName + ".java"));
			
			out.write("public class " + fileName + " {");
			gerar(no.getFilho(4));
			out.write("\n}");
			
			out.flush();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * <Alter Stm>   ::= alter table Id add  <Constraint>
	 */
	private Object alterStm(Node no) {
		return null;
	}
	
	/**
	 * <Field Def List> ::= <Field Def> <Field Def List 2>
	 */
	private Object fieldDefList(Node no) {
		gerar(no.getFilho(0));
		gerar(no.getFilho(1));
		return null;
	}

	/**
	 *  <Field Def List 2> ::= ',' <Field Def> <Field Def List 2> | <Constraint List>
	 */
	private Object fieldDefList2(Node no) {
		if(no.getFilhos().size() > 1) {
			gerar(no.getFilho(1));
			gerar(no.getFilho(2));
		} else {
			gerar(no.getFilho(0));
		}
		return null;
	}

	
	/**
	 * <Field Def>   ::= Id <Type> <Not Null>
	 */
	private Object fieldDef(Node no) {
		Token id = no.getFilho(0).getToken();
		String tipo = (String) gerar(no.getFilho(1));
		out.write("\n\tprivate "+tipo+" "+id.getImagem()+";");
		return null;
	}
	
	
	/**
	 * <Type>  ::=  bit  | date  |  time | timestamp |  decimal  |  real |  float
          |  smallint |  integer | int  |  interval |  character |  varchar <Tamanho> 
	 */
	private Object type(Node no) {
		return TabelaSimbolos.getTipoJavaEquivalente(no.getFilho(0).getToken().getImagem());
	}
}
