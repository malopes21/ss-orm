import java.util.*;

public class Projeto {

	private Integer num_proj;
	private Integer cod_local;
	private Integer num_dept;
	private String desc_proj;
	private Local local = new Local();  
	private Departamento departamento = new Departamento();  
	private List<Proj_emp> proj_emps = new ArrayList<Proj_emp>();  

	public Projeto() {
	}

	public Integer getNum_proj() {
		return num_proj;
	}

	public void setNum_proj(Integer num_proj) {
		this.num_proj = num_proj;
	}

	public Integer getCod_local() {
		return cod_local;
	}

	public void setCod_local(Integer cod_local) {
		this.cod_local = cod_local;
	}

	public Integer getNum_dept() {
		return num_dept;
	}

	public void setNum_dept(Integer num_dept) {
		this.num_dept = num_dept;
	}

	public String getDesc_proj() {
		return desc_proj;
	}

	public void setDesc_proj(String desc_proj) {
		this.desc_proj = desc_proj;
	}

	public Local getLocal() {  
		return local;  
	}

	public void setLocal(Local local) {  
		this.local = local;  
	}


	public Departamento getDepartamento() {  
		return departamento;  
	}

	public void setDepartamento(Departamento departamento) {  
		this.departamento = departamento;  
	}


	public List<Proj_emp> getProj_emps() {  
		return proj_emps;  
	}

	public void setProj_emp(List<Proj_emp> proj_emps) {  
		this.proj_emps = proj_emps;  
	}

}