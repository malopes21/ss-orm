package org.mvm;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;

public class Instruction {
	
	/* todas instru��es t�m 3 bytes sendo 1 byte de OPCODE */

	/* instru��es COPY's para os 8 registradores R0 - R7 ir�o iniciar com 0b00_ */

	public static final byte COPY_IMED_R0 = -0b00_000_000;
	public static final byte COPY_IMED_R1 = -0b00_000_001;
	public static final byte COPY_IMED_R2 = -0b00_000_010;
	public static final byte COPY_IMED_R3 = -0b00_000_011;

	public static final byte COPY_R0_R1 = 0b00_000_001;
	public static final byte COPY_R0_R2 = 0b00_000_010;
	public static final byte COPY_R0_R3 = 0b00_000_011;

	public static final byte COPY_R1_R0 = 0b00_001_000;
	public static final byte COPY_R1_R2 = 0b00_001_010;
	public static final byte COPY_R1_R3 = 0b00_001_011;

	public static final byte COPY_R2_R0 = 0b00_010_000;
	public static final byte COPY_R2_R1 = 0b00_010_001;
	public static final byte COPY_R2_R3 = 0b00_010_011;

	public static final byte COPY_R3_R0 = 0b00_011_000;
	public static final byte COPY_R3_R1 = 0b00_011_001;
	public static final byte COPY_R3_R2 = 0b00_011_010;

	/* instru��es LOAD, STORE, Jcc ir�o iniciar com 0b01_ */

	public static final byte LOAD_R0 = 0b01_000_000;
	public static final byte LOAD_R1 = 0b01_000_001;
	public static final byte LOAD_R2 = 0b01_000_010;
	public static final byte LOAD_R3 = 0b01_000_011;

	public static final byte STORE_R0 = 0b01_001_000;
	public static final byte STORE_R1 = 0b01_001_001;
	public static final byte STORE_R2 = 0b01_001_010;
	public static final byte STORE_R3 = 0b01_001_011;

	public static final byte JMP = 0b01_010_000;
	public static final byte JG =  0b01_010_001;
	public static final byte JGE = 0b01_010_010;
	public static final byte JL =  0b01_010_011;
	public static final byte JLE = 0b01_010_100;
	public static final byte JE =  0b01_010_101;
	public static final byte JNE = 0b01_010_110;

	public static final byte CMP = 0b01_010_111;

	/* instru��es aritm�ticas b�sicas ir�o iniciar com 0b01_011_ */

	public static final byte ADD = 0b01_011_000;
	public static final byte SUB = 0b01_011_001;
	public static final byte MUL = 0b01_011_010;
	public static final byte DIV = 0b01_011_011;

	/* stack instructions begin at 0b01_100_ */

	public static final byte PUSH_R0 = 0b01_100_000;
	public static final byte PUSH_R1 = 0b01_100_001;
	public static final byte PUSH_R2 = 0b01_100_010;
	public static final byte PUSH_R3 = 0b01_100_011;

	public static final byte POP_R0 = 0b01_101_000;
	public static final byte POP_R1 = 0b01_101_001;
	public static final byte POP_R2 = 0b01_101_010;
	public static final byte POP_R3 = 0b01_101_011;
	
	public static final byte STDOUT = 0b01_111_000;
	public static final byte STDIN = 0b01_111_001;

	public static final byte EXIT_PROC = -0b01_111_111; // stop processing
	
	public static HashMap<Integer, String> values = new HashMap<Integer, String>();



//	public static void main(String args[]) {
/*	static {	
		try {
			Instruction instruction = new Instruction();

			Class c = instruction.getClass();
			Method m[] = c.getDeclaredMethods();
			Field fields[] = c.getDeclaredFields();

			for (Field f : fields) {
				if(!f.getName().equals("values")) {
					try {
						//System.out.println(f.getName() + " -> " + f.get(instruction)); //decimal
						System.out.printf("%-12s ->  %02x \n", f.getName(), f.get(instruction)); //hexadecimal
						values.put(Integer.parseInt(f.get(instruction).toString()), f.getName() );					
					}catch (Exception e) {
					}	
				}
			}
			//System.out.println("");
		} catch (Throwable e) {
			System.err.println(e);
		}
	}*/


	public static void createVerifyMapValues() {
		try {
			Instruction instruction = new Instruction();

			Class c = instruction.getClass();
			Method m[] = c.getDeclaredMethods();
			Field fields[] = c.getDeclaredFields();

			for (Field f : fields) {
				if(!f.getName().equals("values")) {
					try {
						//System.out.println(f.getName() + " -> " + f.get(instruction)); //decimal
						//System.out.printf("%-12s ->  %02x \n", f.getName(), f.get(instruction)); //hexadecimal
						if(values.get( Integer.parseInt(f.get(instruction).toString()) ) != null ) {
							throw new RuntimeException("instruction number conflict!");
						}
						values.put(Integer.parseInt(f.get(instruction).toString()), f.getName() );					
					}catch (Exception e) {
						e.printStackTrace();
					}	
				}
			}
		} catch (Throwable e) {
			System.err.println(e);
		}
	}

}