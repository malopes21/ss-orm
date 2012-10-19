import java.sql.*;
import java.util.*;

public class LocalDAO {

	private Connection conexao;

	public LocalDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Local local) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("insert into local (cod_local,desc_local) values (?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, local.getCod_local());
		stmt.setString(2, local.getDesc_local());
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs != null && rs.next()) {
			local.setCod_local(rs.getInt(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Local local) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("update local set desc_local = ? where cod_local = ? ");
		stmt.setString(1, local.getDesc_local());
		stmt.setInt(2, local.getCod_local());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Local local) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("delete from local where cod_local = ? ");
		stmt.setInt(1, local.getCod_local());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Local> listAll() throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from local ");
		ResultSet rs = stmt.executeQuery();

		List<Local> locals = new ArrayList<Local>();
		while (rs.next()) {
			Local local = new Local();
			local.setCod_local(rs.getInt(1));
			local.setDesc_local(rs.getString(2));
			locals.add(local);
		}

		rs.close();
		stmt.close();
		return locals;

	}

	public Local getById(Integer id) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from local where cod_local = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();

		Local local = null;
		if (rs.next()) {
			local = new Local();
			local.setCod_local(rs.getInt(1));
			local.setDesc_local(rs.getString(2));
		}

		rs.close();
		stmt.close();
		return local;

	}
}