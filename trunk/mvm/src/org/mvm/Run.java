package org.mvm;

public class Run {

	public static void main(String[] args) {

		Processor p0 = new Processor((short) 0);
		byte[] program = createTestProgram();
		loadProgram(p0, program);
		execProgram(p0);
		dumpCODE(p0, 0, 40);
		dumpDATA(p0, 0, 20);
		dumpSTACK(p0, 0, 20);
		dumpRegs(p0);
	}

	private static void dumpRegs(Processor p) {
		System.out.println("\nDUMP REGS: processor p" + p.getPid());
		System.out.printf("R0: %04xh\n", p.R[0]);
		System.out.printf("R1: %04xh\n", p.R[1]);
		System.out.printf("R2: %04xh\n", p.R[2]);
		System.out.printf("R3: %04xh\n", p.R[3]);
		System.out.printf("R4: %04xh\n", p.R[4]);
		System.out.printf("R5: %04xh\n", p.R[5]);
		System.out.printf("R6: %04xh\n", p.R[6]);
		System.out.printf("R7: %04xh\n", p.R[7]);
		
		System.out.printf("\nCS: %04xh\n", p.CS);
		System.out.printf("DS: %04xh\n", p.DS);
		System.out.printf("SS: %04xh\n", p.SS);
		
		System.out.printf("\nIP: %04xh\n", p.IP);
		
		System.out.printf("\nIR_OPCODE: %01xh \t(%s)\n", p.IR_OPCODE, Instruction.values.get(new Integer(p.IR_OPCODE)));
		System.out.printf("IR_ARG0: %01xh\n", p.IR_ARG0);
		System.out.printf("IR_ARG1: %01xh\n", p.IR_ARG1);
		
		System.out.printf("\nSP: %04xh\n", p.SP);
		System.out.printf("BP: %04xh\n", p.BP);
		
		System.out.printf("\nFLAG_Z: %01x\n", p.FLAG_Z);
		System.out.printf("FLAG_S: %01x\n", p.FLAG_S);
	}

	private static byte[] createTestProgram() {
		int position = 0;
		byte[] program = new byte[256];
		program[position++] = 'M';
		program[position++] = 'V';
		program[position++] = 'M';
		program[position++] = '0';
		// CS
		program[position++] = 1;
		program[position++] = 0;
		// DS
		program[position++] = 2;
		program[position++] = 0;
		// SS
		program[position++] = 3;
		program[position++] = 0;

		program[position++] = Instruction.LOAD_R0;
		program[position++] = 0;
		program[position++] = 0;

		program[position++] = Instruction.LOAD_R1;
		program[position++] = 0;
		program[position++] = 2;
		
		program[position++] = Instruction.LOAD_R2;
		program[position++] = 0;
		program[position++] = 0;

		program[position++] = Instruction.LOAD_R3;
		program[position++] = 0;
		program[position++] = 2;

		program[position++] = Instruction.ADD;
		program[position++] = 0;
		program[position++] = 1;
		
		program[position++] = Instruction.STORE_R0;
		program[position++] = 0;
		program[position++] = 4;
		
		program[position++] = Instruction.SUB;
		program[position++] = 0;
		program[position++] = 1;

		program[position++] = Instruction.STORE_R1;
		program[position++] = 0;
		program[position++] = 6;
		
		program[position++] = Instruction.STORE_R2;
		program[position++] = 0;
		program[position++] = 8;
		
		program[position++] = Instruction.MUL;
		program[position++] = 3;
		program[position++] = 2;
		
		program[position++] = Instruction.STORE_R3;
		program[position++] = 0;
		program[position++] = 10;
		
		program[position++] = Instruction.SUB;
		program[position++] = 2;
		program[position++] = 0;

		/*
		program[position++] = Instruction.COPY_IMED_R0;
		program[position++] = 2;
		program[position++] = 3;

		program[position++] = Instruction.COPY_IMED_R1;
		program[position++] = 0;
		program[position++] = 98;

		program[position++] = Instruction.COPY_IMED_R2;
		program[position++] = 1;
		program[position++] = 3;

		program[position++] = Instruction.COPY_IMED_R3;
		program[position++] = 2;
		program[position++] = 6;
		*/
		
		program[position++] = Instruction.EXIT;
		program[position++] = 0;
		program[position++] = 0;

		program[position++] = '$'; // end CODE area

		program[position++] = 0;
		program[position++] = 4;

		program[position++] = 0;
		program[position++] = 5;

		program[position++] = 0;
		program[position++] = 0;

		program[position++] = 'a';
		program[position++] = 'b';
		program[position++] = 'a';
		program[position++] = 'c';
		program[position++] = 'a';
		program[position++] = 'x';
		program[position++] = 'i';

		program[position++] = '$'; // end DATA area
		return program;
	}

