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
				" certifiable,\n" + 
				" certificatedAt,\n" + 
				" createdAt,\n" + 
				" directoryIndexationSynchronized,\n" + 
				" expireAt,\n" + 
				" lastCertificationExecutionDate,\n" + 
				" modifiedAt,\n" + 
				" provisioningStatus,\n" + 
				" risk,\n" + 
				" selfServiceSynchronized,\n" + 
				" sodValidatedAt,\n" + 
				" sodVerifiedAt,\n" + 
				" state,\n" + 
				" type,\n" + 
				" visibleToSelfService,\n" + 
				" createdBy_id,\n" + 
				" managedBy_id)\n" + 
				"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		statement = conn.prepareStatement(sql);
		
		if (row.get("id") != null) {
			statement.setLong(1, (Long) row.get("id"));
		} else {
			statement.setObject(1, null);
		}
		if (row.get("certifiable") != null) {
			statement.setBoolean(2, (Boolean) row.get("certifiable"));
		} else {
			statement.setBoolean(2, true);
		}
		if (row.get("certificatedAt") != null) {
			statement.setTimestamp(3, (java.sql.Timestamp) row.get("certificatedAt"));
		} else {
			statement.setObject(3, null);
		}
		if (row.get("createdAt") != null) {
			statement.setTimestamp(4, (java.sql.Timestamp) row.get("createdAt"));
		} else {
			statement.setObject(4, null);
		}
		if (row.get("directoryIndexationSynchronized") != null) {
			statement.setBoolean(5, (Boolean) row.get("directoryIndexationSynchronized"));
		} else {
			statement.setBoolean(5, false);
		}
		if (row.get("expireAt") != null) {
			statement.setTimestamp(6, (java.sql.Timestamp) row.get("expireAt"));
		} else {
			statement.setObject(6, null);
		}
		if (row.get("lastCertificationExecutionDate") != null) {
			statement.setTimestamp(7, (java.sql.Timestamp) row.get("lastCertificationExecutionDate"));
		} else {
			statement.setObject(7, null);
		}
		if (row.get("modifiedAt") != null) {
			statement.setTimestamp(8, (java.sql.Timestamp) row.get("modifiedAt"));
		} else {
			statement.setObject(8, null);
		}
		if (row.get("provisioningStatus") != null) {
			statement.setString(9, (String) row.get("provisioningStatus"));
		} else {
			statement.setObject(9, null);
		}
		if (row.get("risk") != null) {
			statement.setString(10, (String) row.get("risk"));
		} else {
			statement.setObject(10, null);
		}
		if (row.get("selfServiceSynchronized") != null) {
			statement.setBoolean(11, (Boolean) row.get("selfServiceSynchronized"));
		} else {
			statement.setBoolean(11, false);
		}
		if (row.get("sodValidatedAt") != null) {
			statement.setTimestamp(12, (java.sql.Timestamp) row.get("sodValidatedAt"));
		} else {
			statement.setObject(12, null);
		}
		if (row.get("sodVerifiedAt") != null) {
			statement.setTimestamp(13, (java.sql.Timestamp) row.get("sodVerifiedAt"));
		} else {
			statement.setObject(13, null);
		}
		if (row.get("state") != null) {
			statement.setString(14, (String) row.get("state"));
		} else {
			statement.setObject(14, null);
		}
		if (row.get("type") != null) {
			statement.setString(15, (String) row.get("type"));
		} else {
			statement.setObject(15, null);
		}
		if (row.get("visibleToSelfService") != null) {
			statement.setBoolean(16, (Boolean) row.get("visibleToSelfService"));
		} else {
			statement.setBoolean(16, false);
		}
		if (createdById != null) {
			statement.setLong(17, createdById);
		} else {
			statement.setObject(17, null);
		}
		if (managedById != null) {
			statement.setLong(18, managedById);
		} else {
			statement.setObject(18, null);
		}
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}

}
