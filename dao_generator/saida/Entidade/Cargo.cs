using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Entidade {

public class Cargo {

	private Int32 id;
	private String nome;
	private List<Funcionario> funcionarios = new List<Funcionario>();  

	public Cargo() {
	}

	public Int32 Id {
		get { return id; }
		set { id = value; }
	}

	public String Nome {
		get { return nome; }
		set { nome = value; }
	}

	public List<Funcionario> Funcionarios {  
		get { return funcionarios; }  
		set { funcionarios = value; }  
	}
}
}