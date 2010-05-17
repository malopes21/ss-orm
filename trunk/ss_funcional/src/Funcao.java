import java.util.ArrayList;
import java.util.List;

public class Funcao {

	private List<String> argumentos = new ArrayList<String>();
	private String nome;
	private List<String> corpo = new ArrayList<String>();

	public void addArgumento(String arg) {
		argumentos.add(arg);
	}
	
	public void addFragCorpo(String frag) {
		corpo.add(frag);
	}

	public List<String> getArgumentos() {
		return argumentos;
	}

	public void setArgumentos(List<String> argumentos) {
		this.argumentos = argumentos;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<String> getCorpo() {
		return corpo;
	}

	public void setCorpo(List<String> corpo) {
		this.corpo = corpo;
	}

}
