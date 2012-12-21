package org.mvm;

public class Processor {

	private short pid;

	public short getPid() {
		return pid;
	}

	public Processor(short pId) {
		this.pid = pId;
	}

	public short[] R = new short[8];

	public short IP;
	public short BP;
	public short SP;

	public short CS;
	public short DS;
	public short SS;

	public short TEMP;
	
	public byte IR_OPCODE = -1;
	public byte IR_ARG0;
	public byte IR_ARG1;
	
	public byte FLAG_Z;	//Zero
	public byte FLAG_S;	//Signal
	//public byte FLAG_C;	//Carry
	//public byte FLAG_O; //Overflow
	//public byte FLAG_P; //Parity
	//public byte FLAG_A; //Auxiliary Carry

	public void fetch() {
		IR_OPCODE = Memory.ram[CS + IP];
		IR_ARG0 = Memory.ram[CS + IP + 1];
		IR_ARG1 = Memory.ram[CS + IP + 2];
	}

	private void setFlags(short value) {
		FLAG_Z = (byte) (value == 0 ? 1 : 0);
		FLAG_S = (byte) (value  < 0 ? 1 : 0);
	}
	
	public void decode_exec() {

		if (IR_OPCODE == Instruction.COPY_IMED_R0) {
			copy_imed_R0();

		} else if (IR_OPCODE == Instruction.COPY_IMED_R1) {
			copy_imed_R1();

		} else if (IR_OPCODE == Instruction.COPY_IMED_R2) {
			copy_imed_R2();

		} else if (IR_OPCODE == Instruction.COPY_IMED_R3) {
			copy_imed_R3();

		} else if (IR_OPCODE == Instruction.COPY_R0_R1) {
			copy_R0_R1();

		} else if (IR_OPCODE == Instruction.COPY_R0_R2) {
			copy_R0_R2();

		} else if (IR_OPCODE == Instruction.COPY_R0_R3) {
			copy_R0_R3();

		} else if (IR_OPCODE == Instruction.COPY_R1_R0) {
			copy_R1_R0();

		} else if (IR_OPCODE == Instruction.COPY_R1_R2) {
			copy_R1_R2();

		} else if (IR_OPCODE == Instruction.COPY_R1_R3) {
			copy_R1_R3();

		} else if (IR_OPCODE == Instruction.COPY_R2_R0) {
			copy_R2_R0();

		} else if (IR_OPCODE == Instruction.COPY_R2_R1) {
			copy_R2_R1();

		} else if (IR_OPCODE == Instruction.COPY_R2_R3) {
			copy_R2_R3();

		} else if (IR_OPCODE == Instruction.COPY_R3_R0) {
			copy_R3_R0();
			
		} else if (IR_OPCODE == Instruction.COPY_R3_R1) {
			copy_R3_R1();
			
		} else if (IR_OPCODE == Instruction.COPY_R3_R2) {
			copy_R3_R2();

		} else if (IR_OPCODE == Instruction.LOAD_R0) {
			load_R0();

		} else if (IR_OPCODE == Instruction.LOAD_R1) {
			load_R1();

		} else if (IR_OPCODE == Instruction.LOAD_R2) {
			load_R2();

		} else if (IR_OPCODE == Instruction.LOAD_R3) {
			load_R3();

		} else if (IR_OPCODE == Instruction.STORE_R0) {
			store_R0();

		} else if (IR_OPCODE == Instruction.STORE_R1) {
			store_R1();

		} else if (IR_OPCODE == Instruction.STORE_R2) {
			store_R2();

		} else if (IR_OPCODE == Instruction.STORE_R3) {
			store_R3();

		} else if (IR_OPCODE == Instruction.JMP) {
			jmp();

		} else if (IR_OPCODE == Instruction.JG) {
			jg();

		} else if (IR_OPCODE == Instruction.JGE) {
			jge();

		} else if (IR_OPCODE == Instruction.JL) {
			jl();

		} else if (IR_OPCODE == Instruction.JLE) {
			jle();

		} else if (IR_OPCODE == Instruction.JE) {
			je();

		} else if (IR_OPCODE == Instruction.JNE) {
			jne();

		} else if (IR_OPCODE == Instruction.CMP) {
			cmp();

		} else if (IR_OPCODE == Instruction.ADD) {
			add();

		} else if (IR_OPCODE == Instruction.SUB) {
			sub();

		} else if (IR_OPCODE == Instruction.MUL) {
			mul();

		} else if (IR_OPCODE == Instruction.DIV) {
			div();

		} else if (IR_OPCODE == Instruction.PUSH_R0) {
			push_R0();

		} else if (IR_OPCODE == Instruction.PUSH_R1) {
			push_R1();
			
		} else if (IR_OPCODE == Instruction.PUSH_R2) {
			push_R2();

		} else if (IR_OPCODE == Instruction.PUSH_R3) {
			push_R3();

		} else if (IR_OPCODE == Instruction.POP_R0) {
			pop_R0();

		} else if (IR_OPCODE == Instruction.POP_R1) {
			pop_R1();

		} else if (IR_OPCODE == Instruction.POP_R2) {
			pop_R2();

		} else if (IR_OPCODE == Instruction.POP_R3) {
			pop_R3();

		} else if (IR_OPCODE == Instruction.EXIT_PROC) {
			return; // useless

		} else {
			throw new RuntimeException("Instrução inválida!");
		}
	}