	private static void loadProgram(Processor p, byte[] program) {
		int position = 0;
		short freeMemoryPosition = getFreeMemoryPosition();

		position = 4; // deslocando o MVM0 (colocar código de verificação)
		p.CS = (short) ((program[position++] << 8) + program[position++] + freeMemoryPosition);
		p.DS = (short) ((program[position++] << 8) + program[position++] + freeMemoryPosition);
		p.SS = (short) ((program[position++] << 8) + program[position++] + freeMemoryPosition);

		// reading CODE area
		byte readByte = program[position++];
		short offset = 0;
		while (readByte != '$') {
			//System.out.println("CODE: " + readByte);
			Memory.ram[p.CS + offset] = readByte;
			readByte = program[position++];
			offset++;
		}

		// reading DATA area
		readByte = program[position++];
		offset = 0;
		while (readByte != '$') {
			//System.out.println("DATA: " + readByte);
			Memory.ram[p.DS + offset] = readByte;
			readByte = program[position++];
			offset++;
		}
	}

	private static short getFreeMemoryPosition() {
		return 0;
	}

	private static void execProgram(Processor p) {

		try {
			long inicio = System.nanoTime();
			p.IP = 0;
			while (p.IR_OPCODE != Instruction.EXIT) {
				p.fetch();
				p.IP += 3;
				p.decode_exec();
			}
			long fim = System.nanoTime();
			System.out.println("STOP OK! EXEC. TIME: " + (fim - inicio) + " ns");
		} catch (Exception e) {
			System.out.println("Encerrou abruptamente! " + e.getMessage());
		}

	}

	private static void dumpDATA(Processor p, int incio, int fim) {
		System.out.println("\nDUMP DATA: " + incio + "d -> " + fim + "d:");
		for (int i = incio; i <= fim; i++) {
			System.out.printf("[DS:%04x]: %02xh \t%c\n", i, Memory.ram[p.DS + i], Memory.ram[p.DS + i]);
			//System.out.println("[DS:" + i + "]: " + Memory.ram[p.DS + i] + " - " + (char) Memory.ram[p.DS + i]);
		}
	}
	
	private static void dumpSTACK(Processor p, int incio, int fim) {
		System.out.println("\nDUMP STACK: " + incio + "d -> " + fim + "d:");
		for (int i = incio; i <= fim; i++) {
			System.out.printf("[SS:%04x]: %02xh \t%c\n", i, Memory.ram[p.SS + i], Memory.ram[p.SS + i]);
			//System.out.println("[SS:" + i + "]: " + Memory.ram[p.SS + i] + " - " + (char) Memory.ram[p.SS + i]);
		}
	}
	
	private static void dumpCODE(Processor p, int incio, int fim) {
		System.out.println("\nDUMP CODE: " + incio + "d -> " + fim + "d:");
		for (int i = incio; i <= fim; i=i+3) {
			//System.out.print("[CS:" + i + "]: " + Memory.ram[p.CS + i] + " - " + Instruction.values.get(new Integer(Memory.ram[p.CS + i])));
			System.out.printf("[CS:%04x]: %02xh %s", i, Memory.ram[p.CS + i], Instruction.values.get(new Integer(Memory.ram[p.CS + i])));
			System.out.printf("\t%02x|%02xh\n", Memory.ram[p.CS + i + 1], Memory.ram[p.CS + i + 2]);
		}
	}

}