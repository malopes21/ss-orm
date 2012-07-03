package org.malopes.generator.defs;

import java.util.ArrayList;
import java.util.List;

import org.malopes.generator.consts.TipoOfKey;

public class Chave {

	private TipoOfKey tipo;
	private List<Token> ids = new ArrayList<Token>();
	private Token reference;

	public List<Token> getIds() {
		return ids;
	}

	public void setIds(List<Token> ids) {
		this.ids = ids;
	}

	public TipoOfKey getTipo() {
		return tipo;
	}

	public void setTipo(TipoOfKey tipo) {
		this.tipo = tipo;
	}

	public String toString() {
		return tipo + " " + ids + " " + reference;
	}

	public Token getReference() {
		return reference;
	}

	public void setReference(Token reference) {
		this.reference = reference;
	}

}
