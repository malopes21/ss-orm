package org.malopes.generator.defs;

import java.util.ArrayList;
import java.util.List;

public class TabelasEstaticas {

	private static List<String> pReservadas = new ArrayList<String>();
	private static List<String> delimitadores = new ArrayList<String>();
	private static List<String> operadores = new ArrayList<String>();
	
	static {
		pReservadas.add("add");
		pReservadas.add("alter");
		pReservadas.add("bit");
		pReservadas.add("character");
		pReservadas.add("constraint");
		pReservadas.add("create");
		pReservadas.add("date");
		pReservadas.add("decimal");
		pReservadas.add("float");
		pReservadas.add("foreign");
		pReservadas.add("int");
		pReservadas.add("integer");
		pReservadas.add("interval");
		pReservadas.add("key");
		pReservadas.add("not");
		pReservadas.add("null");
		pReservadas.add("primary");
		pReservadas.add("real");
		pReservadas.add("references");
		pReservadas.add("smallint");
		pReservadas.add("table");
		pReservadas.add("time");
		pReservadas.add("timestamp");
		pReservadas.add("varchar");
		
		
		delimitadores.add(";");
		delimitadores.add("(");
		delimitadores.add(")");
		delimitadores.add(",");
		/*delimitadores.add(":");
		delimitadores.add("=");
		delimitadores.add("{");
		delimitadores.add("}");*/
		
		/*operadores.add("+");
		operadores.add("-");
		operadores.add("*");
		operadores.add("/");
		operadores.add("<");
		operadores.add("<=");
		operadores.add(">");
		operadores.add(">=");
		operadores.add("!=");
		operadores.add("==");*/
		
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
