using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Entidade;

namespace DAO {


public class CargoDAO {

	private SqlConnection conexao;
	private SqlTransaction tx;

	public CargoDAO(SqlConnection conexao) {
		this.conexao = conexao;
	}

	public CargoDAO(SqlConnection conexao, SqlTransaction tx) {
		this.conexao = conexao;
		this.tx = tx;
	}

	public Boolean InsertIdentity(Cargo cargo) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into cargo (nome) values (@nome); select @@identity from cargo";
		comando.Parameters.AddWithValue("@id", cargo.Id);
		comando.Parameters.AddWithValue("@nome", cargo.Nome);
		decimal n = (decimal) comando.ExecuteScalar();
		cargo.Id = Convert.ToInt32(n);
		return n >= 1;
	}

	public Boolean Insert(Cargo cargo) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into cargo (id,nome) values (@id,@nome)";
		comando.Parameters.AddWithValue("@id", cargo.Id);
		comando.Parameters.AddWithValue("@nome", cargo.Nome);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Update(Cargo cargo) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "update cargo set nome = @nome where id = @id";
		comando.Parameters.AddWithValue("@id", cargo.Id);
		comando.Parameters.AddWithValue("@nome", cargo.Nome);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Delete(Cargo cargo) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "delete from cargo where id = @id";
		comando.Parameters.AddWithValue("@id", cargo.Id);
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
		comando.CommandText = "delete from cargo where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public List<Cargo> ListAll() {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from cargo";
		SqlDataReader reader = comando.ExecuteReader();
		List<Cargo> cargos = new List<Cargo>();
		while (reader.Read()) {
			Cargo cargo = new Cargo();
			cargo.Id = (Int32) reader["id"];
			cargo.Nome = (String) reader["nome"];
			cargos.Add(cargo);
		}

		reader.Close();
		return cargos;

	}

	public Cargo GetById(Int32 id) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from cargo where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		SqlDataReader reader = comando.ExecuteReader();

		Cargo cargo = null;
		if (reader.Read()) {
			cargo = new Cargo();
			cargo.Id = (Int32) reader["id"];
			cargo.Nome = (String) reader["nome"];
		}

		reader.Close();
		return cargo;

	}
}
}