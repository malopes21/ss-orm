public class Telefone {

	private Integer id;
	private Integer id_cliente;
	private String numero;
	private Integer operadora;
	private Cliente cliente = new Cliente();  

	public Telefone() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(Integer id_cliente) {
		this.id_cliente = id_cliente;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public Integer getOperadora() {
		return operadora;
	}

	public void setOperadora(Integer operadora) {
		this.operadora = operadora;
	}

	public Cliente getCliente() {  
		return cliente;  
	}

	public void setCliente(Cliente cliente) {  
		this.cliente = cliente;  
	}

}