package bom.blazon.migracao.tasks.extract;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReadTasksInQueue {
	
	public static List<Map<String, Object>> read(Integer page, Integer size, Connection conn) throws SQLException {
		
		List<Map<String, Object>> result = new ArrayList<>();

		String sql = "SELECT TaskQueue_id, tasks_id FROM blazoniam.TaskQueue_Task;";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			
			Map<String, Object> relation = new HashMap<String, Object>();
			
			relation.put("TaskQueue_id", rs.getLong("TaskQueue_id"));
			relation.put("tasks_id", rs.getLong("tasks_id"));
			
			result.add(relation);
			
		}
		
		return result;
		
	}

}