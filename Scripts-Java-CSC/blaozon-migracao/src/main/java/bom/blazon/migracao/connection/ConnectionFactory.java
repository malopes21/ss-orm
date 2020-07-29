package bom.blazon.migracao.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

	public static Connection getConnection(String address, String port, String database, String username, String password) throws Exception {
		
		String url = "jdbc:mysql://{0}:{1}/{2}";
		
		url = url.replace("{0}", address).replace("{1}", port).replace("{2}", database);
		
		Connection conn = DriverManager.getConnection(url, username, password);

		if (conn != null) {

			conn.setAutoCommit(false);
			return conn;
		} else {
			throw new RuntimeException("Failed to make connection!");
		}
	}
}
