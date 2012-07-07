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
import org.omg.CORBA.Environment;

public class GeradorCodigo {

	private Node raiz;
	private PrintWriter out;
	private boolean gerarAtribs;

	public GeradorCodigo(Node raiz) {
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
			out = new PrintWriter(new File("saida\\" + fileName + ".java"));
			out.write("public class " + fileName + " {\n");

			// gera os atributos
			gerarAtribs = true;
			gerar(no.getFilho(4));

			// gera construtor
			out.write("\n\n\tpublic " + fileName + "() {");
			out.write("\n\t}");

			// gera gets e sets
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
			out.write("import java.io.*;\n");
			out.write("import java.util.*;\n");
			out.write("\npublic class " + fileName + "DAO {\n");

			// gera ref. para conexão
			out.write("\n\tprivate Connection conexao;\n");

			// gera construtor
			out.write("\n\tpublic " + fileName + "DAO(Connection conexao) {");
			out.write("\n\t\tthis.conexao = conexao;");
			out.write("\n\t}");

			geraInsert(fileName);
			geraUpdate(fileName);
			geraDelete(fileName);
			geraListAll(fileName);
			geraGetById(fileName);

			out.write("\n}");

			out.flush();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

	}

	private void geraGetById(String entidade) {
		String instancia = toLowerCaseFirstChar(entidade);
		out.write("\n\n\tpublic List<"+entidade+"> listAll() {");
		out.write("\n");

		List<Simbolo> atribSimbs = TabelaSimbolos.getSimbolosAtribByEscopo(entidade);
		String sql = "select * from " + entidade;
		out.write("\n\t\tPreparedStatement stmt = conexao.prepareStatement(\"" + sql + " \");");
		
		out.write("\n");
		out.write("\n\t\tResultSet rs = stmt.executeQuery();");
		out.write("\n\t\twhile(rs.next()) {");
		out.write("\n\t"+entidade + " " + instancia + " = new "+ entidade + "();");
		out.write("\n\t\t\t" + instancia + ".set" + toUpperCaseFirstChar(atribSimbs.get(0).getToken().getImagem()) + "(rs.get" + atribSimbs.get(0).getTipo() + "(1));");
		out.write("\n\t\t}");
		
		int pos = 1;
		for (Simbolo atrib : atribSimbs) {
			String atribName = atrib.getToken().getImagem();
			String atribTipo = atrib.getTipo();
			out.write("\n\t\tstmt.set" + atribTipo + "(" + pos + ", " + instancia + ".get" + toUpperCaseFirstChar(atribName) + "());");
			pos++;
		}
		
		out.write("\n");
		out.write("\n\t\trs.close();");
		out.write("\n\t\tstmt.close();");
		out.write("\n\t\treturn linhas > 0;");

		out.write("\n");
		out.write("\n\t}");
	}

	private void geraListAll(String fileName) {
		out.write("\n\n\tpublic List<" + fileName + "> listAll() {");
		out.write("\n");
		out.write("\n\t}");
	}

	private void geraDelete(String entidade) {
		String instancia = toLowerCaseFirstChar(entidade);
		out.write("\n\n\tpublic boolean delete(" + entidade + " " + instancia + ") {");
		out.write("\n");

		List<Simbolo> atribSimbs = TabelaSimbolos.getSimbolosAtribByEscopo(entidade);
		String sql = geraSqlDelete(entidade, atribSimbs);
		out.write("\n\t\tPreparedStatement stmt = conexao.prepareStatement(\"" + sql + " \");");
		
		Simbolo atrib = atribSimbs.get(0);
		String atribName = atrib.getToken().getImagem();
		String atribTipo = atrib.getTipo();
		out.write("\n\t\tstmt.set" + atribTipo + "(1, " + instancia + ".get" + toUpperCaseFirstChar(atribName) + "());");
		out.write("\n\t\tint linhas = stmt.executeUpdate();");
		out.write("\n");
		out.write("\n\t\tstmt.close();");
		out.write("\n\t\treturn linhas > 0;");

		out.write("\n");
		out.write("\n\t}");
	}

	private String geraSqlDelete(String entidade, List<Simbolo> atribSimbs) {

		StringBuilder sql = new StringBuilder();
		sql.append("delete from " + entidade + " where " + atribSimbs.get(0).getToken().getImagem() + " = ?");
		return sql.toString();
	}

