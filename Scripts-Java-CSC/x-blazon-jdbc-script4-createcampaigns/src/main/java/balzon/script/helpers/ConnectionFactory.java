package balzon.script.helpers;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

	public static Connection getConnection() throws Exception {
		
		String url = "jdbc:mysql://localhost:3306/blazon";
		
		String user = "root";
		
		String password = "";

		Connection conn = DriverManager.getConnection(url, user, password);

		if (conn != null) {

			conn.setAutoCommit(false);
			return conn;
		} else {
			throw new RuntimeException("Failed to make connection!");
		}
	}
}
