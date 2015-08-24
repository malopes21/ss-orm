package org.asm.fase;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.asm.def.Clazz;
import org.asm.def.Node;
import org.asm.def.TabelaSimbolos;
import org.asm.def.Token;

public class Semantic {

	private Node raiz;
	private List<String> erros = new ArrayList<String>();
	private short instructionCount = 0;

	public Semantic(Node raiz) {
		this.raiz = raiz;
	}

	public boolean analisar() {
		analisar(raiz);
		if (erros.size() == 0) {
			return true;
		}
		return false;
	}
	
	private Object analisar(Node no) {
		switch (no.getTipo()) {
		case Start:
			return start(no);
		case Program:
			return programa(no);
		case Code:
			return code(no);
		case Commands:
			return commands(no);
		case Command:
			return command(no);
		case Statment:
			return statment(no);
		case Args:
			return args(no);
		case Args2:
			return args2(no);
		case Operan:
			return operan(no);
		case Data:
			return data(no);
		case Decls:
			return decls(no);
		case Decl:
			return decl(no);
		case Tipo:
			return tipo(no);
		case Valor:
			return valor(no);
		case Label:
			return label(no);
		default:
			throw new RuntimeException("Method not exists!");
		}
	}

	//<Label> ::= Id ':' |
	private Object label(Node no) {
		if(!no.getFilhos().isEmpty()) {
			return no.getFilho(0).getToken();
		}
		return null;
	}

	// <Start> ::= <nl opt> <Program> <nl Opt>
	private Object start(Node no) {
		analisar(no.getFilho(1));
		return null;
	}

	// <Program> ::= <DATA> <CODE> '.END'
	private Object programa(Node no) {
		// was Node CODE first!
		analisar(no.getFilho(0));
		analisar(no.getFilho(1));
		
		return null;
	}

	// <CODE> ::= '.CODE' <nl> <Commands>
	private Object code(Node no) {
		analisar(no.getFilho(2));
		return null;
	}

	// <Commands> ::= <Command> <nl> <Commands> |
	private Object commands(Node no) {
		if (!no.getFilhos().isEmpty()) {
			analisar(no.getFilho(0));
			analisar(no.getFilho(2));
		}
		return null;
	}

	// <Command> ::= <Label> <nl Opt> <Statment> <Args>
	private Object command(Node no) {
		Token label = (Token) analisar(no.getFilho(0));
		if(label != null) {
			TabelaSimbolos.setMemoryPositionId(label, instructionCount);
		}
		
		String statment = (String) analisar(no.getFilho(2));
		List<Token> operans = (List<Token>) analisar(no.getFilho(3));
		Collections.reverse(operans);
		
		// simple arg. check
		//for(Token operan: operans) {
		//	if(operan.getClazz() == Clazz.Identifier && TabelaSimbolos.getTipoSimbolo(operan) == null) {
		//		erros.add("argumento do tipo variável não declarada: "+operan);
		//	}
		//}

		// 'COPY' | 'LOAD' | 'STORE' | 'ADD' | 'SUB' | 'MUL' | 'DIV' | 'CMP' | 'JMP' |
		// 'JG' |
		// 'JGE' | 'JL' | 'JLE' | 'JE' | 'JNE' |  'PUSH' | 'POP' |
		// 'EXIT'
		if ("COPY".equalsIgnoreCase(statment)) {
			//copy(operans);
		} 

		instructionCount  += 3;
		
		return null;
	}
	
	/****************** -------- ****************/
	

	// <Statment> ::= 'COPY' | 'ADD' | 'SUB' | 'MUL' | 'DIV' | 'CMP' | 'JMP' |
	// 'JG' |
	// 'JGE' | 'JL' | 'JLE' | 'JE' | 'JNE' | 'LOAD' | 'STORE' | 'PUSH' | 'POP' |
	// 'EXIT'
	private Object statment(Node no) {
		return no.getFilho(0).getToken().getImage();
	}

	// <Args> ::= <Operan> <Args2> |
	private Object args(Node no) {
		if (!no.getFilhos().isEmpty()) {
			Token operan = (Token) analisar(no.getFilho(0));
			List<Token> args2 = (List<Token>) analisar(no.getFilho(1));
			args2.add(operan);
			return args2;
		}
		return new ArrayList<Token>();
	}

	// <Args2> ::= ',' <Operan> |
	private Object args2(Node no) {
		if (!no.getFilhos().isEmpty()) {
			Token operan = (Token) analisar(no.getFilho(1));
			List<Token> args2 = new ArrayList<Token>();
			args2.add(operan);
			return args2;
		}
		return new ArrayList<Token>();
	}

	// <Operan> ::= Id | DecimalLiteral | HexaLiteral | CharLiteral
	private Object operan(Node no) {
		return no.getFilho(0).getToken();
	}
	
	//<DATA> ::= '.DATA' <nl> <Decls>
	private Object data(Node no){
		analisar(no.getFilho(2));
		return null;
	}

	//<Decls> ::= <Decl> <nl> <Decls> | 
	private Object decls(Node no){
		if(!no.getFilhos().isEmpty()) {
			analisar(no.getFilho(0));
			analisar(no.getFilho(2));
		}
		return null;
	}
	
	//<Decl> ::= Id <Tipo> <Valor> 
	private Object decl(Node no){
		Token id = no.getFilho(0).getToken();
		String tipo = (String) analisar(no.getFilho(1));
		Token valor = (Token) analisar(no.getFilho(2));
		
		if(TabelaSimbolos.getTipoSimbolo(id) != null) {
			erros.add("variável redeclarada: "+id);
		} else {
			TabelaSimbolos.setTipoSimbolo(id, tipo);
		}
		return null;
	}
	
	//<Tipo> ::= 'DB' | 'DW'
	private Object tipo(Node no){
		return no.getFilho(0).getToken().getImage();
	}
	
	//<Valor> ::= StringLiteral | DecimalLiteral | HexaLiteral | CharLiteral
	private Object valor(Node no){
		return no.getFilho(0).getToken();
	}

	public void showErrors() {
		for(String erro: erros) {
			System.err.println(erro);
		}
	}

}
