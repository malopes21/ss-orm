package org.malopes.ssp;

class StackData {
	
	private String imagem;
	private String tipo;
	
	public StackData() {
		super();
	}

	public StackData(String imagem, String tipo) {
		super();
		this.imagem = imagem;
		this.tipo = tipo;
	}
	
	public String getImagem() {
		return imagem;
	}
	
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	
	public String getTipo() {
		return tipo;
	}
	
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	@Override
	public String toString() {
		return imagem + " " + tipo;
	}
	
}