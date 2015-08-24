using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Entidade {

public class Produto {

	private Int32 id;
	private String descricao;
	private Double preco;
	private List<Item> items = new List<Item>();  

	public Produto() {
	}

	public Int32 Id {
		get { return id; }
		set { id = value; }
	}

	public String Descricao {
		get { return descricao; }
		set { descricao = value; }
	}

	public Double Preco {
		get { return preco; }
		set { preco = value; }
	}

	public List<Item> Items {  
		get { return items; }  
		set { items = value; }  
	}
}
}