package org.asm.fase;

import java.util.ArrayList;
import java.util.List;

import org.asm.def.Clazz;
import org.asm.def.Node;
import org.asm.def.Simbolo;
import org.asm.def.TabelaSimbolos;
import org.asm.def.Token;

public class Syntatic {

	private List<Token> tokens = null;
	private int pToken;
	private Token token;
	private List<String> erros = new ArrayList<String>();
	private Node raiz;

	public Syntatic(List<Token> tokens) {
		this.tokens = tokens;
	}

	public Node getRaiz() {
		return raiz;
	}

	private void nextToken() {
		if (token != null && token.getClazz() == Clazz.Identifier) {
			Simbolo simbolo = new Simbolo(token, "", null, null);
			TabelaSimbolos.addSimbolo(simbolo);
		}

		token = tokens.get(pToken);
		pToken++;
	}

	public boolean analyze() {
		pToken = 0;
        nextToken();
        raiz = start();
        if (token.getClazz() != Clazz.EOF) {
                erros.add("[Syntatic.analyze]. Esperado EOF. Linha: " + token.getLine() + ", coluna: " + token.getColum());
        }

        return erros.size() == 0;
	}

	//<Start>   ::= <nl opt> <Program> <nl Opt>
	private Node start() {
		nlOpt();
		program();
		nlOpt();
		return null;
	}

	//<nl Opt> ::= NewLine <nl Opt> |  !Empty
	private void nlOpt() {
		if(token.getClazz() == Clazz.Delimiter_newLine) {
			nextToken();
			nlOpt();
		}
	}

	//<Program> ::= <DATA> <CODE> '.END'  
	private void program() {
		data();
		code();
		if(token.getImage().equalsIgnoreCase(".END")) {
			nextToken();
		} else {
			 erros.add("Syntatic error in program(): expected '.END'." + " Line: " + token.getLine());
		}
	}
	

	//<DATA> ::= '.DATA' <nl> <Decls>
	private void data() {
		if(token.getImage().equalsIgnoreCase(".DATA")) {
			nextToken();
			nl();
			decls();
		} else {
			 erros.add("Syntatic error in data(): expected '.DATA'." + " Line: " + token.getLine());
		}
	}

	//<nl>     ::= NewLine <nl Opt> 
	private void nl() {
		if(token.getClazz() == Clazz.Delimiter_newLine) {
			nextToken();
			nlOpt();
		} else {
			erros.add("Syntatic error in nl(): expected 'New Line'." + " Line: " + token.getLine());
		}
	}

	//<Decls> ::= <Decl> <nl> <Decls> | 
	private void decls() {
		if(token.getClazz() == Clazz.Identifier) {
			decl();
			nl();
			decls();
		}
	}

	//<Decl> ::= Id <Tipo> <Valor> 
	private void decl() {
		if(token.getClazz() == Clazz.Identifier) {
			nextToken();
			tipo();
			valor();
		} else {
			erros.add("Syntatic error in decl(): expected ID." + " Line: " + token.getLine());
		}
	}

	//<Tipo> ::= 'DB' | 'DW'
	private void tipo() {
		if(token.getImage().equalsIgnoreCase("DB") || token.getImage().equalsIgnoreCase("DW") ) {
			nextToken();
		} else {
			erros.add("Syntatic error in tipo(): expected 'DB' or 'DW'." + " Line: " + token.getLine());
		}
	}

	//<Valor> ::= StringLiteral | DecimalLiteral | HexaLiteral | CharLiteral
	private void valor() {
		if(token.getClazz() == Clazz.Literal_String ||
				token.getClazz() == Clazz.Literal_Decimal ||
				token.getClazz() == Clazz.Literal_Hexa ||
				token.getClazz() == Clazz.Literal_Char) {
			nextToken();
		} else {
			erros.add("Syntatic error in valor(): expected StringLiteral | DecimalLiteral | HexaLiteral | CharLiteral." + " Line: " + token.getLine());
		}
	}

	//<CODE> ::= '.CODE' <nl> <Commands>
	private void code() {
		if(token.getImage().equalsIgnoreCase(".CODE")) {
			nl();
			commands();
		} else {
			erros.add("Syntatic error in code(): expected '.CODE'." + " Line: " + token.getLine());
		}
	}

