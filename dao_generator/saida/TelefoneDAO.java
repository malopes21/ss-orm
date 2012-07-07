import java.sql.*;
import java.util.*;

public class TelefoneDAO {

	private Connection conexao;

	public TelefoneDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Telefone telefone) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("insert into Telefone (id,id_cliente,numero) values (?, ?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, telefone.getId());
		stmt.setInt(2, telefone.getId_cliente());
		stmt.setString(3, telefone.getNumero());
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs != null && rs.next()) {
			telefone.setId(rs.getInt(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Telefone telefone) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("update Telefone set id_cliente = ?, numero = ? where id = ? ");
		stmt.setInt(1, telefone.getId_cliente());
		stmt.setString(2, telefone.getNumero());
		stmt.setInt(3, telefone.getId());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Telefone telefone) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("delete from Telefone where id = ? ");
		stmt.setInt(1, telefone.getId());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Telefone> listAll() throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from Telefone ");
		ResultSet rs = stmt.executeQuery();

		List<Telefone> telefones = null;
		while(rs.next()) {
			telefones = new ArrayList<Telefone>();
			Telefone telefone = new Telefone();
			telefone.setId(rs.getInt(1));
			telefone.setId_cliente(rs.getInt(2));
			telefone.setNumero(rs.getString(3));
			telefones.add(telefone);
		}

		rs.close();
		stmt.close();
		return telefones;

	}

	public Telefone getById(Integer id) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from Telefone where id = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();

		Telefone telefone = null;
		if (rs.next()) {
			telefone = new Telefone();
			telefone.setId(rs.getInt(1));
			telefone.setId_cliente(rs.getInt(2));
			telefone.setNumero(rs.getString(3));
		}

		rs.close();
		stmt.close();
		return telefone;

	}
}