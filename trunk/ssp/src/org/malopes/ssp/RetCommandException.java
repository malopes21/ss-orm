package org.malopes.ssp;

public class RetCommandException extends RuntimeException {

	private Object valorRetorno;
	private String message;

	public RetCommandException() {
		super("Comando de Retorno encontrado!");
	}

	public RetCommandException(Object valorRetorno) {
		this.valorRetorno = valorRetorno;
	}

	public RetCommandException(Object valorRetorno, String message) {
		super(message);
		this.valorRetorno = valorRetorno;
		this.message = message;
	}

	public Object getValorRetorno() {
		return valorRetorno;
	}

	public void setValorRetorno(Object valorRetorno) {
		this.valorRetorno = valorRetorno;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
