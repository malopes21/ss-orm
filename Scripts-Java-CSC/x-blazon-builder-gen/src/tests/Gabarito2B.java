package tests;
import java.util.Scanner;

public class Gabarito2B {

	public static void main(String[] args) {

		Scanner ler = new Scanner(System.in);
		double salario = ler.nextDouble();
		double imposto = 0.00;
		
		if(salario >= 2000.01 && salario <= 3000.00){
			 
			imposto = (salario - 2000.00) * 0.08;
			System.out.printf("R$ %.2f", imposto);
		}
		else if(salario >= 3000.01 && salario <= 4500.00){
			imposto = (1000.00) * 0.08 
					+ (salario - 3000.00) * 0.18;
		}
		else if(salario >= 4500.01){
			imposto = (1000.00) * 0.08 
					+ (1500.00) * 0.18 
					+ (salario - 4500.00) * 0.28;
		}
		
		
		if(imposto == 0.00){
			System.out.printf("Isento");
		}
		else{
			System.out.printf("R$ %.2f", imposto);
		}
		
	}
}
		