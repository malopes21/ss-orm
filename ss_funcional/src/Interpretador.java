import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
		interpretador.leArquivo("prog05.func");
		interpretador.parse();
		//interpretador.mostraDefs();
		//interpretador.mostraRun();

		Object valor = interpretador.eval(interpretador.exprRun);

		System.out.println(valor);

	}

	private Object eval(Expressao expr) {
		switch (expr.getTipo()) {
			case ATOM:
				return new Double(expr.getAtom());
				
			case EXPRESSAO:
				String idFuncao = expr.getFilho(0).getIdFuncao();
				
				if (idFuncao.equals("+") || idFuncao.equals("-") || idFuncao.equals("*") || idFuncao.equals("/") ) {
					List<Object> valores = new ArrayList<Object>();
					for (int i=1; i<expr.getCorpo().size(); i++) {
						valores.add(eval(expr.getFilho(i)));
					}
					if (valores.size() < 2) {
						System.out.println("ERRO_01 de quantidade de parametros!");
						System.exit(0);
					}
					return calculaValores(idFuncao, valores);
					
				} else if (idFuncao.equals("=") || idFuncao.equals(">") || idFuncao.equals(">=") || idFuncao.equals("<") || idFuncao.equals("<=")) {
					List<Object> valores = new ArrayList<Object>();
					for (int i=1; i<expr.getCorpo().size(); i++) {
						valores.add(eval(expr.getFilho(i)));
					}
					if (valores.size() < 2) {
						System.out.println("ERRO_02 de quantidade de parametros!");
						System.exit(0);
					}
					return avaliaCondicoes(idFuncao, valores);
					
				} else if (idFuncao.equals("se")) {
					if (expr.getCorpo().size() != 4) {
						System.out.println("ERRO_03 de quantidade de expressoes para funcao 'se'!");
						System.exit(0);
					}
					Boolean condicao = (Boolean) eval(expr.getFilho(1));
					if (condicao) {
						return eval(expr.getFilho(2));
					} else {
						return eval(expr.getFilho(3));
					}
					
				} else {
					Funcao funcaoBuscada = funcoes.get(idFuncao);
					if(funcaoBuscada == null) {
						System.out.println("ERRO_04 de funcao nao encontrada! idFuncao: " + idFuncao);
						System.exit(0);
					}
					Integer nArgs = funcaoBuscada.getArgumentos().size();
					Integer nParams = expr.getCorpo().size() - 1;
					if(nArgs != nParams) {
						System.out.println("ERRO_05 de numero incorreto de parametros passados!");
						System.exit(0);
					}
					Expressao exprNova = substituir(funcaoBuscada, expr);
					//System.out.println(exprNova);
					return eval(exprNova);
					
				}
	
			default:
				break;
		}
		return null;
	}

	private Expressao substituir(Funcao funcaoBuscada, Expressao expr) {
		List<String> argsFormal = funcaoBuscada.getArgumentos();
		Expressao exprNova = cloneExpressao(funcaoBuscada.getExpressao());
		
		for(int i=0; i<argsFormal.size(); i++) {
			String arg = argsFormal.get(i);
			//Double valor = (Double) eval(expr.getFilho(i+1));
			//substuirArg(arg, exprNova, valor.toString());
			substuirArg(arg, exprNova, expr.getFilho(i+1));
		}
		
		return exprNova;
	}
	
	private void substuirArg(String arg, Expressao exprNova, Expressao valor) {
		for(Expressao exprItem : exprNova.getCorpo()) {
			if(exprItem.getTipo() == TipoExpressao.ATOM) {
				if (arg.equals(exprItem.getAtom())) {
					//exprItem.setAtom(valor);
					exprNova.getCorpo().set(exprNova.getCorpo().indexOf(exprItem), valor); 
				}
			} else if(exprItem.getTipo() == TipoExpressao.ID_FUNCAO) {
				if (arg.equals(exprItem.getIdFuncao())) {
					//exprItem.setAtom(valor);
					valor.setIdFuncao(valor.getAtom());
					valor.setTipo(TipoExpressao.ID_FUNCAO);
					exprNova.getCorpo().set(exprNova.getCorpo().indexOf(exprItem), valor); 
				}
			
			} else if (exprItem.getTipo() == TipoExpressao.EXPRESSAO) {
				substuirArg(arg, exprItem, valor);
			}
		}
	}

	private void substuirArg(String arg, Expressao exprNova, String valor) {
		for(Expressao exprItem : exprNova.getCorpo()) {
			if(exprItem.getTipo() == TipoExpressao.ATOM) {
				if (arg.equals(exprItem.getAtom())) {
					exprItem.setAtom(valor);
				}
			} else if (exprItem.getTipo() == TipoExpressao.EXPRESSAO) {
				substuirArg(arg, exprItem, valor);
			}
		}
	}

	private Expressao cloneExpressao(Expressao expressao) {
		Expressao clone = new Expressao(expressao.getTipo());
		clone.setAtom(expressao.getAtom());
		clone.setIdFuncao(expressao.getIdFuncao());
		for(Expressao exprItem : expressao.getCorpo()) {
			clone.addExpressao(cloneExpressao(exprItem));
		}

		return clone;
	}

	private Object avaliaCondicoes(String condicao, List<Object> valores) {
		Double valorAtual = (Double) valores.get(0);
		Boolean resultado = true;
		if (condicao.equals("=")) {
			for(int i=1; i<valores.size(); i++){
				resultado = resultado && valorAtual.doubleValue() == ((Double)valores.get(i)).doubleValue();
			}
		} else if (condicao.equals(">=")) {
			for(int i=1; i<valores.size(); i++){
				resultado = resultado && valorAtual.doubleValue() >= ((Double) valores.get(i)).doubleValue();
			}
		} else if (condicao.equals("<=")) {
			for(int i=1; i<valores.size(); i++){
				resultado = resultado && valorAtual.doubleValue() <= ((Double) valores.get(i)).doubleValue();
			}
		} else if (condicao.equals(">")) {
			for(int i=1; i<valores.size(); i++){
				resultado = resultado && valorAtual.doubleValue() > ((Double) valores.get(i)).doubleValue();
			}
		} else if (condicao.equals("<")) {
			for(int i=1; i<valores.size(); i++){
				resultado = resultado && valorAtual.doubleValue() < ((Double) valores.get(i)).doubleValue();
			}
		}     
		return resultado;
		
	}

	private Object calculaValores(String operacao, List<Object> valores) {
		Double resultado = (Double) valores.get(0) ;
		if (operacao.equals("+")) {
			for(int i=1; i<valores.size(); i++){
				resultado = resultado + (Double) valores.get(i);
			}
		} else if (operacao.equals("-")) {
			for(int i=1; i<valores.size(); i++){
				resultado = resultado - (Double) valores.get(i);
			}
		} else if (operacao.equals("*")) {
			for(int i=1; i<valores.size(); i++){
				resultado = resultado * (Double) valores.get(i);
			}
		} else if (operacao.equals("/")) {
			for(int i=1; i<valores.size(); i++){
				resultado = resultado + (Double) valores.get(i);
			}
		}
		return resultado;
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
			System.out.println("ERRO_06 de parser do comando run!");
			System.exit(0);
		}
		//System.out.println(run);
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
		if (token.matches("\\D\\p{Alnum}*")) {
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
					System.out.println("ERRO_07 de parser!");
					System.exit(0);
				}

				nextToken();
				while (!token.equals("$")) {
					try {
						funcao.setExpressao(leExpressao());
					} catch (Exception e) {
						System.out.println("ERRO_08 de parser nas expressoes");
						System.exit(0);
					}

					nextToken();
				}
			}
		} else {
			System.out.println("ERRO_09 de parser: ");
			System.exit(0);
		}
		funcoes.put(funcao.getNome(), funcao);
	}

	private Expressao leExpressao() throws Exception {

		if (token.equals("$")) {
			throw new Exception("ERRO_10 EOF encontrado!");
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
					throw new Exception("ERRO_11 EOF encontrado!");
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
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
