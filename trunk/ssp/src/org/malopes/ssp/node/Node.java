package org.malopes.ssp.node;

import java.util.ArrayList;
import java.util.List;

public abstract class Node {
	
	private Node pai;
	private List<Node> filhos;
	
	public Node(int maxFilhos) {
		if (maxFilhos > 0) {
			filhos = new ArrayList<Node>(maxFilhos);
		}
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

	public void addFilho(Node node) {
		if (node != null) {
			node.setPai(this);
		}
		filhos.add(node);
	}
	
	public Node getChild(int index) {
		return filhos.get(index);
	}
	
	public abstract Object analisar();
	
	public abstract Object interpretar();
	
}
