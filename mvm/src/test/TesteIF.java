package test;

public class TesteIF {
	
	public static void main(String[] args) {
		Values mes = Values.NOV;
		
		if(mes == Values.JAN) {
			System.out.println(mes);
		} else if(mes == Values.FEV) {
			System.out.println(mes);
		} else if(mes == Values.MAR) {
			System.out.println(mes);
		} else if(mes == Values.ABR) {
			System.out.println(mes);
		} else if(mes == Values.MAI) {
			System.out.println(mes);
		} else if(mes == Values.JUN) {
			System.out.println(mes);
		} else if(mes == Values.JUL) {
			System.out.println(mes);
		} else if(mes == Values.AGO) {
			System.out.println(mes);
		} else if(mes == Values.SET) {
			System.out.println(mes);
		} else if(mes == Values.OUT) {
			System.out.println(mes);
		} else if(mes == Values.NOV) {
			System.out.println(mes);
		} else if(mes == Values.DEZ) {
			System.out.println(mes);
		} 
		
		switch(mes) {
			case JAN: System.out.println(mes); break;
			case FEV: System.out.println(mes); break;
			case MAR: System.out.println(mes); break;
			case ABR: System.out.println(mes); break;
			case MAI: System.out.println(mes); break;
			case JUN: System.out.println(mes); break;
			case JUL: System.out.println(mes); break;
			case AGO: System.out.println(mes); break;
			case SET: System.out.println(mes); break;
			case OUT: System.out.println(mes); break;
			case NOV: System.out.println(mes); break;
			case DEZ: System.out.println(mes); break;
			
		}
	}

}

enum Values {
	JAN,
	FEV,
	MAR,
	ABR,
	MAI,
	JUN,
	JUL,
	AGO,
	SET,
	OUT,
	NOV,
	DEZ
}