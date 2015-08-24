using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Entidade {

public class Funcionario {

	private Int32 id;
	private String nome;
	private String matricula;
	private Double salario;
	private Int32 id_cargo;
	private Cargo cargo = new Cargo();  
	private List<Pedido> pedidos = new List<Pedido>();  

	public Funcionario() {
	}

	public Int32 Id {
		get { return id; }
		set { id = value; }
	}

	public String Nome {
		get { return nome; }
		set { nome = value; }
	}

	public String Matricula {
		get { return matricula; }
		set { matricula = value; }
	}

	public Double Salario {
		get { return salario; }
		set { salario = value; }
	}

	public Int32 Id_cargo {
		get { return id_cargo; }
		set { id_cargo = value; }
	}

	public Cargo Cargo {  
		 get { return cargo; }  
		 set { cargo = value; }  
	}


	public List<Pedido> Pedidos {  
		get { return pedidos; }  
		set { pedidos = value; }  
	}
}
}