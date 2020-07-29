package bom.blazon.migracao.tasks.loading;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;

public class CreateTaskComment {

	public static void create(Map<String, Object> comment, Connection conn) throws ClassNotFoundException, SQLException {

		String sql = "INSERT INTO blazon.TaskComment (id, comment, date, task_id, user_id) VALUES (?, ?, ?, ?, ?);";

		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setLong(1, (Long) comment.get("id"));
		stmt.setString(2, (String) comment.get("comment"));
		stmt.setDate(3, new java.sql.Date(((Date) comment.get("date")).getTime()));
		stmt.setLong(4, (Long) comment.get("task_id"));
		stmt.setLong(5, (Long) comment.get("user_id"));

		stmt.execute();
		
		stmt.close();

	}
}