	private void copy_R3_R2() {
		R[3] = R[2];		
	}

	private void copy_R3_R1() {
		R[3] = R[1];		
	}

	private void copy_R3_R0() {
		R[3] = R[0];			
	}

	private void copy_R2_R3() {
		R[2] = R[3];		
	}
	
	private void copy_R2_R1() {
		R[2] = R[1];
	}

	private void copy_R2_R0() {
		R[2] = R[0];
	}

	private void copy_R1_R3() {
		R[1] = R[3];
	}

	private void copy_R1_R2() {
		R[1] = R[2];		
	}

	private void copy_R1_R0() {
		R[1] = R[0];		
	}

	private void copy_R0_R3() {
		R[0] = R[3];		
	}

	private void copy_R0_R2() {
		R[0] = R[2];
	}

	private void copy_R0_R1() {
		R[0] = R[1];
	}

	private void copy_imed_R3() {
		R[3] = (short) (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF));
	}

	private void copy_imed_R2() {
		R[2] = (short) (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF));
	}

	private void copy_imed_R1() {
		R[1] = (short) (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF));
	}

	private void copy_imed_R0() {
		//return ((b1 << 8 ) & 0xFF00) | (b2 & 0x00FF);  http://www.guj.com.br/java/252035-resolvido-union-ou-semelhante-em-java
		R[0] = (short) (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF));
	}

	private void store_R0() {
		//(((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))
		//short pos = (short) (DS + ((IR_ARG0 << 8) + IR_ARG1));  //TODO:BUG HERE!!!!!
		short pos = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		Memory.ram[pos++] = (byte) (R[0] >> 8);
		Memory.ram[pos] = (byte) (R[0] % 256);
	}

	private void store_R1() {
		//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
		short pos = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		Memory.ram[pos++] = (byte) (R[1] >> 8);
		Memory.ram[pos] = (byte) (R[1] % 256);
	}

	private void store_R2() {
		//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
		short pos = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		Memory.ram[pos++] = (byte) (R[2] >> 8);
		Memory.ram[pos] = (byte) (R[2] % 256);		
	}

	private void store_R3() {
		//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
		short pos = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		Memory.ram[pos++] = (byte) (R[3] >> 8);
		Memory.ram[pos] = (byte) (R[3] % 256);		
	}

	private void load_R0() {
		//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
		short pos = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF)));
		R[0] = (short) (((Memory.ram[pos++] << 8 ) & 0xFF00) | (Memory.ram[pos] & 0x00FF));
		//R[0] = (short) ((Memory.ram[pos++] << 8) + Memory.ram[pos]);
	}
	
	private void load_R1() {
		//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
		short pos = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		R[1] = (short) (((Memory.ram[pos++] << 8 ) & 0xFF00) | (Memory.ram[pos] & 0x00FF));  
		//R[1] = (short)((Memory.ram[pos++] << 8) + Memory.ram[pos]);
	}

	private void load_R2() {
		//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
		short pos = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		R[2] = (short) (((Memory.ram[pos++] << 8 ) & 0xFF00) | (Memory.ram[pos] & 0x00FF));
		//R[2] = (short) ((Memory.ram[pos++] << 8) + Memory.ram[pos]);		
	}

	private void load_R3() {
		//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
		short pos = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		R[3] = (short) (((Memory.ram[pos++] << 8 ) & 0xFF00) | (Memory.ram[pos] & 0x00FF));
		//R[3] = (short) ((Memory.ram[pos++] << 8) + Memory.ram[pos]);
	}

	private void jmp() {
		//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
		IP = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF)));
	}
	
	private void jg() {
		if(FLAG_S == 0 && FLAG_Z != 0) {
			//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
			IP = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF)));
		}
	}
	
	private void jge() {
		if(FLAG_S == 0) {
			//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
			IP = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		}
	}

	private void jl() {
		if(FLAG_S == 1 && FLAG_Z != 0) {
			//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
			IP = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		}		
	}
	
	private void jle() {
		if(FLAG_S == 1) {
			//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
			IP = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		}		
	}
	
	private void je() {
		if(FLAG_Z == 1) {
			//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
			IP = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		}		
	}
	
	private void jne() {
		if(FLAG_Z == 0) {
			//short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
			IP = (short) (DS + (((IR_ARG0 << 8 ) & 0xFF00) | (IR_ARG1 & 0x00FF))); 
		}		
	}

	private void cmp() {
		TEMP = (short) (R[IR_ARG0] - R[IR_ARG1]);
		setFlags(TEMP);
	}
	
	private void add() {
		R[IR_ARG0] = (short) (R[IR_ARG0] + R[IR_ARG1]);
		setFlags(R[IR_ARG0]);
	}

	private void sub() {
		R[IR_ARG0] = (short) (R[IR_ARG0] - R[IR_ARG1]);
		setFlags(R[IR_ARG0]);
	}

	//TODO: correct that offset problem
	private void mul() {
		R[IR_ARG0] = (short) (R[IR_ARG0] * R[IR_ARG1]);
		setFlags(R[IR_ARG0]);
	}
	
	//TODO: correct that offset problem
	private void div() {
		R[IR_ARG0] = (short) (R[IR_ARG0] / R[IR_ARG1]);
		setFlags(R[IR_ARG0]);
	}

	private void push_R0() {
		short pos = (short) (SS + SP);
		Memory.ram[pos++] = (byte) (R[0] >> 8);
		Memory.ram[pos] = (byte) (R[0] % 256);
		SP -= 2;
	}
	
	private void push_R1() {
		short pos = (short) (SS + SP);
		Memory.ram[pos++] = (byte) (R[1] >> 8);
		Memory.ram[pos] = (byte) (R[1] % 256);
		SP -= 2;
	}
	
	private void push_R2() {
		short pos = (short) (SS + SP);
		Memory.ram[pos++] = (byte) (R[2] >> 8);
		Memory.ram[pos] = (byte) (R[2] % 256);
		SP -= 2;
	}
	
	private void push_R3() {
		short pos = (short) (SS + SP);
		Memory.ram[pos++] = (byte) (R[3] >> 8);
		Memory.ram[pos] = (byte) (R[3] % 256);
		SP -= 2;
	}
	
	private void pop_R0() {
		short pos = (short) (SS + SP);
		R[0] = (short) (((Memory.ram[pos++] << 8 ) & 0xFF00) | (Memory.ram[pos] & 0x00FF));
		//R[0] = (short) ((Memory.ram[pos++] << 8) + Memory.ram[pos]);
		SP += 2;
	}
	
	private void pop_R1() {
		short pos = (short) (SS + SP);
		R[1] = (short) (((Memory.ram[pos++] << 8 ) & 0xFF00) | (Memory.ram[pos] & 0x00FF));
		//R[1] = (short) ((Memory.ram[pos++] << 8) + Memory.ram[pos]);
		SP += 2;
	}
	
	private void pop_R2() {
		short pos = (short) (SS + SP);
		R[2] = (short) (((Memory.ram[pos++] << 8 ) & 0xFF00) | (Memory.ram[pos] & 0x00FF));
		//R[2] = (short) ((Memory.ram[pos++] << 8) + Memory.ram[pos]);
		SP += 2;
	}
	
	private void pop_R3() {
		short pos = (short) (SS + SP);
		R[3] = (short) (((Memory.ram[pos++] << 8 ) & 0xFF00) | (Memory.ram[pos] & 0x00FF));
		//R[3] = (short) ((Memory.ram[pos++] << 8) + Memory.ram[pos]);
		SP += 2;
	}
	
}