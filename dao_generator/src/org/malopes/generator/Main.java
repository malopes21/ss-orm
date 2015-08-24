package org.malopes.generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

import org.malopes.generator.defs.Linguagem;
import org.malopes.generator.defs.TabelaSimbolos;
import org.malopes.generator.fases.AnalisadorLexico;
import org.malopes.generator.fases.AnalisadorSemantico;
import org.malopes.generator.fases.AnalisadorSintaticoGA;
import org.malopes.generator.fases.GeradorCodigoCsharp;
import org.malopes.generator.fases.GeradorCodigoJava;

public class Main {

	private Boolean DEBUG = true;
	private Boolean COMPILER = true;
	private Linguagem linguagem = Linguagem.JAVA;

	public static void main(String[] args) throws FileNotFoundException {
		String fileName = null;
		if(args.length > 0) {
			fileName = args[0];
		}
		
		new Main().testa(fileName);
		// roda(args);
	}

	private void print(String msg) {
		if (DEBUG) {
			System.out.println(msg);
		}
	}

	private void testa(String fileName) throws FileNotFoundException {
		long inicio = System.currentTimeMillis();

		// Carga do programa a ser analisado
		String filePath;
		try {
			// filePath = getClass().getResource("prog01.ssp").getFile();
			if(fileName != null) {
				filePath = fileName;
			} else {
				filePath = "script03.sql";
			}
			
			print("Analisando arquivo: " + filePath);
		} catch (Exception e) {
			System.err.println("ERRO de : " + e);
			return;
		}

		// Analise Lexica
		AnalisadorLexico analisadorLexico = new AnalisadorLexico();
		boolean analiseLexicaOk = analisadorLexico.analisa(filePath);

		if (!analiseLexicaOk) {
			System.err.println("Erro de analise lexica!");
			analisadorLexico.mostraErros();
			return;
		}

		print("Analise Lexica OK!");
		analisadorLexico.mostraTokens();
		if(analisadorLexico.getLinguagem() != null) {
			linguagem = analisadorLexico.getLinguagem();
		}

		// Analise Sintatica com Geracao de arvore
		AnalisadorSintaticoGA analisadorSintatico = new AnalisadorSintaticoGA(
				analisadorLexico.getTokens());
		boolean analisesintaticaOk = analisadorSintatico.analisa();

		if (!analisesintaticaOk) {
			System.err.println("Erro de analise sintatica!");
			analisadorSintatico.mostraErros();
			return;
		}

		print("Analise Sintatica OK!");
		if (DEBUG) {
			analisadorLexico.mostraTokens();
			TabelaSimbolos.listaTabela();
			analisadorSintatico.mostraArvore();
		}

		// Analise Semantica
		AnalisadorSemantico analisadorSemantico = new AnalisadorSemantico(
				analisadorSintatico.getRaiz());
		boolean analiseSemanticaOk = analisadorSemantico.analisar();
		if (!analiseSemanticaOk) {
			System.err.println("Erro de analise semantica!");
			analisadorSemantico.mostraErros();
			return;
		}

		print("\nAnalise Semantica OK!");
		if (DEBUG) {
			TabelaSimbolos.listaTabela();
		}

		if(linguagem == Linguagem.JAVA) {
			GeradorCodigoJava geradorCodigo = new GeradorCodigoJava(analisadorSintatico.getRaiz());
			geradorCodigo.gerar();
		} else if(linguagem == Linguagem.C_SHARP) {
			GeradorCodigoCsharp geradorCodigo = new GeradorCodigoCsharp(analisadorSintatico.getRaiz());
			geradorCodigo.gerar();
		}
		

		
		System.out.println("OK, GERAÇÃO ENCERRADA!");

	}

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

		// malopes final
		/*
		 * System.out.println("Analise Lexica OK!");
		 * analisadorLexico.mostraTokens(); TabelaSimbolos.listaTabela();
		 */

		// Analise Sintatica com Geracao de arvore
		/*
		 * AnalisadorSintaticoGA analisadorSintaticoGA = new
		 * AnalisadorSintaticoGA(analisadorLexico.getTokens()); boolean
		 * analisesintaticaOk = analisadorSintaticoGA.analisa();
		 * 
		 * if (!analisesintaticaOk) {
		 * System.err.println("Erro de analise sintatica!");
		 * analisadorSintaticoGA.mostraErros(); return; }
		 * 
		 * //malopes final System.out.println("\nAnalise Sintatica OK!");
		 * analisadorSintaticoGA.mostraArvore();
		 * 
		 * //Analise Semantica AnalisadorSemantico analisadorSemantico = new
		 * AnalisadorSemantico(analisadorSintaticoGA.getRoot()); boolean
		 * analiseSemanticaOk = analisadorSemantico.analisa();
		 * if(!analiseSemanticaOk){
		 * System.err.println("Erro de analise semantica!");
		 * analisadorSemantico.mostraErros(); return; }
		 * 
		 * //malopes final System.out.println("\nAnalise Semantica OK!");
		 * TabelaSimbolos.listaTabela();
		 * 
		 * Executor executor = new Executor(analisadorSintaticoGA.getRoot());
		 * executor.eval();
		 * 
		 * //malopes final System.out.println("\nExecucao Encerrada!");
		 * TabelaSimbolos.listaTabela();
		 * 
		 * long fim = System.currentTimeMillis();
		 * System.out.println("\n\nTempo exec.: " + (fim - inicio) +
		 * " milesegundos.");
		 */}
}
