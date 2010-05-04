package org.malopes.ssp;

public class Main {

	public static void main(String[] args) {
		new Main().testa();
		//roda(args);
	}

	private void testa() {
		long inicio = System.currentTimeMillis();
		
		//Carga do programa a ser analisado
		String filePath;
		try {
			//filePath = getClass().getResource("prog01.ssp").getFile();
			filePath = "prog02.ssp";
			System.out.println("Analisando arquivo: "+filePath);
		} catch (Exception e) {
			System.err.println("ERRO de : "+e);
			return;
		}
		
		//Analise Lexica
		AnalisadorLexico analisadorLexico = new AnalisadorLexico();
		boolean analiseLexicaOk = analisadorLexico.analisa(filePath);
		
		if(!analiseLexicaOk){
			System.err.println("Erro de analise lexica!");
			analisadorLexico.mostraErros();
			return;
		}
		
		System.out.println("Analise Lexica OK!");


		//Analise Sintatica com Geracao de arvore
		AnalisadorSintaticoGA analisadorSintatico = new AnalisadorSintaticoGA(analisadorLexico.getTokens());
		boolean analisesintaticaOk = analisadorSintatico.analisa();
		
		if (!analisesintaticaOk) {
			System.err.println("Erro de analise sintatica!");
			analisadorSintatico.mostraErros();
			return;
		}
		
		System.out.println("Analise Sintatica OK!");
		analisadorLexico.mostraTokens();
		TabelaSimbolos.listaTabela();
		
		analisadorSintatico.mostraArvore();
		
		//Analise Semantica 
		AnalisadorSemantico analisadorSemantico = new AnalisadorSemantico(analisadorSintatico.getRaiz());
		boolean analiseSemanticaOk = analisadorSemantico.analisar();
		if(!analiseSemanticaOk){
			System.err.println("Erro de analise semantica!");
			analisadorSemantico.mostraErros();
			return;
		}
		
		System.out.println("\nAnalise Semantica OK!");
		TabelaSimbolos.listaTabela();
		
		Interpretador interpreter = new Interpretador( analisadorSintatico.getRaiz() );
		interpreter.interpretar();
		
		System.out.println("\nInterpretacao OK!");
		TabelaSimbolos.listaTabela();
		/*
		System.out.println("\nAnalise Sintatica OK!");
		analisadorSintaticoGA.mostraArvore();
		
		
		
		Executor executor = new Executor(analisadorSintaticoGA.getRoot());
		executor.eval();
		
		System.out.println("\nExecucao Encerrada!");
		TabelaSimbolos.listaTabela();
		
		long fim = System.currentTimeMillis();
		System.out.println("\n\nTempo exec.: " + (fim - inicio));
*/	}

	
	private static void roda(String[] args) {
		if (args.length <= 0) {
			System.out.println("Use: java -jar sca.jar <arq-fonte>");
			return;
		}
		long inicio = System.currentTimeMillis();

		AnalisadorLexico analisadorLexico = new AnalisadorLexico();
		try {
			analisadorLexico.analisa(args[0]);
		} catch (Exception e) {
			System.err.println("ERRO: " + e);
			return;
		}
		
		//malopes final
		/*System.out.println("Analise Lexica OK!");
		analisadorLexico.mostraTokens();
		TabelaSimbolos.listaTabela();*/

		//Analise Sintatica com Geracao de arvore
		/*AnalisadorSintaticoGA analisadorSintaticoGA = new AnalisadorSintaticoGA(analisadorLexico.getTokens());
		boolean analisesintaticaOk = analisadorSintaticoGA.analisa();
		
		if (!analisesintaticaOk) {
			System.err.println("Erro de analise sintatica!");
			analisadorSintaticoGA.mostraErros();
			return;
		}

		//malopes final
		System.out.println("\nAnalise Sintatica OK!");
		analisadorSintaticoGA.mostraArvore();
		
		//Analise Semantica 
		AnalisadorSemantico analisadorSemantico = new AnalisadorSemantico(analisadorSintaticoGA.getRoot());
		boolean analiseSemanticaOk = analisadorSemantico.analisa();
		if(!analiseSemanticaOk){
			System.err.println("Erro de analise semantica!");
			analisadorSemantico.mostraErros();
			return;
		}
		
		//malopes final
		System.out.println("\nAnalise Semantica OK!");
		TabelaSimbolos.listaTabela();
		
		Executor executor = new Executor(analisadorSintaticoGA.getRoot());
		executor.eval();
		
		//malopes final
		System.out.println("\nExecucao Encerrada!");
		TabelaSimbolos.listaTabela();
		
		long fim = System.currentTimeMillis();
		System.out.println("\n\nTempo exec.: " + (fim - inicio) + " milesegundos.");
*/	}
}
