import java.util.*;

public class Departamento {

	private Integer num_dept;
	private String nome_dept;
	private List<Empregado> empregados = new ArrayList<Empregado>();  
	private List<Gerencia> gerencias = new ArrayList<Gerencia>();  
	private List<Projeto> projetos = new ArrayList<Projeto>();  
	private List<Local_dept> local_depts = new ArrayList<Local_dept>();  

	public Departamento() {
	}

	public Integer getNum_dept() {
		return num_dept;
	}

	public void setNum_dept(Integer num_dept) {
		this.num_dept = num_dept;
	}

	public String getNome_dept() {
		return nome_dept;
	}

	public void setNome_dept(String nome_dept) {
		this.nome_dept = nome_dept;
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


	public List<Projeto> getProjetos() {  
		return projetos;  
	}

	public void setProjeto(List<Projeto> projetos) {  
		this.projetos = projetos;  
	}


	public List<Local_dept> getLocal_depts() {  
		return local_depts;  
	}

	public void setLocal_dept(List<Local_dept> local_depts) {  
		this.local_depts = local_depts;  
	}

}