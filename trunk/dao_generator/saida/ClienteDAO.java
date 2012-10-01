import java.sql.*;
import java.util.*;

public class ClienteDAO {

	private Connection conexao;

	public ClienteDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Cliente cliente) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("insert into Cliente (id,nome,endereco,cpf) values (?, ?, ?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, cliente.getId());
		stmt.setString(2, cliente.getNome());
		stmt.setString(3, cliente.getEndereco());
		stmt.setString(4, cliente.getCpf());
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs != null && rs.next()) {
			cliente.setId(rs.getInt(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Cliente cliente) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("update Cliente set nome = ?, endereco = ?, cpf = ? where id = ? ");
		stmt.setString(1, cliente.getNome());
		stmt.setString(2, cliente.getEndereco());
		stmt.setString(3, cliente.getCpf());
		stmt.setInt(4, cliente.getId());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Cliente cliente) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("delete from Cliente where id = ? ");
		stmt.setInt(1, cliente.getId());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Cliente> listAll() throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from Cliente ");
		ResultSet rs = stmt.executeQuery();

		List<Cliente> clientes = null;
		while (rs.next()) {
			clientes = new ArrayList<Cliente>();
			Cliente cliente = new Cliente();
			cliente.setId(rs.getInt(1));
			cliente.setNome(rs.getString(2));
			cliente.setEndereco(rs.getString(3));
			cliente.setCpf(rs.getString(4));
			clientes.add(cliente);
		}

		rs.close();
		stmt.close();
		return clientes;

	}

	public Cliente getById(Integer id) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from Cliente where id = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();

		Cliente cliente = null;
		if (rs.next()) {
			cliente = new Cliente();
			cliente.setId(rs.getInt(1));
			cliente.setNome(rs.getString(2));
			cliente.setEndereco(rs.getString(3));
			cliente.setCpf(rs.getString(4));
		}

		rs.close();
		stmt.close();
		return cliente;

	}
}