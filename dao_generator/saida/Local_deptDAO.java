import java.sql.*;
import java.util.*;

public class Local_deptDAO {

	private Connection conexao;

	public Local_deptDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Local_dept local_dept) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("insert into local_dept (num_dept,cod_local) values (?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, local_dept.getNum_dept());
		stmt.setInt(2, local_dept.getCod_local());
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs != null && rs.next()) {
			local_dept.setNum_dept(rs.getInt(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Local_dept local_dept) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("update local_dept set cod_local = ? where num_dept = ? ");
		stmt.setInt(1, local_dept.getCod_local());
		stmt.setInt(2, local_dept.getNum_dept());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Local_dept local_dept) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("delete from local_dept where num_dept = ? ");
		stmt.setInt(1, local_dept.getNum_dept());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Local_dept> listAll() throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from local_dept ");
		ResultSet rs = stmt.executeQuery();

		List<Local_dept> local_depts = null;
		while (rs.next()) {
			local_depts = new ArrayList<Local_dept>();
			Local_dept local_dept = new Local_dept();
			local_dept.setNum_dept(rs.getInt(1));
			local_dept.setCod_local(rs.getInt(2));
			local_depts.add(local_dept);
		}

		rs.close();
		stmt.close();
		return local_depts;

	}

	public Local_dept getById(Integer id) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from local_dept where num_dept = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();

		Local_dept local_dept = null;
		if (rs.next()) {
			local_dept = new Local_dept();
			local_dept.setNum_dept(rs.getInt(1));
			local_dept.setCod_local(rs.getInt(2));
		}

		rs.close();
		stmt.close();
		return local_dept;

	}
}