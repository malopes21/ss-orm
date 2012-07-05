import java.sql.*;

public class TelefoneDAO {

	private Connection conexao;

	public TelefoneDAO(Connection conexao) {
		this.conexao = conexao;
	}
}