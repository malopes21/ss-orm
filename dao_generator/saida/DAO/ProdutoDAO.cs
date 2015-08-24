using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Entidade;

namespace DAO {


public class ProdutoDAO {

	private SqlConnection conexao;
	private SqlTransaction tx;

	public ProdutoDAO(SqlConnection conexao) {
		this.conexao = conexao;
	}

	public ProdutoDAO(SqlConnection conexao, SqlTransaction tx) {
		this.conexao = conexao;
		this.tx = tx;
	}

	public Boolean InsertIdentity(Produto produto) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into produto (descricao,preco) values (@descricao,@preco); select @@identity from produto";
		comando.Parameters.AddWithValue("@id", produto.Id);
		comando.Parameters.AddWithValue("@descricao", produto.Descricao);
		comando.Parameters.AddWithValue("@preco", produto.Preco);
		decimal n = (decimal) comando.ExecuteScalar();
		produto.Id = Convert.ToInt32(n);
		return n >= 1;
	}

	public Boolean Insert(Produto produto) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into produto (id,descricao,preco) values (@id,@descricao,@preco)";
		comando.Parameters.AddWithValue("@id", produto.Id);
		comando.Parameters.AddWithValue("@descricao", produto.Descricao);
		comando.Parameters.AddWithValue("@preco", produto.Preco);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Update(Produto produto) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "update produto set descricao = @descricao, preco = @preco where id = @id";
		comando.Parameters.AddWithValue("@id", produto.Id);
		comando.Parameters.AddWithValue("@descricao", produto.Descricao);
		comando.Parameters.AddWithValue("@preco", produto.Preco);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Delete(Produto produto) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "delete from produto where id = @id";
		comando.Parameters.AddWithValue("@id", produto.Id);
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
		comando.CommandText = "delete from produto where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public List<Produto> ListAll() {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from produto";
		SqlDataReader reader = comando.ExecuteReader();
		List<Produto> produtos = new List<Produto>();
		while (reader.Read()) {
			Produto produto = new Produto();
			produto.Id = (Int32) reader["id"];
			produto.Descricao = (String) reader["descricao"];
			produto.Preco = (Double) reader["preco"];
			produtos.Add(produto);
		}

		reader.Close();
		return produtos;

	}

	public Produto GetById(Int32 id) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from produto where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		SqlDataReader reader = comando.ExecuteReader();

		Produto produto = null;
		if (reader.Read()) {
			produto = new Produto();
			produto.Id = (Int32) reader["id"];
			produto.Descricao = (String) reader["descricao"];
			produto.Preco = (Double) reader["preco"];
		}

		reader.Close();
		return produto;

	}
}
}