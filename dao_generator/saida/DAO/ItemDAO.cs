using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Entidade;

namespace DAO {


public class ItemDAO {

	private SqlConnection conexao;
	private SqlTransaction tx;

	public ItemDAO(SqlConnection conexao) {
		this.conexao = conexao;
	}

	public ItemDAO(SqlConnection conexao, SqlTransaction tx) {
		this.conexao = conexao;
		this.tx = tx;
	}

	public Boolean InsertIdentity(Item item) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into item (id_pedido,id_produto,quantidade) values (@id_pedido,@id_produto,@quantidade); select @@identity from item";
		comando.Parameters.AddWithValue("@id", item.Id);
		comando.Parameters.AddWithValue("@id_pedido", item.Id_pedido);
		comando.Parameters.AddWithValue("@id_produto", item.Id_produto);
		comando.Parameters.AddWithValue("@quantidade", item.Quantidade);
		decimal n = (decimal) comando.ExecuteScalar();
		item.Id = Convert.ToInt32(n);
		return n >= 1;
	}

	public Boolean Insert(Item item) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into item (id,id_pedido,id_produto,quantidade) values (@id,@id_pedido,@id_produto,@quantidade)";
		comando.Parameters.AddWithValue("@id", item.Id);
		comando.Parameters.AddWithValue("@id_pedido", item.Id_pedido);
		comando.Parameters.AddWithValue("@id_produto", item.Id_produto);
		comando.Parameters.AddWithValue("@quantidade", item.Quantidade);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Update(Item item) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "update item set id_pedido = @id_pedido, id_produto = @id_produto, quantidade = @quantidade where id = @id";
		comando.Parameters.AddWithValue("@id", item.Id);
		comando.Parameters.AddWithValue("@id_pedido", item.Id_pedido);
		comando.Parameters.AddWithValue("@id_produto", item.Id_produto);
		comando.Parameters.AddWithValue("@quantidade", item.Quantidade);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Delete(Item item) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "delete from item where id = @id";
		comando.Parameters.AddWithValue("@id", item.Id);
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
		comando.CommandText = "delete from item where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public List<Item> ListAll() {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from item";
		SqlDataReader reader = comando.ExecuteReader();
		List<Item> items = new List<Item>();
		while (reader.Read()) {
			Item item = new Item();
			item.Id = (Int32) reader["id"];
			item.Id_pedido = (Int32) reader["id_pedido"];
			item.Id_produto = (Int32) reader["id_produto"];
			item.Quantidade = (Double) reader["quantidade"];
			items.Add(item);
		}

		reader.Close();
		return items;

	}

	public Item GetById(Int32 id) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from item where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		SqlDataReader reader = comando.ExecuteReader();

		Item item = null;
		if (reader.Read()) {
			item = new Item();
			item.Id = (Int32) reader["id"];
			item.Id_pedido = (Int32) reader["id_pedido"];
			item.Id_produto = (Int32) reader["id_produto"];
			item.Quantidade = (Double) reader["quantidade"];
		}

		reader.Close();
		return item;

	}
}
}