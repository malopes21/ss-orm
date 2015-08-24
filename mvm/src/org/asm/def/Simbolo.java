package org.asm.def;

public class Simbolo {

	private Token token;
	private String escopo;
	private String tipo;
	private Object valor;
	private short memoryPosition = -1;

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

	public short getMemoryPosition() {
		return memoryPosition;
	}

	public void setMemoryPosition(short memoryPosition) {
		this.memoryPosition = memoryPosition;
	}

	@Override
	public String toString() {
		return "Simbolo [token=" + token + ", escopo=" + escopo + ", tipo=" + tipo + ", valor=" + valor + "], memPos: " + memoryPosition;
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

}