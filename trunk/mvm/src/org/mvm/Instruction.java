package org.mvm;
import java.lang.reflect.Field;
import java.lang.reflect.Method;


public class Instruction {
	


	
	/* todas instruções têm 3 bytes e 1 byte de OPCODE */
	
	/* instruções COPY's para os 8 registradores R0 - R7 irão iniciar com 0b00_ */
	
	public static byte COPY_IMED = 0b00_000_000;
	
	public static byte COPY_R0_R1 = 0b00_000_001;
	public static byte COPY_R0_R2 = 0b00_000_010;
	public static byte COPY_R0_R3 = 0b00_000_011;
	
	public static byte COPY_R1_R0 = 0b00_001_000;
	public static byte COPY_R1_R2 = 0b00_001_010;
	public static byte COPY_R1_R3 = 0b00_001_011;
	
	public static byte COPY_R2_R0 = 0b00_010_000;
	public static byte COPY_R2_R1 = 0b00_010_001;
	public static byte COPY_R2_R3 = 0b00_010_011;
	
	public static byte COPY_R3_R0 = 0b00_011_000;
	public static byte COPY_R3_R1 = 0b00_011_001;
	public static byte COPY_R3_R2 = 0b00_011_010;
	
	/* instruções LOAD, STORE, Jcc irão iniciar com 0b01_ */
	
	public static byte LOAD_R0 = 0b01_000_000;
	public static byte LOAD_R1 = 0b01_000_001;
	public static byte LOAD_R2 = 0b01_000_010;
	public static byte LOAD_R3 = 0b01_000_011;
	
	public static byte STORE_R0 = 0b01_001_000;
	public static byte STORE_R1 = 0b01_001_001;
	public static byte STORE_R2 = 0b01_001_010;
	public static byte STORE_R3 = 0b01_001_011;
	
	public static byte JMP = 0b01_010_000;
	public static byte JG  = 0b01_010_001;
	public static byte JGE = 0b01_010_010;
	public static byte JL  = 0b01_010_011;
	public static byte JLE = 0b01_010_100;
	public static byte JE  = 0b01_010_101;
	public static byte JNE = 0b01_010_110;
	
	public static byte CMP = 0b01_010_111;
	
	/* instruções aritméticas básicas irão iniciar com 0b01_011_ */
	
	public static byte ADD = 0b01_011_000;
	public static byte SUB = 0b01_011_001;
	public static byte MUL = 0b01_011_010;
	public static byte DIV = 0b01_011_011;
	
	/* stack instructions begin at 0b01_100_ */
	
	public static byte PUSH_R0 = 0b01_100_000;
	public static byte PUSH_R1 = 0b01_100_001;
	public static byte PUSH_R2 = 0b01_100_010;
	public static byte PUSH_R3 = 0b01_100_011;
	
	public static byte POP_R0 = 0b01_101_000;
	public static byte POP_R1 = 0b01_101_001;
	public static byte POP_R2 = 0b01_101_010;
	public static byte POP_R3 = 0b01_101_011;
	
	public static byte EXIT = -0b01_111_111;		//pára o processamento
	
	/* PUSH e POP		*/
	
	public static void main(String args[]) {  
        try {  
        	Instruction instructions = new Instruction();
        	
        	/*int a = instructions.COPY_R0_R1;
        	System.out.println(a);*/
        	
            Class c = instructions.getClass(); 
            Method m[] = c.getDeclaredMethods();  
            Field fields[] = c.getDeclaredFields();
            
           /* for (int i = 0; i < m.length; i++) {  
            	System.out.println( m[i].toString() );  
            }*/
            
            for(Field f : fields) {
            	System.out.println(f.getName() + " -> " + f.get(instructions));
            }
        }  
        catch (Throwable e) {  
            System.err.println(e);  
        }  
    }  
	

}
