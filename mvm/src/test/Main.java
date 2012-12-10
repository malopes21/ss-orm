package test;

public class Main {

	public static void main(String[] args) {

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
	}

}
