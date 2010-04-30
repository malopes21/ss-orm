package org.malopes.ssp.node;

import org.malopes.ssp.Token;

public class NodeToken extends Node {

	private Token token;
	
	public NodeToken(int maxFilhos) {
		super(maxFilhos);
	}

	public NodeToken(Token token) {
		super(0);
		this.token = token;
	}
	
	@Override
	public Object analisar() {
		return null;
	}

	@Override
	public Object interpretar() {
		return null;
	}

}
