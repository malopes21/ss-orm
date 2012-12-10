package org.mvm;
public class Run {

	public static void main(String[] args) {
		
		Processor p0 = new Processor((short) 0);
		byte[] program = createTestProgram();		
		loadProgram(p0, program);
		execProgram(p0);
		dumpRam(p0, 0,20);
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

		//addInstruction(Instruction.LOAD_R0, (byte) 0, (byte) 0, program, position);
		program[position++] = Instruction.LOAD_R0;
		program[position++] = 0;
		program[position++] = 0;
		
		//addInstruction(Instruction.LOAD_R1, (byte) 0, (byte) 2, program, position);
		program[position++] = Instruction.LOAD_R1;
		program[position++] = 0;
		program[position++] = 2;
		
		//addInstruction(Instruction.ADD, (byte) 0, (byte) 1, program, position); 		//ADD_R0_R1
		program[position++] = Instruction.ADD;
		program[position++] = 0;
		program[position++] = 1;
		
		//addInstruction(Instruction.STORE_R0, (byte) 0, (byte) 4, program, position);
		program[position++] = Instruction.STORE_R0;
		program[position++] = 0;
		program[position++] = 4;
		
		//addInstruction(Instruction.EXIT, (byte) 0, (byte) 0, program, position); 		//EXIT
		program[position++] = Instruction.EXIT;
		program[position++] = 0;
		program[position++] = 0;
		
		program[position++] = '$'; //end CODE area 
		
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
		
		program[position++] = '$'; //end DATA area
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
			System.out.println("CODE: "+readByte);
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
			while(p.IR_OPCODE != Instruction.EXIT) {
				p.fetch();
				p.decode_exec();
				p.IP += 3;
			}
			System.out.println("Encerrou normalmente!");	
		} catch (Exception e) {
			System.out.println("Encerrou abruptamente: "+ e.getMessage());
		}
		
	}
	
	private static void dumpRam(Processor p, int incio, int fim) {
		System.out.println("DUMP: "+ incio + " -> " + fim + "\n");
		for(int i=incio; i <= fim; i++ ) {
			System.out.println("[DS:"+i+"]: " + Memory.ram[p.DS + i] + " - " + (char) Memory.ram[p.DS + i]);
		}
	}

}
