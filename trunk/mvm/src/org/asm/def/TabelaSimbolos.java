package org.asm.def;

import java.util.ArrayList;
import java.util.List;

public class TabelaSimbolos {

	private static List<Simbolo> tabela = new ArrayList<Simbolo>();

	public static List<Simbolo> getTabela() {
		return tabela;
	}

	public static void addSimbolo(Simbolo simbolo) {
		if (!tabela.contains(simbolo)) {
			tabela.add(simbolo);
		}
		simbolo.getToken().setIndex(tabela.indexOf(simbolo));
	}

	public static void listaTabela() {
		System.out.println("\n");
		for (Simbolo simbolo : tabela) {
			System.out.println(simbolo);
		}
	}

	public static String getTipoSimbolo(Token token) {

		Simbolo simboloAchado = tabela.get(token.getIndex());
		if (simboloAchado != null) {
			return simboloAchado.getTipo();
		}

		return null;
	}

	public static void setTipoSimbolo(Token token, String tipo) {
		/*
		 * for (int i = 0; i< tabela.size(); i++) { Simbolo simbolo =
		 * tabela.get(i); if
		 * (simbolo.getToken().getImagem().equals(token.getImagem())) {
		 * simbolo.setTipo(tipo); return true; } }
		 */
		Simbolo simboloLocal = tabela.get(token.getIndex());
		simboloLocal.setTipo(tipo);
		// simboloLocal.setValor(getValorPadrao(tipo));
	}

	public static Object getValor(Token token) {
		Simbolo simboloAchado = tabela.get(token.getIndex());
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
		Simbolo simboloLocal = tabela.get(token.getIndex());
		if (simboloLocal.getTipo() != null) {
			simboloLocal.setValor(valor);
		}
		return false;
	}

}