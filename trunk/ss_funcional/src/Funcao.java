import java.util.ArrayList;
import java.util.List;

public class Funcao {

	private List<String> argumentos = new ArrayList<String>();
	private String nome;
	private Expressao expressao;

	public void addArgumento(String arg) {
		argumentos.add(arg);
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

	public Expressao getExpressao() {
		return expressao;
	}

	public void setExpressao(Expressao expressao) {
		this.expressao = expressao;
	}

	@Override
	public String toString() {
		return argumentos + " : " + expressao;
	}
}
