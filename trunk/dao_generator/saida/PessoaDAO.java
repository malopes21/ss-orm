import java.sql.*;
import java.util.*;

public class PessoaDAO {

	private Connection conexao;

	public PessoaDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Pessoa pessoa) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("insert into Pessoa (id,nome,telefone) values (?, ?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, pessoa.getId());
		stmt.setString(2, pessoa.getNome());
		stmt.setString(3, pessoa.getTelefone());
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs != null && rs.next()) {
			pessoa.setId(rs.getInt(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Pessoa pessoa) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("update Pessoa set nome = ?, telefone = ? where id = ? ");
		stmt.setString(1, pessoa.getNome());
		stmt.setString(2, pessoa.getTelefone());
		stmt.setInt(3, pessoa.getId());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Pessoa pessoa) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("delete from Pessoa where id = ? ");
		stmt.setInt(1, pessoa.getId());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Pessoa> listAll() throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from Pessoa ");
		ResultSet rs = stmt.executeQuery();

		List<Pessoa> pessoas = new ArrayList<Pessoa>();
		while (rs.next()) {
			Pessoa pessoa = new Pessoa();
			pessoa.setId(rs.getInt(1));
			pessoa.setNome(rs.getString(2));
			pessoa.setTelefone(rs.getString(3));
			pessoas.add(pessoa);
		}

		rs.close();
		stmt.close();
		return pessoas;

	}

	public Pessoa getById(Integer id) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from Pessoa where id = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();

		Pessoa pessoa = null;
		if (rs.next()) {
			pessoa = new Pessoa();
			pessoa.setId(rs.getInt(1));
			pessoa.setNome(rs.getString(2));
			pessoa.setTelefone(rs.getString(3));
		}

		rs.close();
		stmt.close();
		return pessoa;

	}
}