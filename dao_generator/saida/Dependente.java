import java.util.*;

public class Dependente {

	private Integer cod_emp;
	private Integer cod_depend;
	private String nome_depend;
	private String sexo_depend;
	private String tipo_depend;
	private Date data_nasc;
	private Empregado empregado = new Empregado();  

	public Dependente() {
	}

	public Integer getCod_emp() {
		return cod_emp;
	}

	public void setCod_emp(Integer cod_emp) {
		this.cod_emp = cod_emp;
	}

	public Integer getCod_depend() {
		return cod_depend;
	}

	public void setCod_depend(Integer cod_depend) {
		this.cod_depend = cod_depend;
	}

	public String getNome_depend() {
		return nome_depend;
	}

	public void setNome_depend(String nome_depend) {
		this.nome_depend = nome_depend;
	}

	public String getSexo_depend() {
		return sexo_depend;
	}

	public void setSexo_depend(String sexo_depend) {
		this.sexo_depend = sexo_depend;
	}

	public String getTipo_depend() {
		return tipo_depend;
	}

	public void setTipo_depend(String tipo_depend) {
		this.tipo_depend = tipo_depend;
	}

	public Date getData_nasc() {
		return data_nasc;
	}

	public void setData_nasc(Date data_nasc) {
		this.data_nasc = data_nasc;
	}

	public Empregado getEmpregado() {  
		return empregado;  
	}

	public void setEmpregado(Empregado empregado) {  
		this.empregado = empregado;  
	}

}