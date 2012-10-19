import java.sql.*;
import java.util.*;

public class Proj_empDAO {

	private Connection conexao;

	public Proj_empDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Proj_emp proj_emp) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("insert into proj_emp (num_proj,cod_emp,quant_horas) values (?, ?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, proj_emp.getNum_proj());
		stmt.setInt(2, proj_emp.getCod_emp());
		stmt.setInt(3, proj_emp.getQuant_horas());
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs != null && rs.next()) {
			proj_emp.setNum_proj(rs.getInt(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Proj_emp proj_emp) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("update proj_emp set cod_emp = ?, quant_horas = ? where num_proj = ? ");
		stmt.setInt(1, proj_emp.getCod_emp());
		stmt.setInt(2, proj_emp.getQuant_horas());
		stmt.setInt(3, proj_emp.getNum_proj());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Proj_emp proj_emp) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("delete from proj_emp where num_proj = ? ");
		stmt.setInt(1, proj_emp.getNum_proj());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Proj_emp> listAll() throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from proj_emp ");
		ResultSet rs = stmt.executeQuery();

		List<Proj_emp> proj_emps = new ArrayList<Proj_emp>();
		while (rs.next()) {
			Proj_emp proj_emp = new Proj_emp();
			proj_emp.setNum_proj(rs.getInt(1));
			proj_emp.setCod_emp(rs.getInt(2));
			proj_emp.setQuant_horas(rs.getInt(3));
			proj_emps.add(proj_emp);
		}

		rs.close();
		stmt.close();
		return proj_emps;

	}

	public Proj_emp getById(Integer id) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from proj_emp where num_proj = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();

		Proj_emp proj_emp = null;
		if (rs.next()) {
			proj_emp = new Proj_emp();
			proj_emp.setNum_proj(rs.getInt(1));
			proj_emp.setCod_emp(rs.getInt(2));
			proj_emp.setQuant_horas(rs.getInt(3));
		}

		rs.close();
		stmt.close();
		return proj_emp;

	}
}