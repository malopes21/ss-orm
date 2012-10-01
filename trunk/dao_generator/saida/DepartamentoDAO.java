import java.sql.*;
import java.util.*;

public class DepartamentoDAO {

	private Connection conexao;

	public DepartamentoDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Departamento departamento) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("insert into departamento (num_dept,nome_dept) values (?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, departamento.getNum_dept());
		stmt.setString(2, departamento.getNome_dept());
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs != null && rs.next()) {
			departamento.setNum_dept(rs.getInt(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Departamento departamento) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("update departamento set nome_dept = ? where num_dept = ? ");
		stmt.setString(1, departamento.getNome_dept());
		stmt.setInt(2, departamento.getNum_dept());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Departamento departamento) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("delete from departamento where num_dept = ? ");
		stmt.setInt(1, departamento.getNum_dept());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Departamento> listAll() throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from departamento ");
		ResultSet rs = stmt.executeQuery();

		List<Departamento> departamentos = null;
		while (rs.next()) {
			departamentos = new ArrayList<Departamento>();
			Departamento departamento = new Departamento();
			departamento.setNum_dept(rs.getInt(1));
			departamento.setNome_dept(rs.getString(2));
			departamentos.add(departamento);
		}

		rs.close();
		stmt.close();
		return departamentos;

	}

	public Departamento getById(Integer id) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from departamento where num_dept = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();

		Departamento departamento = null;
		if (rs.next()) {
			departamento = new Departamento();
			departamento.setNum_dept(rs.getInt(1));
			departamento.setNome_dept(rs.getString(2));
		}

		rs.close();
		stmt.close();
		return departamento;

	}
}