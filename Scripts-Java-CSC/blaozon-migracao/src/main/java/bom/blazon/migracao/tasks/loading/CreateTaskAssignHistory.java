package bom.blazon.migracao.tasks.loading;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;

public class CreateTaskAssignHistory {

	public static void create(Map<String, Object> assignHistory, Connection conn) throws ClassNotFoundException, SQLException {

		String sql = "INSERT INTO blazon.TaskAssignHistory (id, assign_date, from_id, task_id, to_id) VALUES(?, ?, ?, ?, ?);";

		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setLong(1, (Long) assignHistory.get("id"));
		stmt.setDate(2, new java.sql.Date(((Date) assignHistory.get("assign_date")).getTime()));
		stmt.setObject(3, assignHistory.get("from_id"));
		stmt.setLong(4, (Long) assignHistory.get("task_id"));
		stmt.setLong(5, (Long) assignHistory.get("to_id"));

		stmt.execute();
		
		stmt.close();

	}

}
