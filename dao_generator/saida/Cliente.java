public class Cliente {

	private Integer id;
	private String nome;
	private String endereco;
	private String cpf;
	private List<Telefone> telefones = new ArrayList<Telefone>;  

	public Cliente() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public List<Telefone> getTelefones() {  
		return telefones;  
	}

	public void setTelefone(List<Telefone> telefones) {  
		this.telefones = telefones;  
	}

}