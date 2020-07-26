package blazon.script.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

	public static Connection getSourceConnection() throws Exception {
		
		String url = "jdbc:mysql://localhost:3306/blazoniam?useTimezone=true&serverTimezone=UTC&useSSL=false";
		
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
	
	
	public static Connection getTargetConnection() throws Exception {
		
		String url = "jdbc:mysql://localhost:3306/blazon?useTimezone=true&serverTimezone=UTC&useSSL=false";
		
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
