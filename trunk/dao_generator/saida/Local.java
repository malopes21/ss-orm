import java.util.*;

public class Local {

	private Integer cod_local;
	private String desc_local;
	private List<Projeto> projetos = new ArrayList<Projeto>();  
	private List<Local_dept> local_depts = new ArrayList<Local_dept>();  

	public Local() {
	}

	public Integer getCod_local() {
		return cod_local;
	}

	public void setCod_local(Integer cod_local) {
		this.cod_local = cod_local;
	}

	public String getDesc_local() {
		return desc_local;
	}

	public void setDesc_local(String desc_local) {
		this.desc_local = desc_local;
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