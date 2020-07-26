package uri;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		Scanner ler = new Scanner(System.in);
		double salario = ler.nextDouble();
		double imposto = 0.00;
			
		if (salario > 2000 && salario <= 3000.0) {
			imposto = (salario - 2000.0) * 0.08;
		} else if (salario <= 4500.0) {
			imposto = 1000.0 * 0.08 + (salario - 3000.0) * 0.18;
		} else {
			imposto = 1000.0 * 0.08 + 1500.0 * 0.18 + (salario - 4500.0) * 0.28;
		}
			
		if (salario <= 2000.0) {
			 System.out.printf("Isento\n");
		} else {
			System.out.printf("R$ %.2f\n", imposto);
		}
	}
}
		