	private void geraUpdate(String entidade) {
		String instancia = toLowerCaseFirstChar(entidade);
		out.write("\n\n\tpublic boolean insert(" + entidade + " " + instancia + ") {");
		out.write("\n");

		List<Simbolo> atribSimbs = TabelaSimbolos.getSimbolosAtribByEscopo(entidade);
		String sql = geraSqlUpdate(entidade, atribSimbs);
		out.write("\n\t\tPreparedStatement stmt = conexao.prepareStatement(\"" + sql + " \");");
		int pos = 1;
		for (int i = 1; i < atribSimbs.size(); i++) {
			Simbolo atrib = atribSimbs.get(i);
			String atribName = atrib.getToken().getImagem();
			String atribTipo = atrib.getTipo();
			out.write("\n\t\tstmt.set" + atribTipo + "(" + pos + ", " + instancia + ".get" + toUpperCaseFirstChar(atribName) + "());");
			pos++;
		}
		Simbolo atrib = atribSimbs.get(0);
		String atribName = atrib.getToken().getImagem();
		String atribTipo = atrib.getTipo();
		out.write("\n\t\tstmt.set" + atribTipo + "(" + pos + ", " + instancia + ".get" + toUpperCaseFirstChar(atribName) + "());");
		out.write("\n\t\tint linhas = stmt.executeUpdate();");
		out.write("\n");
		out.write("\n\t\tstmt.close();");
		out.write("\n\t\treturn linhas > 0;");

		out.write("\n");
		out.write("\n\t}");
	}

	private String geraSqlUpdate(String entidade, List<Simbolo> atribSimbs) {

		StringBuilder sql = new StringBuilder();
		sql.append("update " + entidade + " set " + atribSimbs.get(1).getToken().getImagem() + " = ?");
		for (int i = 2; i < atribSimbs.size(); i++) {
			Simbolo atrib = atribSimbs.get(i);
			sql.append(", " + atrib.getToken().getImagem() + " = ?");
		}
		sql.append(" where " + atribSimbs.get(0).getToken().getImagem() + " = ?");
		return sql.toString();
	}

	private void geraInsert(String entidade) {
		String instancia = toLowerCaseFirstChar(entidade);
		out.write("\n\n\tpublic boolean insert(" + entidade + " " + instancia + ") {");
		out.write("\n");

		List<Simbolo> atribSimbs = TabelaSimbolos.getSimbolosAtribByEscopo(entidade);
		String sql = geraSqlInsert(entidade, atribSimbs);
		out.write("\n\t\tPreparedStatement stmt = conexao.prepareStatement(\"" + sql + " \", Statement.RETURN_GENERATED_KEYS);");
		int pos = 1;
		for (Simbolo atrib : atribSimbs) {
			String atribName = atrib.getToken().getImagem();
			String atribTipo = atrib.getTipo();
			out.write("\n\t\tstmt.set" + atribTipo + "(" + pos + ", " + instancia + ".get" + toUpperCaseFirstChar(atribName) + "());");
			pos++;
		}
		out.write("\n\t\tint linhas = stmt.executeUpdate();");
		out.write("\n");
		out.write("\n\t\tResultSet rs = stmt.getGeneratedKeys();");
		out.write("\n\t\tif(rs != null && rs.next()) {");
		out.write("\n\t\t\t" + instancia + ".set" + toUpperCaseFirstChar(atribSimbs.get(0).getToken().getImagem()) + "(rs.get" + atribSimbs.get(0).getTipo() + "(1));");
		out.write("\n\t\t}");
		out.write("\n");
		out.write("\n\t\trs.close();");
		out.write("\n\t\tstmt.close();");
		out.write("\n\t\treturn linhas > 0;");

		out.write("\n");
		out.write("\n\t}");
	}

	private String geraSqlInsert(String entidade, List<Simbolo> atribSimbs) {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into " + entidade + " (" + atribSimbs.get(0).getToken().getImagem());
		for (int i = 1; i < atribSimbs.size(); i++) {
			Simbolo atrib = atribSimbs.get(i);
			sql.append("," + atrib.getToken().getImagem());
		}
		sql.append(") values (?");
		for (int i = 1; i < atribSimbs.size(); i++) {
			sql.append(", ?");
		}
		sql.append(")");
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

		if (gerarAtribs) {
			out.write("\n\tprivate " + tipo + " " + id.getImagem() + ";");

		} else { // gerar gets e sets

			out.write("\n\n\tpublic " + id.getImagem() + " get" + toUpperCaseFirstChar(id.getImagem()) + "() {");
			out.write("\n\t\treturn " + id.getImagem() + ";");
			out.write("\n\t}");

			out.write("\n\n\tpublic void set" + toUpperCaseFirstChar(id.getImagem()) + "(" + tipo + " " + id.getImagem() + ") {");
			out.write("\n\t\tthis." + id.getImagem() + " = " + id.getImagem() + ";");
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
}
