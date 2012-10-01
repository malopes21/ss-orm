import java.util.*;

public class Gerencia {

	private Integer cod_emp;
	private Integer num_dept;
	private Date data_emp;
	private Empregado empregado = new Empregado();  
	private Departamento departamento = new Departamento();  

	public Gerencia() {
	}

	public Integer getCod_emp() {
		return cod_emp;
	}

	public void setCod_emp(Integer cod_emp) {
		this.cod_emp = cod_emp;
	}

	public Integer getNum_dept() {
		return num_dept;
	}

	public void setNum_dept(Integer num_dept) {
		this.num_dept = num_dept;
	}

	public Date getData_emp() {
		return data_emp;
	}

	public void setData_emp(Date data_emp) {
		this.data_emp = data_emp;
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

}