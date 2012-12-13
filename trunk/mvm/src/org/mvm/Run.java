package org.mvm;

public class Run {

	public static void main(String[] args) {

		Processor p0 = new Processor((short) 0);
		byte[] program = createTestProgram();
		loadProgram(p0, program);
		execProgram(p0);
		dumpDATA(p0, 0, 20);
		dumpRegs(p0);
	}

	private static void dumpRegs(Processor p) {
		System.out.println("\nRegs do processor " + p.getpId());
		System.out.println("R0: " + p.R[0]);
		System.out.println("R1: " + p.R[1]);
		System.out.println("R2: " + p.R[2]);
		System.out.println("R3: " + p.R[3]);
		System.out.println("R4: " + p.R[4]);
		System.out.println("R5: " + p.R[5]);
		System.out.println("R6: " + p.R[6]);
		System.out.println("R7: " + p.R[7]);

		System.out.println("CS: " + p.CS);
		System.out.println("DS: " + p.DS);
		System.out.println("SS: " + p.SS);

		System.out.println("IP: " + p.IP);
		System.out.println("IR_OPCODE: " + p.IR_OPCODE);
		System.out.println("IR_ARG0: " + p.IR_ARG0);
		System.out.println("IR_ARG1: " + p.IR_ARG1);

		System.out.println("SP: " + p.SP);
		System.out.println("BP: " + p.BP);
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
			System.out.println("CODE: " + readByte);
			Memory.ram[p.CS + offset] = readByte;
			readByte = program[position++];
			offset++;
		}

		// reading DATA area
		readByte = program[position++];
		offset = 0;
		while (readByte != '$') {
			System.out.println("DATA: " + readByte);
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
			p.IP = 0;
			while (p.IR_OPCODE != Instruction.EXIT) {
				p.fetch();
				p.IP += 3;
				p.decode_exec();
			}
			System.out.println("Encerrou normalmente!");
		} catch (Exception e) {
			System.out.println("Encerrou abruptamente: " + e.getMessage());
		}

	}

	private static void dumpDATA(Processor p, int incio, int fim) {
		System.out.println("DUMP DATA: " + incio + " -> " + fim + "\n");
		for (int i = incio; i <= fim; i++) {
			System.out.println("[DS:" + i + "]: " + Memory.ram[p.DS + i]
					+ " - " + (char) Memory.ram[p.DS + i]);
		}
	}
	
	private static void dumpSTACK(Processor p, int incio, int fim) {
		System.out.println("DUMP STACK: " + incio + " -> " + fim + "\n");
		for (int i = incio; i <= fim; i++) {
			System.out.println("[SS:" + i + "]: " + Memory.ram[p.SS + i]
					+ " - " + (char) Memory.ram[p.SS + i]);
		}
	}
	
	private static void dumpCODE(Processor p, int incio, int fim) {
		System.out.println("DUMP CODE: " + incio + " -> " + fim + "\n");
		for (int i = incio; i <= fim; i++) {
			System.out.println("[CS:" + i + "]: " + Memory.ram[p.CS + i]
					+ " - " + (char) Memory.ram[p.CS + i]);
		}
	}

}