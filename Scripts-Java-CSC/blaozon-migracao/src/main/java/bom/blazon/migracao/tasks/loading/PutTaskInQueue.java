package bom.blazon.migracao.tasks.loading;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

public class PutTaskInQueue {

	public static void create(Map<String, Object> message, Connection conn) throws ClassNotFoundException, SQLException {

		String sql = "INSERT INTO blazon.TaskQueue_Task (TaskQueue_id, tasks_id) VALUES(?, ?);";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setLong(1, (Long) message.get("TaskQueue_id"));
		stmt.setLong(2, (Long) message.get("tasks_id"));

		stmt.execute();
		
		stmt.close();

	}

}
