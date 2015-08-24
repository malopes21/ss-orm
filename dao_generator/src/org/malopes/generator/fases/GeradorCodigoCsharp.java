package org.malopes.generator.fases;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.List;

import org.malopes.generator.defs.Chave;
import org.malopes.generator.defs.Node;
import org.malopes.generator.defs.Simbolo;
import org.malopes.generator.defs.TabelaSimbolos;
import org.malopes.generator.defs.Token;

public class GeradorCodigoCsharp {

	private Node raiz;
	private PrintWriter out;
	private boolean gerarAtribs;

	public GeradorCodigoCsharp(Node raiz) {
		this.raiz = raiz;
		// this.out = out;
		// this.fileName = fileName;
	}

	public void gerar() {
		// gerarCabecalho();
		gerar(raiz);
		// gerarRodape();
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
			
		/*case Constraint_List:
			return constraintList(no);
			
		case Constraint_Type:
			return constraintType(no);*/

		}

		return null;
	}

	/**
	 * <Query_List> ::= <Query> ';' <Query_List> |
	 */
	private Object queryList(Node no) {
		if (no.getFilhos().size() > 0) {
			gerar(no.getFilho(0));
			gerar(no.getFilho(2));
		}
		return null;
	}

	/**
	 * <Query> ::= <Alter Stm> | <Create Stm>
	 */
	private Object query(Node no) {
		gerar(no.getFilho(0));
		return null;
	}

	/**
	 * <Create Stm> ::= create table Id '(' <Field Def List> ')'
	 */
	private Object createStm(Node no) {
		try {
			Token id = no.getFilho(2).getToken();
			String fileName = id.getImagem();
			if (!new File("saida").exists()) { // Verifica se o diretório existe.   
	             (new File("saida")).mkdir();   // Cria o diretório   
	        }
			if (!new File("saida\\Entidade").exists()) { // Verifica se o diretório existe.   
	             (new File("saida\\Entidade")).mkdir();   // Cria o diretório   
	        }
			out = new PrintWriter(new File("saida\\Entidade\\" + toUpperCaseFirstChar(fileName) + ".cs"));
			out.write("using System;\n");
			out.write("using System.Collections.Generic;\n");
			out.write("using System.Linq;\n");
			out.write("using System.Text;\n");
			
			out.write("using System.Data.SqlClient;\n\n");
			out.write("namespace Entidade {\n\n");
			//out.write("{\n");
			out.write("public class " + toUpperCaseFirstChar(fileName) + " {\n");

			// gera os atributos
			gerarAtribs = true;
			gerar(no.getFilho(4));
			out.write("\n");
			
			// gera campos de relacionamentos
			List<Chave> chavesEstrangeiras = TabelaSimbolos.getForeignKeysBySimbolo(id);
			geraEntidades(chavesEstrangeiras);
			
			List<Token> tabelasReferenciadas = TabelaSimbolos.getReferencedTablesBySimbolo(id);
			geraColecoes(tabelasReferenciadas);

			// gera construtor
			out.write("\n\tpublic " + toUpperCaseFirstChar(fileName) + "() {");
			out.write("\n\t}");
			
			// gera gets e sets
			gerarAtribs = false;
			gerar(no.getFilho(4));
			
			// gera gets e sets dos campos de relacionamentos
			// gera campos de relacionamentos
			geraGetSetEntidades(chavesEstrangeiras);			
			geraGetSetColecoes(tabelasReferenciadas);
			
			out.write("\n}");
			out.write("\n}");

			out.flush();
			out.close();

			//gera todos os DAOs
			geraDAO(fileName);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	/**
	 * 	public Cliente getCliente() {
		return cliente;
	}
	
	public void setCliente(Cliente cliente){
		this.cliente = cliente;
	}
	 */
	private void geraGetSetEntidades(List<Chave> chavesEstrangeiras) {
		for(Chave chave : chavesEstrangeiras) {
			String nomeEntidade = chave.getReference().getImagem();
			out.write("\n\n\tpublic " + toUpperCaseFirstChar(nomeEntidade) +" " + toUpperCaseFirstChar(nomeEntidade) +" {  \n");
			out.write("\t\t get { return "+toLowerCaseFirstChar(nomeEntidade)+"; }  \n");
			out.write("\t\t set { "+toLowerCaseFirstChar(nomeEntidade)+" = value; }  \n");
			out.write("\t}\n");
		}
	}
	
	private void geraGetSetColecoes(List<Token> tabelasReferenciadas) {
		for(Token tokTab: tabelasReferenciadas) {
			String nomeEntidade = tokTab.getImagem();
			
			out.write("\n\n\tpublic List<" + toUpperCaseFirstChar(nomeEntidade) +"> " + toUpperCaseFirstChar(nomeEntidade) +"s {  \n");
			out.write("\t\tget { return "+toLowerCaseFirstChar(nomeEntidade)+"s; }  \n");
			out.write("\t\tset { "+toLowerCaseFirstChar(nomeEntidade)+"s = value; }  \n");
			out.write("\t}");
			
		}
	}

	private void geraEntidades(List<Chave> chavesEstrangeiras) {
		for(Chave chave : chavesEstrangeiras) {
			String nomeEntidade = chave.getReference().getImagem();
			out.write("\tprivate " + toUpperCaseFirstChar(nomeEntidade) +" " + toLowerCaseFirstChar(nomeEntidade) +" = new "+toUpperCaseFirstChar(nomeEntidade)+"();  \n");
		}
	}

	private void geraColecoes(List<Token> tabelasReferenciadas) {
		for(Token tokTab: tabelasReferenciadas) {
			String nomeEntidade = tokTab.getImagem();
			out.write("\tprivate List<"+ toUpperCaseFirstChar(nomeEntidade) +"> " + toLowerCaseFirstChar(nomeEntidade) +"s = new List<"+toUpperCaseFirstChar(nomeEntidade)+">();  \n");
		}
	}

	private void geraDAO(String fileName) {
		try {
			String entidade = toUpperCaseFirstChar(fileName);
			if (!new File("saida\\DAO").exists()) { // Verifica se o diretório existe.   
	             (new File("saida\\DAO")).mkdir();   // Cria o diretório   
			}
	         
			out = new PrintWriter(new File("saida\\DAO\\" + entidade + "DAO.cs"));
			
			out.write("using System;\n");
			out.write("using System.Collections.Generic;\n");
			out.write("using System.Linq;\n");
			out.write("using System.Text;\n");
			out.write("using System.Data.SqlClient;\n");
			out.write("using Entidade;\n");
			out.write("\nnamespace DAO {\n\n"); 
			out.write("\npublic class " + entidade + "DAO {\n");

			// gera ref. para conexão
			out.write("\n\tprivate SqlConnection conexao;");
			out.write("\n\tprivate SqlTransaction tx;\n");
			
			// gera construtor
			out.write("\n\tpublic " + entidade + "DAO(SqlConnection conexao) {");
			out.write("\n\t\tthis.conexao = conexao;");
			out.write("\n\t}\n");
			
			// gera construtor
			out.write("\n\tpublic " + entidade + "DAO(SqlConnection conexao, SqlTransaction tx) {");
			out.write("\n\t\tthis.conexao = conexao;");
			out.write("\n\t\tthis.tx = tx;");
			out.write("\n\t}");

			
			geraInsertIdentity(fileName);
			geraInsert(fileName);
			geraUpdate(fileName);
			geraDelete(fileName);
			geraDeleteById(fileName);
			geraListAll(fileName);
			geraGetById(fileName);

			out.write("\n}");
			out.write("\n}");

			out.flush();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

	}
	
	
	private void geraListAll(String entidade) {
		String instancia = toLowerCaseFirstChar(entidade);
		out.write("\n\n\tpublic List<"+ toUpperCaseFirstChar(entidade) +"> ListAll() {");
		out.write("\n");

		List<Simbolo> atribSimbs = TabelaSimbolos.getSimbolosAtribByEscopo(entidade);
		String sql = "select * from " + entidade;
		out.write("\n\t\tSqlCommand comando = new SqlCommand();");
		out.write("\n\t\tcomando.Connection = conexao;");
		out.write("\n\t\tcomando.CommandType = System.Data.CommandType.Text;");
		out.write("\n\t\tif(tx != null) {");
		out.write("\n\t\t\tcomando.Transaction = tx;");
		out.write("\n\t\t}");
		out.write("\n\t\tcomando.CommandText = \""+sql+"\";");
		out.write("\n\t\tSqlDataReader reader = comando.ExecuteReader();");
		
		out.write("\n\t\tList<"+toUpperCaseFirstChar(entidade)+"> " + instancia + "s = new List<"+toUpperCaseFirstChar(entidade)+">();");
		out.write("\n\t\twhile (reader.Read()) {");
		out.write("\n\t\t\t"+toUpperCaseFirstChar(entidade) + " " + instancia + " = new "+ toUpperCaseFirstChar(entidade) + "();");
		int pos = 1;
		for (Simbolo atrib : atribSimbs) {
			String atribName = atrib.getToken().getImagem();
			String atribTipo = atrib.getTipo();
			if (atribTipo.equals("Integer")) {
				atribTipo = "Int32";
			}
			out.write("\n\t\t\t" + instancia + "." + toUpperCaseFirstChar(atribName) + " = ("+ atribTipo +") reader[" + "\""+atribName+"\"];");
			pos++;
		}
		out.write("\n\t\t\t"+instancia+"s.Add("+ instancia+");");
		out.write("\n\t\t}");
		
		out.write("\n");
		out.write("\n\t\treader.Close();");
		//out.write("\n\t\tcomando.Close();");
		out.write("\n\t\treturn "+ instancia + "s;");

		out.write("\n");
		out.write("\n\t}");
	}

	private void geraGetById(String entidade) {
		String instancia = toLowerCaseFirstChar(entidade);
		List<Simbolo> atribSimbs = TabelaSimbolos.getSimbolosAtribByEscopo(entidade);
		String idTipo = atribSimbs.get(0).getTipo();
		String idName = atribSimbs.get(0).getToken().getImagem();
		if (idTipo.equals("Integer")) {
			idTipo = "Int32";
		}
		out.write("\n\n\tpublic "+toUpperCaseFirstChar(entidade)+" GetById("+ idTipo + " id"  +") {");
		out.write("\n");

		String sql = "select * from " + entidade + " where "+ idName + " = @"+idName;
		out.write("\n\t\tSqlCommand comando = new SqlCommand();");
		out.write("\n\t\tcomando.Connection = conexao;");
		out.write("\n\t\tcomando.CommandType = System.Data.CommandType.Text;");
		out.write("\n\t\tif(tx != null) {");
		out.write("\n\t\t\tcomando.Transaction = tx;");
		out.write("\n\t\t}");
		out.write("\n\t\tcomando.CommandText = \""+sql+"\";");
		out.write("\n\t\tcomando.Parameters.AddWithValue(\"@" + idName + "\", id);");
		out.write("\n\t\tSqlDataReader reader = comando.ExecuteReader();");
		
		out.write("\n");
		out.write("\n\t\t"+toUpperCaseFirstChar(entidade) + " " + instancia + " = null;");
		out.write("\n\t\tif (reader.Read()) {");
		
		out.write("\n\t\t\t"+instancia + " = new "+ toUpperCaseFirstChar(entidade) + "();");
		int pos = 1;
		for (Simbolo atrib : atribSimbs) {
			String atribName = atrib.getToken().getImagem();
			String atribTipo = atrib.getTipo();
			if (atribTipo.equals("Integer")) {
				atribTipo = "Int32";
			}
			out.write("\n\t\t\t" + instancia + "." + toUpperCaseFirstChar(atribName) + " = ("+ atribTipo +") reader[" + "\""+atribName+"\"];");
			pos++;
		}
		out.write("\n\t\t}");
		
		out.write("\n");
		out.write("\n\t\treader.Close();");
		//out.write("\n\t\tcomando.Close();");
		out.write("\n\t\treturn " + instancia+ ";");

		out.write("\n");
		out.write("\n\t}");
	}

	private void geraDelete(String entidade) {
		String instancia = toLowerCaseFirstChar(entidade);
		out.write("\n\n\tpublic Boolean Delete(" + toUpperCaseFirstChar(entidade) + " " + instancia + ") {");
		out.write("\n");

		List<Simbolo> atribSimbs = TabelaSimbolos.getSimbolosAtribByEscopo(entidade);
		String sql = geraSqlDelete(entidade, atribSimbs);
		out.write("\n\t\tSqlCommand comando = new SqlCommand();");
		out.write("\n\t\tcomando.Connection = conexao;");
		out.write("\n\t\tcomando.CommandType = System.Data.CommandType.Text;");
		out.write("\n\t\tif(tx != null) {");
		out.write("\n\t\t\tcomando.Transaction = tx;");
		out.write("\n\t\t}");
		out.write("\n\t\tcomando.CommandText = \""+sql+"\";");
		
		Simbolo atrib = atribSimbs.get(0);
		String atribName = atrib.getToken().getImagem();
		
		out.write("\n\t\tcomando.Parameters.AddWithValue(\"@" + atribName + "\", " + instancia + "." + toUpperCaseFirstChar(atribName)+ ");");
		out.write("\n\t\tint n = comando.ExecuteNonQuery();");
		out.write("\n\t\treturn n >= 1;");
		out.write("\n\t}");
	}
	
	private void geraDeleteById(String entidade) {
		String instancia = toLowerCaseFirstChar(entidade);
		List<Simbolo> atribSimbs = TabelaSimbolos.getSimbolosAtribByEscopo(entidade);
		String idTipo = atribSimbs.get(0).getTipo();
		String idName = atribSimbs.get(0).getToken().getImagem();
		if (idTipo.equals("Integer")) {
			idTipo = "Int32";
		}
		out.write("\n\n\tpublic Boolean Delete(" + idTipo + " id) {");
		out.write("\n");

		String sql = geraSqlDelete(entidade, atribSimbs);
		out.write("\n\t\tSqlCommand comando = new SqlCommand();");
		out.write("\n\t\tcomando.Connection = conexao;");
		out.write("\n\t\tcomando.CommandType = System.Data.CommandType.Text;");
		out.write("\n\t\tif(tx != null) {");
		out.write("\n\t\t\tcomando.Transaction = tx;");
		out.write("\n\t\t}");
		out.write("\n\t\tcomando.CommandText = \""+sql+"\";");
		
		Simbolo atrib = atribSimbs.get(0);
		String atribName = atrib.getToken().getImagem();
		
		out.write("\n\t\tcomando.Parameters.AddWithValue(\"@" + atribName + "\", id);");
		out.write("\n\t\tint n = comando.ExecuteNonQuery();");
		out.write("\n\t\treturn n >= 1;");
		out.write("\n\t}");
	}

	private String geraSqlDelete(String entidade, List<Simbolo> atribSimbs) {

		StringBuilder sql = new StringBuilder();
		sql.append("delete from " + entidade + " where " + atribSimbs.get(0).getToken().getImagem() + " = @"+atribSimbs.get(0).getToken().getImagem());
		return sql.toString();
	}

	private void geraUpdate(String entidade) {
		String instancia = toLowerCaseFirstChar(entidade);
		out.write("\n\n\tpublic Boolean Update(" + toUpperCaseFirstChar(entidade) + " " + instancia + ") {");
		out.write("\n");

		List<Simbolo> atribSimbs = TabelaSimbolos.getSimbolosAtribByEscopo(entidade);
		String sql = geraSqlUpdate(entidade, atribSimbs);
		out.write("\n\t\tSqlCommand comando = new SqlCommand();");
		out.write("\n\t\tcomando.Connection = conexao;");
		out.write("\n\t\tcomando.CommandType = System.Data.CommandType.Text;");
		out.write("\n\t\tif(tx != null) {");
		out.write("\n\t\t\tcomando.Transaction = tx;");
		out.write("\n\t\t}");
		out.write("\n\t\tcomando.CommandText = \""+sql+"\";");
		for (Simbolo atrib : atribSimbs) {
			//comando.Parameters.AddWithValue("@descricao", produto.Descricao);
			String atribName = atrib.getToken().getImagem();
			out.write("\n\t\tcomando.Parameters.AddWithValue(\"@" + atribName + "\", " + instancia + "." + toUpperCaseFirstChar(atribName)+ ");");
		}
		out.write("\n\t\tint n = comando.ExecuteNonQuery();");
		out.write("\n\t\treturn n >= 1;");
		out.write("\n\t}");
	}

	private String geraSqlUpdate(String entidade, List<Simbolo> atribSimbs) {

		StringBuilder sql = new StringBuilder();
		sql.append("update " + entidade + " set " + atribSimbs.get(1).getToken().getImagem() + " = @"+atribSimbs.get(1).getToken().getImagem());
		for (int i = 2; i < atribSimbs.size(); i++) {
			Simbolo atrib = atribSimbs.get(i);
			sql.append(", " + atrib.getToken().getImagem() + " = @"+atrib.getToken().getImagem());
		}
		sql.append(" where " + atribSimbs.get(0).getToken().getImagem() + " = @"+atribSimbs.get(0).getToken().getImagem());
		return sql.toString();
	}

	private void geraInsert(String entidade) {
		String instancia = toLowerCaseFirstChar(entidade);
		out.write("\n\n\tpublic Boolean Insert(" + toUpperCaseFirstChar(entidade) + " " + instancia + ") {");

		List<Simbolo> atribSimbs = TabelaSimbolos.getSimbolosAtribByEscopo(entidade);
		String sql = geraSqlInsert(entidade, atribSimbs);
		out.write("\n\t\tSqlCommand comando = new SqlCommand();");
		out.write("\n\t\tcomando.Connection = conexao;");
		out.write("\n\t\tcomando.CommandType = System.Data.CommandType.Text;");
		out.write("\n\t\tif(tx != null) {");
		out.write("\n\t\t\tcomando.Transaction = tx;");
		out.write("\n\t\t}");
		out.write("\n\t\tcomando.CommandText = \""+sql+"\";");
		
		for (Simbolo atrib : atribSimbs) {
			//comando.Parameters.AddWithValue("@descricao", produto.Descricao);
			String atribName = atrib.getToken().getImagem();
			out.write("\n\t\tcomando.Parameters.AddWithValue(\"@" + atribName + "\", " + instancia + "." + toUpperCaseFirstChar(atribName)+ ");");
		}
		out.write("\n\t\tint n = comando.ExecuteNonQuery();");
		out.write("\n\t\treturn n >= 1;");
		out.write("\n\t}");
	}

	private void geraInsertIdentity(String entidade) {
		String instancia = toLowerCaseFirstChar(entidade);
		out.write("\n\n\tpublic Boolean InsertIdentity(" + toUpperCaseFirstChar(entidade) + " " + instancia + ") {");

		List<Simbolo> atribSimbs = TabelaSimbolos.getSimbolosAtribByEscopo(entidade);
		String sql = geraSqlInsertIdentity(entidade, atribSimbs);
		out.write("\n\t\tSqlCommand comando = new SqlCommand();");
		out.write("\n\t\tcomando.Connection = conexao;");
		out.write("\n\t\tcomando.CommandType = System.Data.CommandType.Text;");
		out.write("\n\t\tif(tx != null) {");
		out.write("\n\t\t\tcomando.Transaction = tx;");
		out.write("\n\t\t}");
		out.write("\n\t\tcomando.CommandText = \""+sql+"\";");
		int pos = 1;
		for (Simbolo atrib : atribSimbs) {
			//comando.Parameters.AddWithValue("@descricao", produto.Descricao);
			String atribName = atrib.getToken().getImagem();
			out.write("\n\t\tcomando.Parameters.AddWithValue(\"@" + atribName + "\", " + instancia + "." + toUpperCaseFirstChar(atribName)+ ");");
		}
		out.write("\n\t\tdecimal n = (decimal) comando.ExecuteScalar();");
		out.write("\n\t\t"+instancia+"."+toUpperCaseFirstChar(atribSimbs.get(0).getToken().getImagem())+" = Convert.ToInt32(n);");
		out.write("\n\t\treturn n >= 1;");
		out.write("\n\t}");
	}
	
	private String geraSqlInsert(String entidade, List<Simbolo> atribSimbs) {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into " + entidade + " (" + atribSimbs.get(0).getToken().getImagem());
		for (int i = 1; i < atribSimbs.size(); i++) {
			Simbolo atrib = atribSimbs.get(i);
			sql.append("," + atrib.getToken().getImagem());
		}
		sql.append(") values (@" + atribSimbs.get(0).getToken().getImagem());
		for (int i = 1; i < atribSimbs.size(); i++) {
			Simbolo atrib = atribSimbs.get(i);
			sql.append(",@" + atrib.getToken().getImagem());
		}
		sql.append(")");
		return sql.toString();
	}
	
	private String geraSqlInsertIdentity(String entidade, List<Simbolo> atribSimbs) {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into " + entidade + " (" + atribSimbs.get(1).getToken().getImagem());
		for (int i = 2; i < atribSimbs.size(); i++) {
			Simbolo atrib = atribSimbs.get(i);
			sql.append("," + atrib.getToken().getImagem());
		}
		sql.append(") values (@" + atribSimbs.get(1).getToken().getImagem());
		for (int i = 2; i < atribSimbs.size(); i++) {
			Simbolo atrib = atribSimbs.get(i);
			sql.append(",@" + atrib.getToken().getImagem());
		}
		sql.append("); select @@identity from "+ entidade );
		return sql.toString();
	}

	private String toLowerCaseFirstChar(String idImagem) {
		String firstLower = idImagem.substring(0, 1).toLowerCase();
		String tail = idImagem.substring(1, idImagem.length());
		return firstLower + tail;
	}

	/**
	 * <Alter Stm> ::= alter table Id add <Constraint>
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
	 * <Field Def List 2> ::= ',' <Field Def> <Field Def List 2> | <Constraint
	 * List>
	 */
	private Object fieldDefList2(Node no) {
		if (no.getFilhos().size() > 1) {
			gerar(no.getFilho(1));
			gerar(no.getFilho(2));
		} else {
			gerar(no.getFilho(0));
		}
		return null;
	}

	/**
	 * <Field Def> ::= Id <Type> <Not Null>
	 */
	private Object fieldDef(Node no) {
		Token id = no.getFilho(0).getToken();
		String tipo = (String) gerar(no.getFilho(1));

		if(tipo.equals("Integer")) {
			tipo= "Int32";				//conversão na marra!! TODO: melhorar isso!
		}
		if (gerarAtribs) {
			out.write("\n\tprivate " + tipo + " " + id.getImagem() + ";");

		} else { // gerar gets e sets

			out.write("\n\n\tpublic " + tipo + " " + toUpperCaseFirstChar(id.getImagem()) + " {");
			out.write("\n\t\tget { return " + id.getImagem() + "; }");
			out.write("\n\t\tset { " + id.getImagem() + " = value; }");
			out.write("\n\t}");
		}

		return null;
	}

	private String toUpperCaseFirstChar(String idImagem) {
		String firstUpper = idImagem.substring(0, 1).toUpperCase();
		String tail = idImagem.substring(1, idImagem.length());
		return firstUpper + tail;
	}

	/**
	 * <Type> ::= bit | date | time | timestamp | decimal | real | float |
	 * smallint | integer | int | interval | character | varchar <Tamanho>
	 */
	private Object type(Node no) {
		return TabelaSimbolos.getTipoJavaEquivalente(no.getFilho(0).getToken().getImagem());
	}
	
	/**
	 * <Constraint List> ::= ',' <Constraint Type> <Constraint List> |   
	 
	private Object constraintList(Node no){
		if(no.getFilhos().size() > 0) {
			gerar(no.getFilho(1));
			gerar(no.getFilho(2));
		}
		return null;
	}
	*/
	
	/**
	 * <Constraint Type> ::= primary key '(' <Id List> ')'
                    | foreign key '(' <Id List> ')' references Id '(' <Id List> ')'
	 
	private Object constraintType(Node no){
		
		return null;
	}
	*/
	
}
