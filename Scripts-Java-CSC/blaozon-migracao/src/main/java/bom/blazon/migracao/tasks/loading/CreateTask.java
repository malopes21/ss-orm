package bom.blazon.migracao.tasks.loading;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Map;

public class CreateTask {
	
	public static Long create(Map<String, Object> task, Connection conn) throws ClassNotFoundException, SQLException {
		
		String sql = "INSERT INTO blazon.Task " + 
				"(id, "
				+ "actionId, "
				+ "cancelIfSlaReached, "
				+ "category, "
				+ "createdBy, "
				+ "createdByObjectId, "
				+ "createdDate, "
				+ "deadline, "
				+ "lastAutoEscalationCheckDate, "
				+ "lastPolicyEscalationCheckDate, "
				+ "lockDate, "
				+ "lockNumber, "
				+ "notificationCount, "
				+ "priority, "
				+ "resolvedDate, "
				+ "`result`, "
				+ "status, "
				+ "workflowId, "
				+ "currentQueue_id, "
				+ "definition_id, "
				+ "recipient_id, "
				+ "requester_id) " + 
				"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		
		PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		
		stmt.setLong(1, (Long) task.get("id"));
		stmt.setObject(2, task.get("actionId"));
		stmt.setBoolean(3, task.get("cancelIfSlaReached") != null ? (Boolean) task.get("cancelIfSlaReached") : false);
		stmt.setString(4, (String) task.get("category"));
		stmt.setString(5, (String) task.get("createdBy"));
		stmt.setString(6, (String) task.get("createdByObjectId"));
		stmt.setDate(7, new java.sql.Date(((Date) task.get("createdDate")).getTime()));
		stmt.setDate(8, new java.sql.Date(((Date) task.get("deadline")).getTime()));
		stmt.setDate(9, task.get("lastAutoEscalationCheckDate") != null ? new java.sql.Date(((Date) task.get("lastAutoEscalationCheckDate")).getTime()) : null);
		stmt.setDate(10, task.get("lastPolicyEscalationCheckDate") != null ? new java.sql.Date(((Date) task.get("lastPolicyEscalationCheckDate")).getTime()) : null);
		stmt.setDate(11, task.get("lockDate") != null ? new java.sql.Date(((Date) task.get("lockDate")).getTime()) : null);
		stmt.setObject(12, task.get("lockNumber") != null ? (Long) task.get("lockNumber") : null);
		stmt.setObject(13, task.get("notificationCount"));
		stmt.setString(14, (String) task.get("priority"));
		stmt.setDate(15, task.get("resolvedDate") != null ? new java.sql.Date(((Date) task.get("resolvedDate")).getTime()) : null);
		stmt.setString(16, task.get("result") != null ? (String) task.get("result") : null);
		stmt.setString(17, (String) task.get("status"));
		stmt.setObject(18, task.get("workflowId"));
		stmt.setObject(19, task.get("currentQueue_id"));
		stmt.setObject(20, TaskDefinitionMapper.get(task.get("definition_id").toString()));
		stmt.setObject(20, 1);
		stmt.setObject(21, task.get("recipient_id"));
		stmt.setObject(22, task.get("requester_id"));
		
		stmt.execute();
		
		ResultSet result = stmt.getGeneratedKeys();

		result.next();
		
		Long id = result.getLong(1);
		
		stmt.close();
		
		return id;
			
	}

}
