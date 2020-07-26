package teste;

import java.util.Scanner;

public class Eleitores {

	public static void main(String[] args) {
		
		Scanner Leia = new Scanner(System.in);
		
		double Leridadepessoa = Leia.nextDouble();
		
		if(Leridadepessoa < 16) {
			System.out.println("Não eleitor");
		} else if(Leridadepessoa >= 18 && Leridadepessoa <= 65) {
			System.out.println("Eleitor obrigatório");
		} else if((Leridadepessoa >= 16 && Leridadepessoa <= 18) || Leridadepessoa > 65) {
			System.out.println("Eleitor facultativo");
		}
	}
}
