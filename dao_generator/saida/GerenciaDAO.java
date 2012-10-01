import java.sql.*;
import java.util.*;

public class GerenciaDAO {

	private Connection conexao;

	public GerenciaDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Gerencia gerencia) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("insert into gerencia (cod_emp,num_dept,data_emp) values (?, ?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, gerencia.getCod_emp());
		stmt.setInt(2, gerencia.getNum_dept());
		stmt.setDate(3, new java.sql.Date(gerencia.getData_emp().getTime()));
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs != null && rs.next()) {
			gerencia.setCod_emp(rs.getInt(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Gerencia gerencia) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("update gerencia set num_dept = ?, data_emp = ? where cod_emp = ? ");
		stmt.setInt(1, gerencia.getNum_dept());
		stmt.setDate(2, new java.sql.Date(gerencia.getData_emp().getTime()));
		stmt.setInt(3, gerencia.getCod_emp());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Gerencia gerencia) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("delete from gerencia where cod_emp = ? ");
		stmt.setInt(1, gerencia.getCod_emp());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Gerencia> listAll() throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from gerencia ");
		ResultSet rs = stmt.executeQuery();

		List<Gerencia> gerencias = null;
		while (rs.next()) {
			gerencias = new ArrayList<Gerencia>();
			Gerencia gerencia = new Gerencia();
			gerencia.setCod_emp(rs.getInt(1));
			gerencia.setNum_dept(rs.getInt(2));
			gerencia.setData_emp(rs.getDate(3));
			gerencias.add(gerencia);
		}

		rs.close();
		stmt.close();
		return gerencias;

	}

	public Gerencia getById(Integer id) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from gerencia where cod_emp = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();

		Gerencia gerencia = null;
		if (rs.next()) {
			gerencia = new Gerencia();
			gerencia.setCod_emp(rs.getInt(1));
			gerencia.setNum_dept(rs.getInt(2));
			gerencia.setData_emp(rs.getDate(3));
		}

		rs.close();
		stmt.close();
		return gerencia;

	}
}