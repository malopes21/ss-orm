import java.sql.*;
import java.io.*;
import java.util.*;

public class ClienteDAO {

	private Connection conexao;

	public ClienteDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Cliente cliente) {

		PreparedStatement stmt = conexao.prepareStatement("insert into Cliente (id,nome,endereco) values (?, ?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInteger(1, cliente.getId());
		stmt.setString(2, cliente.getNome());
		stmt.setString(3, cliente.getEndereco());
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if(rs != null && rs.next()) {
			cliente.setId(rs.getInteger(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Cliente cliente) {

		PreparedStatement stmt = conexao.prepareStatement("update Cliente set nome = ?, endereco = ? where id = ? ");
		stmt.setString(1, cliente.getNome());
		stmt.setString(2, cliente.getEndereco());
		stmt.setInteger(3, cliente.getId());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Cliente cliente) {

		PreparedStatement stmt = conexao.prepareStatement("delete from Cliente where id = ? ");
		stmt.setInteger(1, cliente.getId());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Cliente> listAll() {

		PreparedStatement stmt = conexao.prepareStatement("select * from Cliente ");
		ResultSet rs = stmt.executeQuery();

		while(rs.next()) {
			Cliente cliente = new Cliente();
			cliente.setId(rs.getInteger(1));
			cliente.setNome(rs.getString(2));
			cliente.setEndereco(rs.getString(3));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public Cliente getById(Integer id) {

		PreparedStatement stmt = conexao.prepareStatement("select * from Cliente where id = ?");
		stmt.setInteger(1, cliente.getId());
		ResultSet rs = stmt.executeQuery();

		Cliente cliente = null;
		if(rs.next()) {
			cliente = new Cliente();
			cliente.setId(rs.getInteger(1));
			cliente.setNome(rs.getString(2));
			cliente.setEndereco(rs.getString(3));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}
}