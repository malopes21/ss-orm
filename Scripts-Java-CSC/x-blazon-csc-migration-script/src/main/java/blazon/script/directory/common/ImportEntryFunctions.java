package blazon.script.directory.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

public class ImportEntryFunctions {

	public static void saveEntry(Connection conn, Map<String, Object> row, Long createdById, Long managedById) throws SQLException {

		PreparedStatement statement = null;
		
		String sql = "INSERT INTO Entry \n" + 
				"(id,\n" + 
				"certificatedAt, \n" + 
				"createdAt, \n" + 
				"expireAt, \n" + 
				"modifiedAt, \n" + 
				"risk, \n" + 
				"state, \n" + 
				"provisioningStatus, \n" + 
				"type, \n" + 
				"createdBy_id, \n" + 
				"managedBy_id, \n" + 
				"certifiable, \n" + 
				"visibleToSelfService, \n" + 
				"sodValidatedAt, " +
				"sodVerifiedAt, \n" + 
				"selfServiceSynchronized, \n" + 
				"directoryIndexationSynchronized, \n" + 
				"lastCertificationExecutionDate ) \n" + 
				"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		statement = conn.prepareStatement(sql);
		
		statement.setLong(1, (Long) row.get("id"));
		if(row.get("certificatedAt") != null) statement.setTimestamp(2, (java.sql.Timestamp) row.get("certificatedAt") ); statement.setObject(2, null);
		statement.setTimestamp(3, (java.sql.Timestamp) row.get("createdAt"));
		statement.setTimestamp(4, (java.sql.Timestamp) row.get("expireAt"));
		statement.setTimestamp(5, (java.sql.Timestamp) row.get("modifiedAt"));
		statement.setString(6, (String) row.get("risk"));
		statement.setString(7, (String) row.get("state"));
		statement.setString(8, (String) row.get("provisioningStatus"));
		statement.setString(9, (String) row.get("type"));
		if(row.get("createdBy_id") != null) statement.setLong(10, createdById); statement.setObject(10, null);
		if(row.get("managedBy_id") != null) statement.setLong(11, managedById); statement.setObject(11, null);
		statement.setBoolean(12, (Boolean) row.get("certifiable"));
		statement.setBoolean(13, (Boolean) row.get("visibleToSelfService"));
		if(row.get("sodValidatedAt") != null) statement.setTimestamp(14, (java.sql.Timestamp) row.get("sodValidatedAt")); statement.setObject(14, null);
		if(row.get("sodVerifiedAt") != null) statement.setTimestamp(15, (java.sql.Timestamp) row.get("sodVerifiedAt")); statement.setObject(15, null);
		if(row.get("selfServiceSynchronized") != null) statement.setBoolean(16, (Boolean) row.get("selfServiceSynchronized")); statement.setBoolean(16, false);
		if(row.get("directoryIndexationSynchronized") != null) statement.setBoolean(17, (Boolean) row.get("directoryIndexationSynchronized")); statement.setBoolean(17, false);
		if(row.get("lastCertificationExecutionDate") != null) statement.setTimestamp(18, (java.sql.Timestamp) row.get("lastCertificationExecutionDate")); statement.setObject(18, null);
		
		
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}

}
