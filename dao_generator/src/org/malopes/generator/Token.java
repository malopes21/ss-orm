package org.malopes.generator;

public class Token {

	private String imagem;
	private Classe classe;
	private int indiceTabSimb;
	private int linha;
	private int coluna;

	public Token() {
	}

	public Token(String imagem, Classe classe, int indiceTabSimb, int linha, int coluna) {
		super();
		this.imagem = imagem;
		this.classe = classe;
		this.indiceTabSimb = indiceTabSimb;
		this.linha = linha;
		this.coluna = coluna;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public Classe getClasse() {
		return classe;
	}

	public void setClasse(Classe classe) {
		this.classe = classe;
	}

	public int getIndiceTabSimb() {
		return indiceTabSimb;
	}

	public void setIndiceTabSimb(int indiceTabSimb) {
		this.indiceTabSimb = indiceTabSimb;
	}

	public int getLinha() {
		return linha;
	}

	public void setLinha(int linha) {
		this.linha = linha;
	}

	public int getColuna() {
		return coluna;
	}

	public void setColuna(int coluna) {
		this.coluna = coluna;
	}

	@Override
	public String toString() {
		return imagem;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((imagem == null) ? 0 : imagem.hashCode());
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
		Token other = (Token) obj;
		if (imagem == null) {
			if (other.imagem != null)
				return false;
		} else if (!imagem.equals(other.imagem))
			return false;
		return true;
	}
	
	

}
