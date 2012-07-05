import java.sql.*;

public class ClienteDAO {

	private Connection conexao;

	public ClienteDAO(Connection conexao) {
		this.conexao = conexao;
	}
}