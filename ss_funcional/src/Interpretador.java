import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public class Interpretador {

	private BufferedReader br = null;
	private Map<String, Funcao> funcoes = new HashMap<String, Funcao>();
	private String token;
	private String[] tokens;
	private Integer pToken = 0;
	private Expressao exprRun;

	public static void main(String[] args) throws Exception {

		Interpretador interpretador = new Interpretador();
		interpretador.leArquivo("prog01.func");
		interpretador.parse();
		interpretador.mostraDefs();
		interpretador.mostraRun();

		interpretador.eval();

		System.out.println("OK!");

	}

	private void eval() {

	}

	private void mostraRun() {
		System.out.println();
		System.out.println(exprRun);
	}

	private void mostraDefs() {
		for (Entry<String, Funcao> entrada : funcoes.entrySet()) {
			System.out.println(entrada.getKey() + " -> " + entrada.getValue());
		}
	}

	private void leArquivo(String filename) throws FileNotFoundException {
		br = new BufferedReader(new FileReader(filename));
	}

	private void parse() throws IOException {
		String linha = br.readLine();

		if (linha.equals(":defs")) {
			leDefs();
		}

		linha = br.readLine();

		if (linha.equals(":run")) {
			leRun();
		}
	}

	private void leRun() throws IOException {
		String run = br.readLine() + " $";
		try {
			tokens = run.split(" +");
			pToken = 0;
			nextToken();
			exprRun = leExpressao();

		} catch (Exception e) {
			System.out.println("ERRO de parser do comando run!");
			System.exit(0);
		}
		System.out.println(run);
	}

	private void leDefs() throws IOException {
		String def = br.readLine() + " $";

		while (def != null && !def.equals(":run") && !def.equals(" $")) {
			String[] defs = def.split(" +");
			leDef(defs);
			def = br.readLine() + " $";
		}
	}

	private void leDef(String[] defs) {
		tokens = defs;
		pToken = 0;
		nextToken();
		Funcao funcao = new Funcao();
		if (token.matches("\\D\\p{Alpha}*")) {
			funcao.setNome(token);
			nextToken();
			if (token.equals("=")) {
				nextToken();
				while (!token.equals(".") && !token.equals("$")) {
					funcao.addArgumento(token);
					nextToken();
				}
				// verificao de seguranca
				if (token.equals("$")) {
					System.out.println("ERRO de parser!");
					System.exit(0);
				}

				nextToken();
				while (!token.equals("$")) {
					try {
						funcao.setExpressao(leExpressao());
					} catch (Exception e) {
						System.out.println("ERRO de parser nas expressoes");
						System.exit(0);
					}

					nextToken();
				}
			}
		} else {
			System.out.println("ERRO de parser: ");
			System.exit(0);
		}
		funcoes.put(funcao.getNome(), funcao);
	}

	private Expressao leExpressao() throws Exception {

		if (token.equals("$")) {
			throw new Exception("EOF encontrado!");
		}

		if (token.equals("(")) {
			nextToken();
			Expressao expressaoRetorno = new Expressao(TipoExpressao.EXPRESSAO);

			Expressao exprIdFuncao = new Expressao(TipoExpressao.ID_FUNCAO);
			exprIdFuncao.setIdFuncao(token);
			expressaoRetorno.addExpressao(exprIdFuncao);

			nextToken();

			while (!token.equals(")")) {
				expressaoRetorno.addExpressao(leExpressao());

				// ler o fecha parenteses
				nextToken();
				if (token.equals("$")) {
					throw new Exception("EOF encontrado!");
				}
			}
			return expressaoRetorno;
		} else {
			Expressao atom = new Expressao(TipoExpressao.ATOM);
			atom.setAtom(token);
			return atom;
		}
	}

	private Boolean nextToken() {
		try {
			token = tokens[pToken];
			pToken++;
		} catch (ArrayIndexOutOfBoundsException e) {
			return false;
		}
		return true;
	}

}
