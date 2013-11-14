package org.malopes.ssp;

import java.util.ArrayList;
import java.util.List;

public class Simbolo {

	private Token token;
	private String escopo;
	private String tipo;
	private Object valor;
	private int natureza = -1;  //se é id de var. local, id de parâmetro, id de função, etc
	private List<Token> params = new ArrayList<Token>();
	
	public static int VAR_LOCAL = 0;
	public static int PARAMETRO = 1;
	public static int FUNCAO = 2;
	

	public Simbolo() {
	}

	public Simbolo(Token token) {
		this.token = token;
	}

	public Simbolo(Token token, String escopo, String tipo, Object value) {
		this.token = token;
		this.escopo = escopo;
		this.tipo = tipo;
		this.valor = value;
	}
	
	public void addParam(Token param) {
		params.add(param);
	}

	public Object getValor() {
		return valor;
	}

	public void setValor(Object value) {
		this.valor = value;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Token getToken() {
		return token;
	}

	public void setToken(Token token) {
		this.token = token;
	}

	public String getEscopo() {
		return escopo;
	}

	public void setEscopo(String escopo) {
		this.escopo = escopo;
	}
	
	public List<Token> getParams() {
		return params;
	}

	public void debug() {
		String params[] = { token.getImagem(), escopo, token.getIndiceTabSimb() + "", tipo, valor + "", this.params.toString() };
		System.out.printf("%-20s %-20s %-20s %-20s %-20s %-20s\n", (Object[]) params);
	}

	@Override
	public String toString() {
		return token + " : " + escopo + " : " + tipo + " : " + valor;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((escopo == null) ? 0 : escopo.hashCode());
		result = prime * result + ((token == null) ? 0 : token.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Simbolo other = (Simbolo) obj;
		if (escopo == null) {
			if (other.escopo != null)
				return false;
		} else if (!escopo.equals(other.escopo))
			return false;
		if (token == null) {
			if (other.token != null)
				return false;
		} else if (!token.equals(other.token))
			return false;
		return true;
	}

	public int getNatureza() {
		return natureza;
	}

	public void setNatureza(int natureza) {
		this.natureza = natureza;
	}
	
	

}
