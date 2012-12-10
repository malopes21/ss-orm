package org.mvm;

public class Processor {
	
	private short pId;
	
	public short getpId() {
		return pId;
	}

	public Processor(short pId) {
		this.pId = pId;
	}
	
	public short[] R = new short[8];
	
	//public short R0;
	//public short R1;
	//public short R2;
	//public short R3;

	public short IP;
	public short BP;
	public short SP;
	
	public short CS;
	public short DS;
	public short SS;
	
	public byte IR_OPCODE = -1;
	public byte IR_ARG0;
	public byte IR_ARG1;
	
	public void fetch() {
		IR_OPCODE = Memory.ram[CS + IP];
		IR_ARG0 = Memory.ram[CS + IP + 1];
		IR_ARG1 = Memory.ram[CS + IP + 2];
	}
	
	public void decode_exec() {
		
		if(IR_OPCODE == Instruction.EXIT) {
			
			return;  //useless
			
		} else if(IR_OPCODE == Instruction.COPY_R0_R1) {
			
		} else if(IR_OPCODE == Instruction.COPY_R0_R2) {
			
		} else if(IR_OPCODE == Instruction.COPY_R0_R3) {
			
		} else if(IR_OPCODE == Instruction.COPY_R1_R0) {
			
		} else if(IR_OPCODE == Instruction.COPY_R1_R2) {
			
		} else if(IR_OPCODE == Instruction.COPY_R1_R3) {
			
		} else if(IR_OPCODE == Instruction.COPY_R2_R0) {
			
		} else if(IR_OPCODE == Instruction.COPY_R2_R1) {
			
		} else if(IR_OPCODE == Instruction.COPY_R2_R3) {
			
		} else if(IR_OPCODE == Instruction.COPY_R3_R0) {
			
		} else if(IR_OPCODE == Instruction.COPY_R3_R1) {
			
		} else if(IR_OPCODE == Instruction.COPY_R3_R2) {
			
		} else if(IR_OPCODE == Instruction.LOAD_R0) {
			
			load_R0();
			
		} else if(IR_OPCODE == Instruction.LOAD_R1) {
			
			load_R1();
			
		} else if(IR_OPCODE == Instruction.LOAD_R2) {
			
		} else if(IR_OPCODE == Instruction.LOAD_R3) {
			
		} else if(IR_OPCODE == Instruction.STORE_R0) {
			
			store_R0();
			
		} else if(IR_OPCODE == Instruction.STORE_R1) {
			
		} else if(IR_OPCODE == Instruction.STORE_R2) {
			
		} else if(IR_OPCODE == Instruction.STORE_R3) {
			
		} else if(IR_OPCODE == Instruction.JMP) {
			
		} else if(IR_OPCODE == Instruction.JG) {
			
		} else if(IR_OPCODE == Instruction.JGE) {
			
		} else if(IR_OPCODE == Instruction.JL) {
			
		} else if(IR_OPCODE == Instruction.JLE) {
			
		} else if(IR_OPCODE == Instruction.JE) {
			
		} else if(IR_OPCODE == Instruction.JNE) {
			
		} else if(IR_OPCODE == Instruction.CMP) {
			
		} else if(IR_OPCODE == Instruction.ADD) {

			add();
			
		} else if(IR_OPCODE == Instruction.SUB) {
			
		} else if(IR_OPCODE == Instruction.MUL) {
			
		} else if(IR_OPCODE == Instruction.DIV) {
			
		} else {
			throw new RuntimeException("Instrução inválida!");
		}
	}

	private void add() {
		R[IR_ARG0] = (short) (R[IR_ARG0] + R[IR_ARG1]);
	}

	private void store_R0() {
		short pos = (short) (DS + (IR_ARG0  << 8) + IR_ARG1);
		Memory.ram[ pos++ ] = (byte) (R[0] >> 8);
		Memory.ram[ pos ] = (byte) (R[0] % 256);
	}

	private void load_R1() {
		short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
		R[1] = (short) ((Memory.ram[ pos++ ] << 8) + Memory.ram[ pos ]);  
	}

	private void load_R0() {
		short pos = (short) (DS + (IR_ARG0 << 8) + IR_ARG1);
		R[0] = (short) ((Memory.ram[ pos++ ] << 8) + Memory.ram[ pos ]);  
	}


}
