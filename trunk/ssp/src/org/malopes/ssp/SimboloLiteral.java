package org.malopes.ssp;

public class SimboloLiteral {

	private String imagem;
	private Classe classe;
	private String imagemVarGlobal;

	public SimboloLiteral() {
		super();
	}

	public SimboloLiteral(String imagem, Classe classe, String imagemVarGlobal) {
		super();
		this.imagem = imagem;
		this.classe = classe;
		this.imagemVarGlobal = imagemVarGlobal;
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

	public String getImagemVarGlobal() {
		return imagemVarGlobal;
	}

	public void setImagemVarGlobal(String imagemVarGlobal) {
		this.imagemVarGlobal = imagemVarGlobal;
	}

	@Override
	public String toString() {
		return classe + " " + imagemVarGlobal + " '" + imagem + "'";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((classe == null) ? 0 : classe.hashCode());
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
		SimboloLiteral other = (SimboloLiteral) obj;
		if (classe != other.classe)
			return false;
		if (imagem == null) {
			if (other.imagem != null)
				return false;
		} else if (!imagem.equals(other.imagem))
			return false;
		return true;
	}

}
