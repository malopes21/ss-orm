package org.asm.def;

import java.util.ArrayList;
import java.util.List;

public class TabelasEstaticas {

    private static List<String> pReservadas = new ArrayList<String>();
    private static List<String> delimitadores = new ArrayList<String>();
    private static List<String> operadores = new ArrayList<String>();
    
    static {
    	//'COPY' | 'ADD' | 'SUB' | 'MUL' | 'DIV' | 'CMP' | 'JMP' | 'JG' | 'JGE' | 'JL' | 'JLE' |
    	//'JE' | 'JNE' | 'LOAD' | 'STORE' | 'PUSH' | 'POP' | 'EXIT'
    	//'DB' | 'DW'
    	//.CODE | .DATA | .END
    	
            pReservadas.add("COPY");
            pReservadas.add("ADD");
            pReservadas.add("SUB");
            pReservadas.add("MUL");
            pReservadas.add("DIV");
            pReservadas.add("CMP");
            pReservadas.add("JMP");
            pReservadas.add("JG");
            pReservadas.add("JGE");
            pReservadas.add("JL");
            pReservadas.add("JLE");
            pReservadas.add("JE");
            pReservadas.add("JNE");
            pReservadas.add("LOAD");
            pReservadas.add("STORE");
            pReservadas.add("PUSH");
            pReservadas.add("POP");
            pReservadas.add("EXIT");
            pReservadas.add("STDOUT");
            pReservadas.add("STDIN");
            pReservadas.add("DB");
            pReservadas.add("DW");
            pReservadas.add(".DATA");
            pReservadas.add(".CODE");
            pReservadas.add(".END");
            
            delimitadores.add(":");
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
