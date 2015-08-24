using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Entidade {

public class Item {

	private Int32 id;
	private Int32 id_pedido;
	private Int32 id_produto;
	private Double quantidade;
	private Pedido pedido = new Pedido();  
	private Produto produto = new Produto();  

	public Item() {
	}

	public Int32 Id {
		get { return id; }
		set { id = value; }
	}

	public Int32 Id_pedido {
		get { return id_pedido; }
		set { id_pedido = value; }
	}

	public Int32 Id_produto {
		get { return id_produto; }
		set { id_produto = value; }
	}

	public Double Quantidade {
		get { return quantidade; }
		set { quantidade = value; }
	}

	public Pedido Pedido {  
		 get { return pedido; }  
		 set { pedido = value; }  
	}


	public Produto Produto {  
		 get { return produto; }  
		 set { produto = value; }  
	}

}
}