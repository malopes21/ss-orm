package org.malopes.ssp;

import java.util.ArrayList;
import java.util.List;

public class TabelasEstaticas {

	private static List<String> pReservadas = new ArrayList<String>();
	private static List<String> delimitadores = new ArrayList<String>();
	private static List<String> operadores = new ArrayList<String>();
	
	static {
		pReservadas.add("def");
		pReservadas.add("var");
		pReservadas.add("se");
		pReservadas.add("enquanto");
		pReservadas.add("senao");
		pReservadas.add("Int");
		pReservadas.add("Real");
		pReservadas.add("Str");
		pReservadas.add("Nada");
		pReservadas.add("ver");
		pReservadas.add("ler");
		pReservadas.add("ret");
		
		delimitadores.add(";");
		delimitadores.add("(");
		delimitadores.add(")");
		delimitadores.add(",");
		delimitadores.add(":");
		delimitadores.add("=");
		delimitadores.add("{");
		delimitadores.add("}");
		
		operadores.add("+");
		operadores.add("-");
		operadores.add("*");
		operadores.add("/");
		operadores.add("<");
		operadores.add("<=");
		operadores.add(">");
		operadores.add(">=");
		operadores.add("!=");
		operadores.add("==");
		
	}

	public static boolean containPReservada(String token) {
		return pReservadas.contains(token);
	}
	
	public static boolean containDelimitador(String token) {
		return delimitadores.contains(token);
	}
	
	public static boolean containOperador(String token) {
		return operadores.contains(token);
	}
	
}
