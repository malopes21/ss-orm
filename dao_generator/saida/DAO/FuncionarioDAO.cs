using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Entidade;

namespace DAO {


public class FuncionarioDAO {

	private SqlConnection conexao;
	private SqlTransaction tx;

	public FuncionarioDAO(SqlConnection conexao) {
		this.conexao = conexao;
	}

	public FuncionarioDAO(SqlConnection conexao, SqlTransaction tx) {
		this.conexao = conexao;
		this.tx = tx;
	}

	public Boolean InsertIdentity(Funcionario funcionario) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into funcionario (nome,matricula,salario,id_cargo) values (@nome,@matricula,@salario,@id_cargo); select @@identity from funcionario";
		comando.Parameters.AddWithValue("@id", funcionario.Id);
		comando.Parameters.AddWithValue("@nome", funcionario.Nome);
		comando.Parameters.AddWithValue("@matricula", funcionario.Matricula);
		comando.Parameters.AddWithValue("@salario", funcionario.Salario);
		comando.Parameters.AddWithValue("@id_cargo", funcionario.Id_cargo);
		decimal n = (decimal) comando.ExecuteScalar();
		funcionario.Id = Convert.ToInt32(n);
		return n >= 1;
	}

	public Boolean Insert(Funcionario funcionario) {
		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "insert into funcionario (id,nome,matricula,salario,id_cargo) values (@id,@nome,@matricula,@salario,@id_cargo)";
		comando.Parameters.AddWithValue("@id", funcionario.Id);
		comando.Parameters.AddWithValue("@nome", funcionario.Nome);
		comando.Parameters.AddWithValue("@matricula", funcionario.Matricula);
		comando.Parameters.AddWithValue("@salario", funcionario.Salario);
		comando.Parameters.AddWithValue("@id_cargo", funcionario.Id_cargo);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Update(Funcionario funcionario) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "update funcionario set nome = @nome, matricula = @matricula, salario = @salario, id_cargo = @id_cargo where id = @id";
		comando.Parameters.AddWithValue("@id", funcionario.Id);
		comando.Parameters.AddWithValue("@nome", funcionario.Nome);
		comando.Parameters.AddWithValue("@matricula", funcionario.Matricula);
		comando.Parameters.AddWithValue("@salario", funcionario.Salario);
		comando.Parameters.AddWithValue("@id_cargo", funcionario.Id_cargo);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public Boolean Delete(Funcionario funcionario) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "delete from funcionario where id = @id";
		comando.Parameters.AddWithValue("@id", funcionario.Id);
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
		comando.CommandText = "delete from funcionario where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		int n = comando.ExecuteNonQuery();
		return n >= 1;
	}

	public List<Funcionario> ListAll() {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from funcionario";
		SqlDataReader reader = comando.ExecuteReader();
		List<Funcionario> funcionarios = new List<Funcionario>();
		while (reader.Read()) {
			Funcionario funcionario = new Funcionario();
			funcionario.Id = (Int32) reader["id"];
			funcionario.Nome = (String) reader["nome"];
			funcionario.Matricula = (String) reader["matricula"];
			funcionario.Salario = (Double) reader["salario"];
			funcionario.Id_cargo = (Int32) reader["id_cargo"];
			funcionarios.Add(funcionario);
		}

		reader.Close();
		return funcionarios;

	}

	public Funcionario GetById(Int32 id) {

		SqlCommand comando = new SqlCommand();
		comando.Connection = conexao;
		comando.CommandType = System.Data.CommandType.Text;
		if(tx != null) {
			comando.Transaction = tx;
		}
		comando.CommandText = "select * from funcionario where id = @id";
		comando.Parameters.AddWithValue("@id", id);
		SqlDataReader reader = comando.ExecuteReader();

		Funcionario funcionario = null;
		if (reader.Read()) {
			funcionario = new Funcionario();
			funcionario.Id = (Int32) reader["id"];
			funcionario.Nome = (String) reader["nome"];
			funcionario.Matricula = (String) reader["matricula"];
			funcionario.Salario = (Double) reader["salario"];
			funcionario.Id_cargo = (Int32) reader["id_cargo"];
		}

		reader.Close();
		return funcionario;

	}
}
}