package org.asm.fase;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.asm.def.Clazz;
import org.asm.def.Node;
import org.asm.def.Token;

public class CodeGenerator {

	private Node raiz;
	private PrintWriter out;

	public CodeGenerator(Node raiz, PrintWriter out) {
		this.raiz = raiz;
		this.out = out;
		// this.fileName = fileName;
	}

	public void gerar() {
		gerarCabecalho();
		gerar(raiz);
		// gerarRodape();
	}

	private void gerarCabecalho() {
		out.write("MVM0");
		out.write((byte) 1);
		out.write((byte) 0);
		out.write((byte) 2);
		out.write((byte) 0);
		out.write((byte) 3);
		out.write((byte) 0);

	}

	private Object gerar(Node no) {
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
			
		}
		return null;
	}


	// <Start> ::= <nl opt> <Program> <nl Opt>
	private Object start(Node no) {
		gerar(no.getFilho(1));
		return null;
	}

	// <Program> ::= <DATA> <CODE> '.END'
	private Object programa(Node no) {
		// Node CODE first!
		gerar(no.getFilho(1));
		gerar(no.getFilho(0));
		return null;
	}

	//<CODE> ::= '.CODE' <nl> <Commands>
	private Object code(Node no) {
		gerar(no.getFilho(2));
		return null;
	}

	//<Commands> ::= <Command> <nl> <Commands> |
	private Object commands(Node no) {
		if(!no.getFilhos().isEmpty()) {
			gerar(no.getFilho(0));
			gerar(no.getFilho(2));
		}
		return null;
	}
	
	//<Command> ::= <Label> <nl Opt> <Statment> <Args>
	private Object command(Node no) {
		String statment = (String) gerar(no.getFilho(2));
		List<Token> operans = (List<Token>) gerar(no.getFilho(3));
		Collections.reverse(operans);
		
		byte opcode = 0;
		if("COPY".equalsIgnoreCase(statment)) {
			Token operan0 = operans.get(0);			
			Token operan1 = operans.get(1);
			if(operan1.getClazz() == Clazz.Literal_Char || operan1.getClazz() == Clazz.Literal_Decimal || operan1.getClazz() == Clazz.Literal_Hexa ) {
				if(operan0.getImage().equalsIgnoreCase("R0")) {
					opcode = -0b00_000_000;
				} else if(operan0.getImage().equalsIgnoreCase("R1")) {
					opcode = -0b00_000_001;
				} else if(operan0.getImage().equalsIgnoreCase("R2")) {
					opcode = -0b00_000_010;
				} else if(operan0.getImage().equalsIgnoreCase("R3")) {
					opcode = -0b00_000_011;
				}
				short value = getBinaryValue(operan1);
				out.write((byte)opcode);
				out.write((byte)(value << 8));
				out.write((byte)(value % 256));
			} else {
				
			}
		}
		
		return null;
	}

	private short getBinaryValue(Token operan1) {
		// TODO Auto-generated method stub
		return 0;
	}

	//<Statment> ::= 'COPY' | 'ADD' | 'SUB' | 'MUL' | 'DIV' | 'CMP' | 'JMP' | 'JG' |
	//'JGE' | 'JL' | 'JLE' | 'JE' | 'JNE' | 'LOAD' | 'STORE' | 'PUSH' | 'POP' | 'EXIT'
	private Object statment(Node no) {
		
		return no.getFilho(0).getToken().getImage();
	}
	
	//<Args> ::= <Operan> <Args2> |
	private Object args(Node no) {
		if(!no.getFilhos().isEmpty()) {
			Token operan = (Token) gerar(no.getFilho(0));
			List<Token> args2 = (List<Token>) gerar(no.getFilho(1));
			args2.add(operan);
			return args2;
		} 
		return new ArrayList<Token>();
	}

	//<Args2> ::= ',' <Operan> |
	private Object args2(Node no) {
		if(!no.getFilhos().isEmpty()) {
			Token operan = (Token) gerar(no.getFilho(1));
			List<Token> args2 = new ArrayList<Token>();
			args2.add(operan);
			return args2;
		} 
		return new ArrayList<Token>();
	}
	
	//<Operan> ::= Id | DecimalLiteral | HexaLiteral | CharLiteral  
	private Object operan(Node no){
		
		return no.getFilho(0).getToken();
	}


}
