package test;

public class TesteIF2 {
	
	public static void main(String[] args) {
		Values mes = Values.NOV;
		int i = 0;

		long inicio = System.nanoTime();
		for(int k=0; k<1000; k++) {
			if(mes == Values.JAN) {
				i = i + 1;
			} else if(mes == Values.FEV) {
				i = i + 1;
			} else if(mes == Values.MAR) {
				i = i + 1;
			} else if(mes == Values.ABR) {
				i = i + 1;
			} else if(mes == Values.MAI) {
				i = i + 1;
			} else if(mes == Values.JUN) {
				i = i + 1;
			} else if(mes == Values.JUL) {
				i = i + 1;
			} else if(mes == Values.AGO) {
				i = i + 1;
			} else if(mes == Values.SET) {
				i = i + 1;
			} else if(mes == Values.OUT) {
				i = i + 1;
			} else if(mes == Values.NOV) {
				i = i + 1;
			} else if(mes == Values.DEZ) {
				i = i + 1;
			} 
		}
		long fim = System.nanoTime();
		System.out.println("TEMPO IF: "+(fim-inicio));
		
		inicio = System.nanoTime();
		for(int k=0; k<1000; k++) {
			switch(mes) {
				case JAN: i = i + 1; break;
				case FEV: i = i + 1; break;
				case MAR: i = i + 1; break;
				case ABR: i = i + 1; break;
				case MAI: i = i + 1; break;
				case JUN: i = i + 1; break;
				case JUL: i = i + 1; break;
				case AGO: i = i + 1; break;
				case SET: i = i + 1; break;
				case OUT: i = i + 1; break;
				case NOV: i = i + 1; break;
				case DEZ: i = i + 1; break;
				
			}
		}
		fim = System.nanoTime();
		System.out.println("TEMPO SWITCH: "+(fim-inicio));
	}

}

