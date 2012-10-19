import java.sql.*;
import java.util.*;

public class DependenteDAO {

	private Connection conexao;

	public DependenteDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Dependente dependente) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("insert into dependente (cod_emp,cod_depend,nome_depend,sexo_depend,tipo_depend,data_nasc) values (?, ?, ?, ?, ?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, dependente.getCod_emp());
		stmt.setInt(2, dependente.getCod_depend());
		stmt.setString(3, dependente.getNome_depend());
		stmt.setString(4, dependente.getSexo_depend());
		stmt.setString(5, dependente.getTipo_depend());
		stmt.setDate(6, new java.sql.Date(dependente.getData_nasc().getTime()));
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs != null && rs.next()) {
			dependente.setCod_emp(rs.getInt(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Dependente dependente) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("update dependente set cod_depend = ?, nome_depend = ?, sexo_depend = ?, tipo_depend = ?, data_nasc = ? where cod_emp = ? ");
		stmt.setInt(1, dependente.getCod_depend());
		stmt.setString(2, dependente.getNome_depend());
		stmt.setString(3, dependente.getSexo_depend());
		stmt.setString(4, dependente.getTipo_depend());
		stmt.setDate(5, new java.sql.Date(dependente.getData_nasc().getTime()));
		stmt.setInt(6, dependente.getCod_emp());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Dependente dependente) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("delete from dependente where cod_emp = ? ");
		stmt.setInt(1, dependente.getCod_emp());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Dependente> listAll() throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from dependente ");
		ResultSet rs = stmt.executeQuery();

		List<Dependente> dependentes = new ArrayList<Dependente>();
		while (rs.next()) {
			Dependente dependente = new Dependente();
			dependente.setCod_emp(rs.getInt(1));
			dependente.setCod_depend(rs.getInt(2));
			dependente.setNome_depend(rs.getString(3));
			dependente.setSexo_depend(rs.getString(4));
			dependente.setTipo_depend(rs.getString(5));
			dependente.setData_nasc(rs.getDate(6));
			dependentes.add(dependente);
		}

		rs.close();
		stmt.close();
		return dependentes;

	}

	public Dependente getById(Integer id) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from dependente where cod_emp = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();

		Dependente dependente = null;
		if (rs.next()) {
			dependente = new Dependente();
			dependente.setCod_emp(rs.getInt(1));
			dependente.setCod_depend(rs.getInt(2));
			dependente.setNome_depend(rs.getString(3));
			dependente.setSexo_depend(rs.getString(4));
			dependente.setTipo_depend(rs.getString(5));
			dependente.setData_nasc(rs.getDate(6));
		}

		rs.close();
		stmt.close();
		return dependente;

	}
}