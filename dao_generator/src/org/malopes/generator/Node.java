package org.malopes.generator;

import java.util.ArrayList;
import java.util.List;

public class Node {

	private Node pai;
	private List<Node> filhos;
	private TipoOfNode tipo;
	private Token token;

	public Node(TipoOfNode tipo) {
		filhos = new ArrayList<Node>();
		this.tipo = tipo;
	}

	public Node(Token token) {
		this.tipo = TipoOfNode.Token;
		this.token = token;
	}

	public List<Node> getFilhos() {
		return filhos;
	}

	public void setFilhos(List<Node> filhos) {
		this.filhos = filhos;
	}

	public Node getPai() {
		return pai;
	}

	public void setPai(Node pai) {
		this.pai = pai;
	}

	public TipoOfNode getTipo() {
		return tipo;
	}

	public void setTipo(TipoOfNode tipo) {
		this.tipo = tipo;
	}

	public Token getToken() {
		return token;
	}

	public void setToken(Token token) {
		this.token = token;
	}

	public void addFilho(Node node) {
		if (node != null) {
			node.setPai(this);
		}
		filhos.add(node);
	}

	public Node getFilho(int index) {
		return filhos.get(index);
	}

	/*
	 * public abstract Object analisar();
	 * 
	 * public abstract Object interpretar();
	 */

}
