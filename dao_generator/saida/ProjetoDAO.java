import java.sql.*;
import java.util.*;

public class ProjetoDAO {

	private Connection conexao;

	public ProjetoDAO(Connection conexao) {
		this.conexao = conexao;
	}

	public boolean insert(Projeto projeto) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("insert into projeto (num_proj,cod_local,num_dept,desc_proj) values (?, ?, ?, ?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, projeto.getNum_proj());
		stmt.setInt(2, projeto.getCod_local());
		stmt.setInt(3, projeto.getNum_dept());
		stmt.setString(4, projeto.getDesc_proj());
		int linhas = stmt.executeUpdate();

		ResultSet rs = stmt.getGeneratedKeys();
		if (rs != null && rs.next()) {
			projeto.setNum_proj(rs.getInt(1));
		}

		rs.close();
		stmt.close();
		return linhas > 0;

	}

	public boolean update(Projeto projeto) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("update projeto set cod_local = ?, num_dept = ?, desc_proj = ? where num_proj = ? ");
		stmt.setInt(1, projeto.getCod_local());
		stmt.setInt(2, projeto.getNum_dept());
		stmt.setString(3, projeto.getDesc_proj());
		stmt.setInt(4, projeto.getNum_proj());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public boolean delete(Projeto projeto) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("delete from projeto where num_proj = ? ");
		stmt.setInt(1, projeto.getNum_proj());
		int linhas = stmt.executeUpdate();

		stmt.close();
		return linhas > 0;

	}

	public List<Projeto> listAll() throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from projeto ");
		ResultSet rs = stmt.executeQuery();

		List<Projeto> projetos = new ArrayList<Projeto>();
		while (rs.next()) {
			Projeto projeto = new Projeto();
			projeto.setNum_proj(rs.getInt(1));
			projeto.setCod_local(rs.getInt(2));
			projeto.setNum_dept(rs.getInt(3));
			projeto.setDesc_proj(rs.getString(4));
			projetos.add(projeto);
		}

		rs.close();
		stmt.close();
		return projetos;

	}

	public Projeto getById(Integer id) throws SQLException {

		PreparedStatement stmt = conexao.prepareStatement("select * from projeto where num_proj = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();

		Projeto projeto = null;
		if (rs.next()) {
			projeto = new Projeto();
			projeto.setNum_proj(rs.getInt(1));
			projeto.setCod_local(rs.getInt(2));
			projeto.setNum_dept(rs.getInt(3));
			projeto.setDesc_proj(rs.getString(4));
		}

		rs.close();
		stmt.close();
		return projeto;

	}
}