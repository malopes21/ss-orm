package uri;
import java.util.Scanner;

public class MainOutro {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int A = sc.nextInt();
		int B = sc.nextInt();
		int C = sc.nextInt();
		
		if(A <= B && B <= C) {
			System.out.printf("%d\n%d\n%d\n", A, B, C);
		} else if(B <= A && A <= C) {
			System.out.printf("%d\n%d\n%d\n", B, A, C);
		} else if(B <= C && C <= A) {
			System.out.printf("%d\n%d\n%d\n", B, C, A);
		} else if(C <= B && B <= A) {
			System.out.printf("%d\n%d\n%d\n", C, B, A);
		} else if(A <= C && C <= B) {
			System.out.printf("%d\n%d\n%d\n", A, C, B);
		} else if(C <= A && A <= B) {
			System.out.printf("%d\n%d\n%d\n", C, A, B);
		} 

		System.out.printf("\n%d\n%d\n%d\n", A, B, C);
	}
}