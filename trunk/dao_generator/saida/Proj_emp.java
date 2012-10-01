import java.util.*;

public class Proj_emp {

	private Integer num_proj;
	private Integer cod_emp;
	private Integer quant_horas;
	private Projeto projeto = new Projeto();  
	private Empregado empregado = new Empregado();  

	public Proj_emp() {
	}

	public Integer getNum_proj() {
		return num_proj;
	}

	public void setNum_proj(Integer num_proj) {
		this.num_proj = num_proj;
	}

	public Integer getCod_emp() {
		return cod_emp;
	}

	public void setCod_emp(Integer cod_emp) {
		this.cod_emp = cod_emp;
	}

	public Integer getQuant_horas() {
		return quant_horas;
	}

	public void setQuant_horas(Integer quant_horas) {
		this.quant_horas = quant_horas;
	}

	public Projeto getProjeto() {  
		return projeto;  
	}

	public void setProjeto(Projeto projeto) {  
		this.projeto = projeto;  
	}


	public Empregado getEmpregado() {  
		return empregado;  
	}

	public void setEmpregado(Empregado empregado) {  
		this.empregado = empregado;  
	}

}