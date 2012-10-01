import java.sql.*;
import java.util.*;

public class EmpregadoDAO {

	private Connection conexao;

	public EmpregadoDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Empregado empregado) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("insert into empregado (cod_emp,nome_emp,end_emp,sexo_emp,data_nasc,cod_gerente,num_dept) values (?, ?, ?, ?, ?, ?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, empregado.getCod_emp());
		stmt.setString(2, empregado.getNome_emp());
		stmt.setString(3, empregado.getEnd_emp());
		stmt.setString(4, empregado.getSexo_emp());
		stmt.setString(5, empregado.getData_nasc());
		stmt.setInt(6, empregado.getCod_gerente());
		stmt.setInt(7, empregado.getNum_dept());
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs != null && rs.next()) {
			empregado.setCod_emp(rs.getInt(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Empregado empregado) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("update empregado set nome_emp = ?, end_emp = ?, sexo_emp = ?, data_nasc = ?, cod_gerente = ?, num_dept = ? where cod_emp = ? ");
		stmt.setString(1, empregado.getNome_emp());
		stmt.setString(2, empregado.getEnd_emp());
		stmt.setString(3, empregado.getSexo_emp());
		stmt.setString(4, empregado.getData_nasc());
		stmt.setInt(5, empregado.getCod_gerente());
		stmt.setInt(6, empregado.getNum_dept());
		stmt.setInt(7, empregado.getCod_emp());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Empregado empregado) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("delete from empregado where cod_emp = ? ");
		stmt.setInt(1, empregado.getCod_emp());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Empregado> listAll() throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from empregado ");
		ResultSet rs = stmt.executeQuery();

		List<Empregado> empregados = null;
		while (rs.next()) {
			empregados = new ArrayList<Empregado>();
			Empregado empregado = new Empregado();
			empregado.setCod_emp(rs.getInt(1));
			empregado.setNome_emp(rs.getString(2));
			empregado.setEnd_emp(rs.getString(3));
			empregado.setSexo_emp(rs.getString(4));
			empregado.setData_nasc(rs.getString(5));
			empregado.setCod_gerente(rs.getInt(6));
			empregado.setNum_dept(rs.getInt(7));
			empregados.add(empregado);
		}

		rs.close();
		stmt.close();
		return empregados;

	}

	public Empregado getById(Integer id) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from empregado where cod_emp = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();

		Empregado empregado = null;
		if (rs.next()) {
			empregado = new Empregado();
			empregado.setCod_emp(rs.getInt(1));
			empregado.setNome_emp(rs.getString(2));
			empregado.setEnd_emp(rs.getString(3));
			empregado.setSexo_emp(rs.getString(4));
			empregado.setData_nasc(rs.getString(5));
			empregado.setCod_gerente(rs.getInt(6));
			empregado.setNum_dept(rs.getInt(7));
		}

		rs.close();
		stmt.close();
		return empregado;

	}
}