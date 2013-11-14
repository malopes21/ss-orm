package org.malopes.ssp;

import java.util.ArrayList;
import java.util.List;

import javax.swing.text.StyleContext.SmallAttributeSet;

public class TabelaSimbolos {

	private static List<Simbolo> tabela = new ArrayList<Simbolo>();
	private static List<SimboloLiteral> literais = new ArrayList<SimboloLiteral>();

	public static List<Simbolo> getTabela() {
		return tabela;
	}

	public static void addSimbolo(Simbolo simbolo) {
		if (!tabela.contains(simbolo)) {
			tabela.add(simbolo);
		}
		simbolo.getToken().setIndiceTabSimb(tabela.indexOf(simbolo));
	}

	public static void listaTabela() {
		System.out.println("\n");
		for (Simbolo simbolo : tabela) {
			simbolo.debug();
		}
	}

	public static List<Simbolo> getSimbolosByEscopo(String escopo) {

		List<Simbolo> simbolosByEscopo = new ArrayList<Simbolo>();
		for (Simbolo simb : tabela) {
			if (simb.getEscopo().equals(escopo)) {
				simbolosByEscopo.add(simb);
			}
		}
		return simbolosByEscopo;
	}

	public static String getTipoSimbolo(Token token) {

		Simbolo simboloAchado = tabela.get(token.getIndiceTabSimb());
		if (simboloAchado != null) {
			return simboloAchado.getTipo();
		}

		return null;
	}

	public static String getTipoCompativel(Classe classe) {
		switch (classe) {
		case ConstanteLiteralInteira:
			return "Int";
		case ConstanteLiteralString:
			return "Str";
		case ConstanteLiteralReal:
			return "Real";
		default:
			return null;
		}
	}
	
	/**
	 * <Tipo>      ::= 'Int' | 'Real' | 'Str' | 'Nada'
	 */
	public static String getTipoCompativelASM(String tipo) {
		if(tipo.equals("Int")) {
			return "DD";
		} else if(tipo.equals("Real")) {
			return "DD";
		} else if(tipo.equals("Str")) {
			return "DB";
		} else if(tipo.equals("Nada")) {
			return "DD";
		}
		throw new RuntimeException("Tipo não existente!");
	}

	public static void setTipoSimbolo(Token token, String tipo) {
		/*
		 * for (int i = 0; i< tabela.size(); i++) { Simbolo simbolo =
		 * tabela.get(i); if
		 * (simbolo.getToken().getImagem().equals(token.getImagem())) {
		 * simbolo.setTipo(tipo); return true; } }
		 */
		Simbolo simboloLocal = tabela.get(token.getIndiceTabSimb());
		simboloLocal.setTipo(tipo);
		simboloLocal.setValor(getValorPadrao(tipo));
	}

	private static Object getValorPadrao(String tipo) {
		
		if ("Int".equals(tipo)) {
			return new Integer(0);
		} else if ("Real".equals(tipo)) {
			return new Double(0.0);
		} else if ("Str".equals(tipo)) {
			return new String("");
		} else if ("Nada".equals(tipo)) {
			return new Nada();
		} 

		return null;
	}

	public static String getValorPadraoASM(String tipo) {
		
		if ("Int".equals(tipo)) {
			return "0";
		} else if ("Real".equals(tipo)) {
			return "0";
		} else if ("Str".equals(tipo)) {
			return "256 DUP(0)";
		} else if ("Nada".equals(tipo)) {
			return "0";
		} 

		throw new RuntimeException("Tipo inexistente!");
	}
	
	public static Object getValor(Token token) {
		Simbolo simboloAchado = tabela.get(token.getIndiceTabSimb());
		if (simboloAchado != null) {
			return simboloAchado.getValor();
		}
		return null;
	}

	public static boolean setValor(Token token, Object valor) {
		/*
		 * for (Simbolo simbolo : tabela) { if
		 * (simbolo.getToken().getImagem().equals(token.getImagem())){
		 * simbolo.setValor(value); return true; } }
		 */
		Simbolo simboloLocal = tabela.get(token.getIndiceTabSimb());
		if (simboloLocal.getTipo() != null) {
			simboloLocal.setValor(valor);
		}
		return false;
	}

	public static String getTipoDefSimbolo(Token defId) {
		for(Simbolo simbolo : tabela) {
			if(simbolo.getToken().equals(defId) && simbolo.getEscopo().equals(defId.getImagem())) {
				//System.out.println("Simbolo id def encontrado: " + simbolo);
				return simbolo.getTipo();
			}
		}

		return null;
	}

	public static void addParamToSimbolo(Token arg, Token token) {
		Simbolo simboloAchado = tabela.get(token.getIndiceTabSimb());
		if (simboloAchado != null) {
			simboloAchado.addParam(arg);
		}
	}

	public static List<Token> getParamsBySimbolo(Token token) {
		Simbolo simboloLocal = new Simbolo();
		simboloLocal.setToken(token);
		simboloLocal.setEscopo(token.getImagem());
		Simbolo simboloAchado = tabela.get( tabela.indexOf(simboloLocal) );
		if (simboloAchado != null) {
			return simboloAchado.getParams();
		}
		return null;
	}
	
	

	public static String getTipoToken(Token token) {
		if(token.getClasse() == Classe.Identificador) {
			return getTipoSimbolo(token);
		} else {
			return getTipoCompativel(token.getClasse());
		}
	}

	public static void addSimboloLiteral(Token token) {
		SimboloLiteral simboloLiteral = new SimboloLiteral(token.getImagem(), token.getClasse(), null);
		if (!literais.contains(simboloLiteral)) {
			String rotuloVarCreated = "$$var" + literais.size();
			simboloLiteral.setImagemVarGlobal(rotuloVarCreated);
			literais.add(simboloLiteral);
		} /*else {
			simboloLiteral = literais.get(literais.indexOf(simboloLiteral));
		}*/
		//simbolo.getToken().setIndiceTabSimb(tabela.indexOf(simbolo));
		token.setIndiceTabSimb(literais.indexOf(simboloLiteral));
		
	}

	public static void listaLiterais() {
		System.out.println("\n\nTabela de Literais:");
		for(SimboloLiteral simboloLiteral: literais) {
			System.out.println(simboloLiteral);
		}
		
	}
	
	public static List<SimboloLiteral> getSimbolosLiterais() {
		return literais;
	}

	public static String getImagemVarGlobal(Token operan) {
		return literais.get(operan.getIndiceTabSimb()).getImagemVarGlobal();
	}

	
	public static List<Simbolo> getVarsLocaisByEscopo(Token token) {
		List<Simbolo> simbolosVarLocalByEscopo = new ArrayList<Simbolo>();
		for (Simbolo simb : tabela) {
			if (simb.getEscopo().equals(token.getImagem()) && simb.getNatureza() == Simbolo.VAR_LOCAL ) {
				simbolosVarLocalByEscopo.add(simb);
			}
		}
	
		return simbolosVarLocalByEscopo;
	}

	public static void setTipoSimboloVarLocal(Token id, String tipo, int natureza) {
		setTipoSimbolo(id, tipo);
		tabela.get(id.getIndiceTabSimb()).setNatureza(natureza);
	}

	public static boolean isIdFuncao(Token operan1) {
		for(Simbolo simbolo: tabela) {
			if(simbolo.getToken().getImagem().equals(simbolo.getEscopo())) {
				return true;
			}
		}
		return false;
	}

}
