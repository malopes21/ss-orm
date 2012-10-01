import java.util.*;

public class Local_dept {

	private Integer num_dept;
	private Integer cod_local;
	private Departamento departamento = new Departamento();  
	private Local local = new Local();  

	public Local_dept() {
	}

	public Integer getNum_dept() {
		return num_dept;
	}

	public void setNum_dept(Integer num_dept) {
		this.num_dept = num_dept;
	}

	public Integer getCod_local() {
		return cod_local;
	}

	public void setCod_local(Integer cod_local) {
		this.cod_local = cod_local;
	}

	public Departamento getDepartamento() {  
		return departamento;  
	}

	public void setDepartamento(Departamento departamento) {  
		this.departamento = departamento;  
	}


	public Local getLocal() {  
		return local;  
	}

	public void setLocal(Local local) {  
		this.local = local;  
	}

}