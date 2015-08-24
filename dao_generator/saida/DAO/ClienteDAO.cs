using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Entidade;

namespace DAO {


public class ClienteDAO {

	private SqlConnection conexao;
	private SqlTransaction tx;

	public ClienteDAO(SqlConnection conexao) {
		this.conexao = conexao;
	}

	public ClienteDAO(SqlConnection conexao, SqlTransaction tx) {
		this.conexao = conexao;
		this.tx = tx;
	}

	public Boolean InsertIdentity(Cliente cliente) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into cliente (nome,endereco,telefone) values (@nome,@endereco,@telefone); select @@identity from cliente";
		comando.Parameters.AddWithValue("@id", cliente.Id);
		comando.Parameters.AddWithValue("@nome", cliente.Nome);
		comando.Parameters.AddWithValue("@endereco", cliente.Endereco);
		comando.Parameters.AddWithValue("@telefone", cliente.Telefone);
		decimal n = (decimal) comando.ExecuteScalar();
		cliente.Id = Convert.ToInt32(n);
		return n >= 1;
	}

	public Boolean Insert(Cliente cliente) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into cliente (id,nome,endereco,telefone) values (@id,@nome,@endereco,@telefone)";
		comando.Parameters.AddWithValue("@id", cliente.Id);
		comando.Parameters.AddWithValue("@nome", cliente.Nome);
		comando.Parameters.AddWithValue("@endereco", cliente.Endereco);
		comando.Parameters.AddWithValue("@telefone", cliente.Telefone);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Update(Cliente cliente) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "update cliente set nome = @nome, endereco = @endereco, telefone = @telefone where id = @id";
		comando.Parameters.AddWithValue("@id", cliente.Id);
		comando.Parameters.AddWithValue("@nome", cliente.Nome);
		comando.Parameters.AddWithValue("@endereco", cliente.Endereco);
		comando.Parameters.AddWithValue("@telefone", cliente.Telefone);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Delete(Cliente cliente) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "delete from cliente where id = @id";
		comando.Parameters.AddWithValue("@id", cliente.Id);
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
		comando.CommandText = "delete from cliente where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public List<Cliente> ListAll() {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from cliente";
		SqlDataReader reader = comando.ExecuteReader();
		List<Cliente> clientes = new List<Cliente>();
		while (reader.Read()) {
			Cliente cliente = new Cliente();
			cliente.Id = (Int32) reader["id"];
			cliente.Nome = (String) reader["nome"];
			cliente.Endereco = (String) reader["endereco"];
			cliente.Telefone = (String) reader["telefone"];
			clientes.Add(cliente);
		}

		reader.Close();
		return clientes;

	}

	public Cliente GetById(Int32 id) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from cliente where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		SqlDataReader reader = comando.ExecuteReader();

		Cliente cliente = null;
		if (reader.Read()) {
			cliente = new Cliente();
			cliente.Id = (Int32) reader["id"];
			cliente.Nome = (String) reader["nome"];
			cliente.Endereco = (String) reader["endereco"];
			cliente.Telefone = (String) reader["telefone"];
		}

		reader.Close();
		return cliente;

	}
}
}