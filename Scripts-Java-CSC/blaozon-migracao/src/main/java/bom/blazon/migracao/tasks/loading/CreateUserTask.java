package bom.blazon.migracao.tasks.loading;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

public class CreateUserTask {

	public static Long create(Map<String, Object> userTask, Connection conn) throws ClassNotFoundException, SQLException {

		String sql = "INSERT INTO blazon.UserTask (directoryIdentifier, displayName, username) VALUES(?, ?, ?);";

		PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

		stmt.setLong(1, (Long) userTask.get("directoryIdentifier"));
		stmt.setString(2, (String) userTask.get("displayName"));
		stmt.setString(3, (String) userTask.get("username"));

		stmt.execute();
		
		ResultSet result = stmt.getGeneratedKeys();

		result.next();
		
		Long id = result.getLong(1);
		
		stmt.close();
		
		return id;

	}

}
