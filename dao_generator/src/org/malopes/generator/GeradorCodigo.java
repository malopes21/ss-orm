package org.malopes.generator;

import java.io.PrintWriter;

public class GeradorCodigo {
	
	private Node raiz;
	private PrintWriter out;
	private String fileName;
	
	public GeradorCodigo(Node raiz, PrintWriter out, String fileName) {
		this.raiz = raiz;
		this.out = out;
		this.fileName = fileName;
	}

	public void gerar() {
		gerarCabecalho();
		gerar(raiz);
		gerarRodape();
	}

	private void gerarRodape() {
		out.write("\n}");
	}

	private void gerarCabecalho() {
		
		out.write("public class " + fileName + " {");
		out.write("\n\n\tpublic static void main(String args[]) {");
		out.write("\n\t\tprincipal();");
		out.write("\n\t}");
	}

	private Object gerar(Node no) {
		switch (no.getTipo()) {
			case Query_List:
				return QueryList(no);
			
		}
		
		return null;
	}

	/**
	 * <Query_List> ::=  <Query> ';' <Query_List> | 
	 */
	private Object QueryList(Node no) {
		// TODO Auto-generated method stub
		return null;
	}


	
}
