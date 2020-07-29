package bom.blazon.migracao.tasks.loading;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

public class CreateTaskData {

	public static void create(Map<String, Object> taskData, Connection conn) throws ClassNotFoundException, SQLException {

		String sql = "INSERT INTO blazon.TaskData (id, value, name) VALUES(?, ?, ?);";

		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setLong(1, (Long) taskData.get("taskId"));
		stmt.setObject(2, taskData.get("value"));
		stmt.setString(3, (String) taskData.get("name"));

		stmt.execute();
		
		stmt.close();

	}

}