	//<Commands> ::= <Command> <nl> <Commands> |
	private void commands() {
		if(token.getClazz() == Clazz.Identifier ||
				token.getImage().equalsIgnoreCase("COPY") || 
				token.getImage().equalsIgnoreCase("ADD") ||
				token.getImage().equalsIgnoreCase("SUB") ||
				token.getImage().equalsIgnoreCase("MUL") ||
				token.getImage().equalsIgnoreCase("DIV") ||
				token.getImage().equalsIgnoreCase("CMP") ||
				token.getImage().equalsIgnoreCase("JMP") ||
				token.getImage().equalsIgnoreCase("JG") ||
				token.getImage().equalsIgnoreCase("JGE") ||
				token.getImage().equalsIgnoreCase("JL") ||
				token.getImage().equalsIgnoreCase("JLE") ||
				token.getImage().equalsIgnoreCase("JE") ||
				token.getImage().equalsIgnoreCase("JNE") ||
				token.getImage().equalsIgnoreCase("LOAD") ||
				token.getImage().equalsIgnoreCase("STORE") ||
				token.getImage().equalsIgnoreCase("PUSH") ||
				token.getImage().equalsIgnoreCase("POP") ||
				token.getImage().equalsIgnoreCase("EXIT")
				) {
			command();
			nl();
			commands();
		} 
	}
	
	//<Command> ::= <Label> <nl Opt> <Statment> <Args>
	private void command() {
		label();
		nlOpt();
		statment();
		args();
	}

	//<Label> ::= Id ':' |
	private void label() {
		if(token.getClazz() == Clazz.Identifier) {
			nextToken();
			if(token.getImage().equals(":")) {
				nextToken();
			} else {
				erros.add("Syntatic error in label(): expected ':'." + " Line: " + token.getLine());
			}
		}
	}

	//<Statment> ::= 'COPY' | 'ADD' | 'SUB' | 'MUL' | 'DIV' | 'CMP' | 'JMP' | 'JG' | 'JGE' | 'JL' | 'JLE' |
	//'JE' | 'JNE' | 'LOAD' | 'STORE' | 'PUSH' | 'POP' | 'EXIT'
	private void statment() {
		if(token.getImage().equalsIgnoreCase("COPY") || 
				token.getImage().equalsIgnoreCase("ADD") ||
				token.getImage().equalsIgnoreCase("SUB") ||
				token.getImage().equalsIgnoreCase("MUL") ||
				token.getImage().equalsIgnoreCase("DIV") ||
				token.getImage().equalsIgnoreCase("CMP") ||
				token.getImage().equalsIgnoreCase("JMP") ||
				token.getImage().equalsIgnoreCase("JG") ||
				token.getImage().equalsIgnoreCase("JGE") ||
				token.getImage().equalsIgnoreCase("JL") ||
				token.getImage().equalsIgnoreCase("JLE") ||
				token.getImage().equalsIgnoreCase("JE") ||
				token.getImage().equalsIgnoreCase("JNE") ||
				token.getImage().equalsIgnoreCase("LOAD") ||
				token.getImage().equalsIgnoreCase("STORE") ||
				token.getImage().equalsIgnoreCase("PUSH") ||
				token.getImage().equalsIgnoreCase("POP") ||
				token.getImage().equalsIgnoreCase("EXIT")
				) {
			nextToken();
		} else {
			erros.add("Syntatic error in statement(): expected 'COPY' | 'ADD' | 'SUB' | 'MUL' | 'DIV' | 'CMP' | 'JMP' | 'JG' | 'JGE' | 'JL' | 'JLE' |'JE' | 'JNE' | 'LOAD' | 'STORE' | 'PUSH' | 'POP' | 'EXIT'." + " Line: " + token.getLine());
		}
	}

	//<Args> ::= <Operan> <Args2> |
	private void args() {
		if(token.getClazz() == Clazz.Identifier || 
				token.getClazz() == Clazz.Literal_Decimal ||
				token.getClazz() == Clazz.Literal_Hexa ||
				token.getClazz() == Clazz.Literal_Char) {
			operan();
			args2();
		} 
	}

	//<Args2> ::= ',' <Operan> |
	private void args2() {
		if(token.getImage().equals(",")) {
			nextToken();
			operan();
		}
	}
	
	//<Operan> ::= Id | DecimalLiteral | HexaLiteral | CharLiteral  
	private void operan() {
		if(token.getClazz() == Clazz.Identifier || 
				token.getClazz() == Clazz.Literal_Decimal ||
				token.getClazz() == Clazz.Literal_Hexa ||
				token.getClazz() == Clazz.Literal_Char) {
			nextToken();
		} else {
			erros.add("Syntatic error in operan(): expected 'Id | DecimalLiteral | HexaLiteral | CharLiteral'." + " Line: " + token.getLine());
		}
	}
	
	public void showErrors() {

	}

}
