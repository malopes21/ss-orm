package org.asm.fase;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.asm.def.Clazz;
import org.asm.def.Node;
import org.asm.def.TabelaSimbolos;
import org.asm.def.Token;
import org.mvm.Instruction;

public class CodeGenerator {

	private Node raiz;
	private DataOutputStream out;
	private short memoryPosition;

	public CodeGenerator(Node raiz, DataOutputStream out) {
		this.raiz = raiz;
		this.out = out;
		// this.fileName = fileName;
	}

	public void gerar() throws IOException {
		gerarCabecalho();
		gerar(raiz);
		// gerarRodape();
	}

	private void gerarCabecalho() throws IOException {
		out.writeBytes("MVM0");
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
		default:
			throw new RuntimeException("Method not exists!");

		}
	}

	// <Start> ::= <nl opt> <Program> <nl Opt>
	private Object start(Node no) {
		gerar(no.getFilho(1));
		return null;
	}

	// <Program> ::= <DATA> <CODE> '.END'
	private Object programa(Node no) {
		// Node CODE first! 	invert it! now, DATA first
		gerar(no.getFilho(0));
		gerar(no.getFilho(1));
		
		return null;
	}

	// <CODE> ::= '.CODE' <nl> <Commands>
	private Object code(Node no) {
		gerar(no.getFilho(2));
		try {
			out.writeByte('$');
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	// <Commands> ::= <Command> <nl> <Commands> |
	private Object commands(Node no) {
		if (!no.getFilhos().isEmpty()) {
			gerar(no.getFilho(0));
			gerar(no.getFilho(2));
		}
		return null;
	}

	// <Command> ::= <Label> <nl Opt> <Statment> <Args>
	private Object command(Node no) {

		String statment = (String) gerar(no.getFilho(2));
		List<Token> operans = (List<Token>) gerar(no.getFilho(3));
		Collections.reverse(operans);

		// 'COPY' | 'LOAD' | 'STORE' | 'ADD' | 'SUB' | 'MUL' | 'DIV' | 'CMP' |
		// 'JMP' |
		// 'JG' | 'JGE' | 'JL' | 'JLE' | 'JE' | 'JNE' | 'PUSH' | 'POP' | 'EXIT'
		if ("COPY".equalsIgnoreCase(statment)) {
			copy(operans);
		} else if ("LOAD".equalsIgnoreCase(statment)) {
			load(operans);
		} else if ("STORE".equalsIgnoreCase(statment)) {
			store(operans);
		} else if ("ADD".equalsIgnoreCase(statment)) {
			add(operans);
		} else if ("SUB".equalsIgnoreCase(statment)) {
			sub(operans);
		} else if ("MUL".equalsIgnoreCase(statment)) {
			mul(operans);
		} else if ("DIV".equalsIgnoreCase(statment)) {
			div(operans);
		} else if ("CMP".equalsIgnoreCase(statment)) {
			cmp(operans);
		} else if ("JMP".equalsIgnoreCase(statment)) {
			jmp(operans);
		} else if ("JG".equalsIgnoreCase(statment)) {
			jg(operans);
		} else if ("JGE".equalsIgnoreCase(statment)) {
			jge(operans);
		} else if ("JL".equalsIgnoreCase(statment)) {
			jl(operans);
		} else if ("JLE".equalsIgnoreCase(statment)) {
			jle(operans);
		} else if ("JE".equalsIgnoreCase(statment)) {
			je(operans);
		} else if ("JNE".equalsIgnoreCase(statment)) {
			jne(operans);
		} else if ("PUSH".equalsIgnoreCase(statment)) {
			push(operans);
		} else if ("POP".equalsIgnoreCase(statment)) {
			pop(operans);
		} else if ("EXIT".equalsIgnoreCase(statment)) {
			exit(operans);
		} else if ("STDOUT".equalsIgnoreCase(statment)) {
			stdout(operans);
		} else if ("STDIN".equalsIgnoreCase(statment)) {
			stdin(operans);
		}

		return null;
	}

	private void stdin(List<Token> operans) {
		byte opcode = Instruction.STDIN;
		short value = getBinaryValue(operans.get(0));

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void stdout(List<Token> operans) {
		byte opcode = Instruction.STDOUT;
		short value = getBinaryValue(operans.get(0));

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void pop(List<Token> operans) {
		byte opcode = 0;
		short value = 0;
		Token operan0 = operans.get(0);
		if (operan0.getImage().equalsIgnoreCase("R0")) {
			opcode = Instruction.POP_R0;
		} else if (operan0.getImage().equalsIgnoreCase("R1")) {
			opcode = Instruction.POP_R1;
		} else if (operan0.getImage().equalsIgnoreCase("R2")) {
			opcode = Instruction.POP_R2;
		} else if (operan0.getImage().equalsIgnoreCase("R3")) {
			opcode = Instruction.POP_R3;
		}

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		} 		
	}

	private void push(List<Token> operans) {
		byte opcode = 0;
		short value = 0;
		Token operan0 = operans.get(0);
		if (operan0.getImage().equalsIgnoreCase("R0")) {
			opcode = Instruction.PUSH_R0;
		} else if (operan0.getImage().equalsIgnoreCase("R1")) {
			opcode = Instruction.PUSH_R1;
		} else if (operan0.getImage().equalsIgnoreCase("R2")) {
			opcode = Instruction.PUSH_R2;
		} else if (operan0.getImage().equalsIgnoreCase("R3")) {
			opcode = Instruction.PUSH_R3;
		}

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}

	private void jne(List<Token> operans) {
		byte opcode = Instruction.JNE;

		Token operan0 = operans.get(0);
		short value = getBinaryValue(operan0);

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

	private void je(List<Token> operans) {
		byte opcode = Instruction.JE;

		Token operan0 = operans.get(0);
		short value = getBinaryValue(operan0);

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void jle(List<Token> operans) {
		byte opcode = Instruction.JLE;

		Token operan0 = operans.get(0);
		short value = getBinaryValue(operan0);

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}			
	}

	private void jl(List<Token> operans) {
		byte opcode = Instruction.JL;

		Token operan0 = operans.get(0);
		short value = getBinaryValue(operan0);

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}			
	}

	private void jge(List<Token> operans) {
		byte opcode = Instruction.JGE;

		Token operan0 = operans.get(0);
		short value = getBinaryValue(operan0);

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

	private void jg(List<Token> operans) {
		byte opcode = Instruction.JG;

		Token operan0 = operans.get(0);
		short value = getBinaryValue(operan0);

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void jmp(List<Token> operans) {
		byte opcode = Instruction.JMP;

		Token operan0 = operans.get(0);
		short value = getBinaryValue(operan0);

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void cmp(List<Token> operans) {
		Token operan0 = operans.get(0);
		Token operan1 = operans.get(1);

		byte opcode = Instruction.CMP;
		byte value0 = (byte) Integer.parseInt(getBinaryReg(operan0), 2);
		byte value1 = (byte) Integer.parseInt(getBinaryReg(operan1), 2);
		try {
			out.write((byte) opcode);
			out.write((byte) (value0));
			out.write((byte) (value1));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void div(List<Token> operans) {
		Token operan0 = operans.get(0);
		Token operan1 = operans.get(1);

		byte opcode = Instruction.DIV;
		byte value0 = (byte) Integer.parseInt(getBinaryReg(operan0), 2);
		byte value1 = (byte) Integer.parseInt(getBinaryReg(operan1), 2);
		try {
			out.write((byte) opcode);
			out.write((byte) (value0));
			out.write((byte) (value1));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void mul(List<Token> operans) {
		Token operan0 = operans.get(0);
		Token operan1 = operans.get(1);

		byte opcode = Instruction.MUL;
		byte value0 = (byte) Integer.parseInt(getBinaryReg(operan0), 2);
		byte value1 = (byte) Integer.parseInt(getBinaryReg(operan1), 2);
		try {
			out.write((byte) opcode);
			out.write((byte) (value0));
			out.write((byte) (value1));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void sub(List<Token> operans) {
		Token operan0 = operans.get(0);
		Token operan1 = operans.get(1);

		byte opcode = Instruction.SUB;
		byte value0 = (byte) Integer.parseInt(getBinaryReg(operan0), 2);
		byte value1 = (byte) Integer.parseInt(getBinaryReg(operan1), 2);
		try {
			out.write((byte) opcode);
			out.write((byte) (value0));
			out.write((byte) (value1));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void add(List<Token> operans) {
		Token operan0 = operans.get(0);
		Token operan1 = operans.get(1);

		byte opcode = Instruction.ADD;
		byte value0 = (byte) Integer.parseInt(getBinaryReg(operan0), 2);
		byte value1 = (byte) Integer.parseInt(getBinaryReg(operan1), 2);
		try {
			out.write((byte) opcode);
			out.write((byte) (value0));
			out.write((byte) (value1));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void exit(List<Token> operans) {
		byte opcode = Instruction.EXIT_PROC;
		short value = 0;

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void store(List<Token> operans) {
		byte opcode = 0;
		short value = 0;
		Token operan0 = operans.get(0);
		Token operan1 = operans.get(1);
		if (operan1.getImage().equalsIgnoreCase("R0")) {
			opcode = Instruction.STORE_R0;
		} else if (operan1.getImage().equalsIgnoreCase("R1")) {
			opcode = Instruction.STORE_R1;
		} else if (operan1.getImage().equalsIgnoreCase("R2")) {
			opcode = Instruction.STORE_R2;
		} else if (operan1.getImage().equalsIgnoreCase("R3")) {
			opcode = Instruction.STORE_R3;
		}
		value = getBinaryValue(operan0);

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void load(List<Token> operans) {
		byte opcode = 0;
		short value = 0;
		Token operan0 = operans.get(0);
		Token operan1 = operans.get(1);
		if (operan0.getImage().equalsIgnoreCase("R0")) {
			opcode = Instruction.LOAD_R0;
		} else if (operan0.getImage().equalsIgnoreCase("R1")) {
			opcode = Instruction.LOAD_R1;
		} else if (operan0.getImage().equalsIgnoreCase("R2")) {
			opcode = Instruction.LOAD_R2;
		} else if (operan0.getImage().equalsIgnoreCase("R3")) {
			opcode = Instruction.LOAD_R3;
		}
		value = getBinaryValue(operan1);

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void copy(List<Token> operans) {
		byte opcode = 0;
		short value = 0;

		Token operan0 = operans.get(0);
		Token operan1 = operans.get(1);
		if (operan1.getClazz() == Clazz.Literal_Char || operan1.getClazz() == Clazz.Literal_Decimal || operan1.getClazz() == Clazz.Literal_Hexa) {
			// Immediate COPY
			if (operan0.getImage().equalsIgnoreCase("R0")) {
				opcode = Instruction.COPY_IMED_R0;
			} else if (operan0.getImage().equalsIgnoreCase("R1")) {
				opcode = Instruction.COPY_IMED_R1;
			} else if (operan0.getImage().equalsIgnoreCase("R2")) {
				opcode = Instruction.COPY_IMED_R2;
			} else if (operan0.getImage().equalsIgnoreCase("R3")) {
				opcode = Instruction.COPY_IMED_R3;
			}
			value = getBinaryValue(operan1);

		} else {
			String sBitReg0 = getBinaryReg(operan0);
			String sBitReg1 = getBinaryReg(operan1);
			String sOpcode = "00" + sBitReg0 + sBitReg1;
			opcode = (byte) Integer.parseInt(sOpcode, 2);
		}

		try {
			out.write((byte) opcode);
			out.write((byte) (value >> 8));
			out.write((byte) (value % 256));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private String getBinaryReg(Token operan0) {
		if (operan0.getImage().equalsIgnoreCase("R0")) {
			return "000";
		}
		if (operan0.getImage().equalsIgnoreCase("R1")) {
			return "001";
		}
		if (operan0.getImage().equalsIgnoreCase("R2")) {
			return "010";
		}
		if (operan0.getImage().equalsIgnoreCase("R3")) {
			return "011";
		}
		return null;
	}

	private short getBinaryValue(Token operan1) {
		if (operan1.getClazz() == Clazz.Literal_Char) {
			return (short) operan1.getImage().charAt(0);
		} else if (operan1.getClazz() == Clazz.Literal_Decimal) {
			return (short) Integer.parseInt(operan1.getImage());
		} else if (operan1.getClazz() == Clazz.Literal_Hexa) {
			return (short) Integer.parseInt(operan1.getImage(), 16);
		} else if (operan1.getClazz() == Clazz.Identifier) {
			return (short) TabelaSimbolos.getMemoryPositionId(operan1);
		}
		return 0;
	}

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
			Token operan = (Token) gerar(no.getFilho(0));
			List<Token> args2 = (List<Token>) gerar(no.getFilho(1));
			args2.add(operan);
			return args2;
		}
		return new ArrayList<Token>();
	}

	// <Args2> ::= ',' <Operan> |
	private Object args2(Node no) {
		if (!no.getFilhos().isEmpty()) {
			Token operan = (Token) gerar(no.getFilho(1));
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

	// <DATA> ::= '.DATA' <nl> <Decls>
	private Object data(Node no) {
		gerar(no.getFilho(2));
		try {
			out.writeByte('$');
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	// <Decls> ::= <Decl> <nl> <Decls> |
	private Object decls(Node no) {
		if (!no.getFilhos().isEmpty()) {
			gerar(no.getFilho(0));
			gerar(no.getFilho(2));
		}
		return null;
	}

	// <Decl> ::= Id <Tipo> <Valor>
	private Object decl(Node no) {
		Token id = no.getFilho(0).getToken();
		String tipo = (String) gerar(no.getFilho(1));
		Token valor = (Token) gerar(no.getFilho(2));

		TabelaSimbolos.setMemoryPositionId(id, memoryPosition);
		if ("DB".equalsIgnoreCase(tipo)) {
			if (valor.getClazz() == Clazz.Literal_Decimal) {
				try {
					out.writeByte(Integer.parseInt(valor.getImage()));
					memoryPosition++;
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (valor.getClazz() == Clazz.Literal_Hexa) {
				try {
					out.writeByte(Integer.parseInt(valor.getImage(), 16));
					memoryPosition++;
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (valor.getClazz() == Clazz.Literal_Char) {
				try {
					out.writeByte(valor.getImage().charAt(0));
					memoryPosition++;
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (valor.getClazz() == Clazz.Literal_String) {
				try {
					//out.writeBytes(valor.getImage());
					//memoryPosition = (short) (memoryPosition + valor.getImage().length());
					int i=0;
					for(int j=0; j<valor.getImage().length(); j++) {
						char car = valor.getImage().charAt(j);
						if(car == '\\') {
							j++;
							car = valor.getImage().charAt(j);
							if(car == '0') {
								out.writeByte(0);
								memoryPosition++;
							} else if(car == 'n') {
								out.writeByte(10);
								memoryPosition++;
								//out.writeByte(13);
								//memoryPosition++;
							}
						} else {
							out.writeByte(car);
							memoryPosition++;
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else if ("DW".equalsIgnoreCase(tipo)) {
			if (valor.getClazz() == Clazz.Literal_Decimal) {
				try {
					out.writeShort(Integer.parseInt(valor.getImage()));
					memoryPosition += 2;
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (valor.getClazz() == Clazz.Literal_Hexa) {
				try {
					out.writeShort(Integer.parseInt(valor.getImage(), 16));
					memoryPosition += 2;
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (valor.getClazz() == Clazz.Literal_Char) {
				try {
					out.writeShort(valor.getImage().charAt(0));
					memoryPosition += 2;
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (valor.getClazz() == Clazz.Literal_String) {
				try {
					for (int i = 0; i < valor.getImage().length(); i++) {
						out.writeShort(valor.getImage().charAt(i));
					}
					memoryPosition = (short) (memoryPosition + valor.getImage().length() * 2);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		return null;
	}

	// <Tipo> ::= 'DB' | 'DW'
	private Object tipo(Node no) {
		return no.getFilho(0).getToken().getImage();
	}

	// <Valor> ::= StringLiteral | DecimalLiteral | HexaLiteral | CharLiteral
	private Object valor(Node no) {
		return no.getFilho(0).getToken();
	}

}
