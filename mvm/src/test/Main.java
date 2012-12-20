package test;

import org.mvm.Memory;

public class Main {

	public static void main(String[] args) {

		for (int i = 1; i <= 30; i++) {
			System.out.printf("%02x\n", i);
		}

		long inicio = System.nanoTime();

		int pos = 3;

		System.out.println("antes: " + pos);

		pos = pos << 8;

		System.out.println("depois: " + pos);

		long fim = System.nanoTime();

		System.out.println("Tempo: " + (fim - inicio));

		// short: 280 - 290 nanosegundos
		// int: 260 - 270 nanosegundos

		System.out.println((int) 'โ'); // outputs 3650, a thai symbol
		char p = 3650;
		System.out.println(p); // outputs the above symbol
		
		System.out.printf("[DS:%04x]: %02xh \t%c\n", 1, ((byte) -1), ((byte) -1));
	}

}
