using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Entidade {

public class Cliente {

	private Int32 id;
	private String nome;
	private String endereco;
	private String telefone;
	private List<Pedido> pedidos = new List<Pedido>();  

	public Cliente() {
	}

	public Int32 Id {
		get { return id; }
		set { id = value; }
	}

	public String Nome {
		get { return nome; }
		set { nome = value; }
	}

	public String Endereco {
		get { return endereco; }
		set { endereco = value; }
	}

	public String Telefone {
		get { return telefone; }
		set { telefone = value; }
	}

	public List<Pedido> Pedidos {  
		get { return pedidos; }  
		set { pedidos = value; }  
	}
}
}