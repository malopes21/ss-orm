package blazon;

public class TesteDate {

	public static void main(String[] args) {
		teste(new java.sql.Date(new java.util.Date().getTime()));
	}
	
	private static void teste (java.util.Date data) {
		
		System.out.println(data);
	}
}
