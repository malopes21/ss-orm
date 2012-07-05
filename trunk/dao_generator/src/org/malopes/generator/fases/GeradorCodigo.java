package org.malopes.generator.fases;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.List;

import org.malopes.generator.consts.TipoOfNode;
import org.malopes.generator.defs.Node;
import org.malopes.generator.defs.Simbolo;
import org.malopes.generator.defs.TabelaSimbolos;
import org.malopes.generator.defs.Token;

public class GeradorCodigo {
	
	private Node raiz;
	private PrintWriter out;
	private boolean gerarAtribs;
	
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
			out.write("public class " + fileName + " {\n");
			
			//gera os atributos
			gerarAtribs = true;
			gerar(no.getFilho(4));
			
			//gera construtor
			out.write("\n\n\tpublic "+ fileName + "() {");
			out.write("\n\t}");
			
			//gera gets e sets
			gerarAtribs = false;
			gerar(no.getFilho(4));
			
			out.write("\n}");
			
			out.flush();
			out.close();
			
			geraDAO(fileName);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	private void geraDAO(String fileName) {
		try {
			out = new PrintWriter(new File("saida\\" + fileName + "DAO.java"));
			
			out.write("import java.sql.*;\n");
			out.write("\npublic class " + fileName + "DAO {\n");
			
			//gera ref. para conexão
			out.write("\n\tprivate Connection conexao;\n");
			
			//gera construtor
			out.write("\n\tpublic "+ fileName + "DAO(Connection conexao) {");
			out.write("\n\t\tthis.conexao = conexao;");
			out.write("\n\t}");
			
			out.write("\n}");
			
			out.flush();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		
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

		if(gerarAtribs) {
			out.write("\n\tprivate "+tipo+" "+id.getImagem()+";");
		
		} else { //gerar gets e sets

			out.write("\n\n\tpublic "+id.getImagem()+" get"+ toUpperCaseFirstChar(id.getImagem()) + "() {");
			out.write("\n\t\treturn "+id.getImagem()+";");
			out.write("\n\t}");
			
			out.write("\n\n\tpublic void set"+ toUpperCaseFirstChar(id.getImagem()) + "(" + tipo + " " + id.getImagem() + ") {");
			out.write("\n\t\tthis."+ id.getImagem()+" = " + id.getImagem()+ ";");
			out.write("\n\t}");
		}
		
		return null;
	}
	
	private String toUpperCaseFirstChar(String idImagem) {
		String firstUpper = idImagem.substring(0, 1).toUpperCase();
		String tail = idImagem.substring(1, idImagem.length());
		return firstUpper+tail;
	}

	
	/**
	 * <Type>  ::=  bit  | date  |  time | timestamp |  decimal  |  real |  float
          |  smallint |  integer | int  |  interval |  character |  varchar <Tamanho> 
	 */
	private Object type(Node no) {
		return TabelaSimbolos.getTipoJavaEquivalente(no.getFilho(0).getToken().getImagem());
	}
}
