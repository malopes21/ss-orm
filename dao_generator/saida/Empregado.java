import java.util.*;

public class Empregado {

	private Integer cod_emp;
	private String nome_emp;
	private String end_emp;
	private String sexo_emp;
	private String data_nasc;
	private Integer cod_gerente;
	private Integer num_dept;
	private Empregado empregado = new Empregado();  
	private Departamento departamento = new Departamento();  
	private List<Empregado> empregados = new ArrayList<Empregado>();  
	private List<Gerencia> gerencias = new ArrayList<Gerencia>();  
	private List<Dependente> dependentes = new ArrayList<Dependente>();  
	private List<Proj_emp> proj_emps = new ArrayList<Proj_emp>();  

	public Empregado() {
	}

	public Integer getCod_emp() {
		return cod_emp;
	}

	public void setCod_emp(Integer cod_emp) {
		this.cod_emp = cod_emp;
	}

	public String getNome_emp() {
		return nome_emp;
	}

	public void setNome_emp(String nome_emp) {
		this.nome_emp = nome_emp;
	}

	public String getEnd_emp() {
		return end_emp;
	}

	public void setEnd_emp(String end_emp) {
		this.end_emp = end_emp;
	}

	public String getSexo_emp() {
		return sexo_emp;
	}

	public void setSexo_emp(String sexo_emp) {
		this.sexo_emp = sexo_emp;
	}

	public String getData_nasc() {
		return data_nasc;
	}

	public void setData_nasc(String data_nasc) {
		this.data_nasc = data_nasc;
	}

	public Integer getCod_gerente() {
		return cod_gerente;
	}

	public void setCod_gerente(Integer cod_gerente) {
		this.cod_gerente = cod_gerente;
	}

	public Integer getNum_dept() {
		return num_dept;
	}

	public void setNum_dept(Integer num_dept) {
		this.num_dept = num_dept;
	}

	public Empregado getEmpregado() {  
		return empregado;  
	}

	public void setEmpregado(Empregado empregado) {  
		this.empregado = empregado;  
	}


	public Departamento getDepartamento() {  
		return departamento;  
	}

	public void setDepartamento(Departamento departamento) {  
		this.departamento = departamento;  
	}


	public List<Empregado> getEmpregados() {  
		return empregados;  
	}

	public void setEmpregado(List<Empregado> empregados) {  
		this.empregados = empregados;  
	}


	public List<Gerencia> getGerencias() {  
		return gerencias;  
	}

	public void setGerencia(List<Gerencia> gerencias) {  
		this.gerencias = gerencias;  
	}


	public List<Dependente> getDependentes() {  
		return dependentes;  
	}

	public void setDependente(List<Dependente> dependentes) {  
		this.dependentes = dependentes;  
	}


	public List<Proj_emp> getProj_emps() {  
		return proj_emps;  
	}

	public void setProj_emp(List<Proj_emp> proj_emps) {  
		this.proj_emps = proj_emps;  
	}

}