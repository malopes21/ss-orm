using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Entidade;

namespace DAO {


public class PedidoDAO {

	private SqlConnection conexao;
	private SqlTransaction tx;

	public PedidoDAO(SqlConnection conexao) {
		this.conexao = conexao;
	}

	public PedidoDAO(SqlConnection conexao, SqlTransaction tx) {
		this.conexao = conexao;
		this.tx = tx;
	}

	public Boolean InsertIdentity(Pedido pedido) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into pedido (id_cliente,id_funcionario,total) values (@id_cliente,@id_funcionario,@total); select @@identity from pedido";
		comando.Parameters.AddWithValue("@id", pedido.Id);
		comando.Parameters.AddWithValue("@id_cliente", pedido.Id_cliente);
		comando.Parameters.AddWithValue("@id_funcionario", pedido.Id_funcionario);
		comando.Parameters.AddWithValue("@total", pedido.Total);
		decimal n = (decimal) comando.ExecuteScalar();
		pedido.Id = Convert.ToInt32(n);
		return n >= 1;
	}

	public Boolean Insert(Pedido pedido) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into pedido (id,id_cliente,id_funcionario,total) values (@id,@id_cliente,@id_funcionario,@total)";
		comando.Parameters.AddWithValue("@id", pedido.Id);
		comando.Parameters.AddWithValue("@id_cliente", pedido.Id_cliente);
		comando.Parameters.AddWithValue("@id_funcionario", pedido.Id_funcionario);
		comando.Parameters.AddWithValue("@total", pedido.Total);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Update(Pedido pedido) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "update pedido set id_cliente = @id_cliente, id_funcionario = @id_funcionario, total = @total where id = @id";
		comando.Parameters.AddWithValue("@id", pedido.Id);
		comando.Parameters.AddWithValue("@id_cliente", pedido.Id_cliente);
		comando.Parameters.AddWithValue("@id_funcionario", pedido.Id_funcionario);
		comando.Parameters.AddWithValue("@total", pedido.Total);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Delete(Pedido pedido) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "delete from pedido where id = @id";
		comando.Parameters.AddWithValue("@id", pedido.Id);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Delete(Int32 id) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "delete from pedido where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public List<Pedido> ListAll() {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from pedido";
		SqlDataReader reader = comando.ExecuteReader();
		List<Pedido> pedidos = new List<Pedido>();
		while (reader.Read()) {
			Pedido pedido = new Pedido();
			pedido.Id = (Int32) reader["id"];
			pedido.Id_cliente = (Int32) reader["id_cliente"];
			pedido.Id_funcionario = (Int32) reader["id_funcionario"];
			pedido.Total = (Double) reader["total"];
			pedidos.Add(pedido);
		}

		reader.Close();
		return pedidos;

	}

	public Pedido GetById(Int32 id) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from pedido where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		SqlDataReader reader = comando.ExecuteReader();

		Pedido pedido = null;
		if (reader.Read()) {
			pedido = new Pedido();
			pedido.Id = (Int32) reader["id"];
			pedido.Id_cliente = (Int32) reader["id_cliente"];
			pedido.Id_funcionario = (Int32) reader["id_funcionario"];
			pedido.Total = (Double) reader["total"];
		}

		reader.Close();
		return pedido;

	}
}
}