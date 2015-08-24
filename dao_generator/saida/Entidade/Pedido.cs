using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Entidade {

public class Pedido {

	private Int32 id;
	private Int32 id_cliente;
	private Int32 id_funcionario;
	private Double total;
	private Cliente cliente = new Cliente();  
	private Funcionario funcionario = new Funcionario();  
	private List<Item> items = new List<Item>();  

	public Pedido() {
	}

	public Int32 Id {
		get { return id; }
		set { id = value; }
	}

	public Int32 Id_cliente {
		get { return id_cliente; }
		set { id_cliente = value; }
	}

	public Int32 Id_funcionario {
		get { return id_funcionario; }
		set { id_funcionario = value; }
	}

	public Double Total {
		get { return total; }
		set { total = value; }
	}

	public Cliente Cliente {  
		 get { return cliente; }  
		 set { cliente = value; }  
	}


	public Funcionario Funcionario {  
		 get { return funcionario; }  
		 set { funcionario = value; }  
	}


	public List<Item> Items {  
		get { return items; }  
		set { items = value; }  
	}
}
}