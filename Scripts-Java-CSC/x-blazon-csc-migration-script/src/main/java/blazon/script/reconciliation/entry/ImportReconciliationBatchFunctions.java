package blazon.script.reconciliation.entry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.HashMap;
import java.util.Map;

public class ImportReconciliationBatchFunctions {

	
	static void createBatchIfDontExist(Connection conn, Map<String, Object> row) throws Exception {
		
		if(row.get("batchId") == null) {
			
			return;
		}
		
		Map<String, Object> batchData = readBatch(conn, (String) row.get("batchId"));
		
		if(!batchData.isEmpty()) {
			
			return; 
		}
		
		PreparedStatement statement = null;
		
		String sql = "INSERT INTO ReconciliationBatchEntry \n" + 
				"(batchId, amount, finalizedDate, profileId, profileName, startDate, status) \n" + 
				"VALUES (?, ?, ?, ?, ?, ?, ?) ";
		
		statement = conn.prepareStatement(sql);
				
		if(row.get("batchId") != null) { statement.setString(1, (String)row.get("batchId")); } else { statement.setObject(1, null); }
		if(row.get("amount") != null) { statement.setLong(2, (Long)row.get("amount")); } else { statement.setObject(2, null); }
		statement.setTimestamp(3, (java.sql.Timestamp)row.get("processDate")); 
		if(row.get("profile_id") != null) { statement.setLong(4, (Long)row.get("profile_id")); } else { statement.setObject(4, null); }
		if(row.get("profileName") != null) { statement.setString(5, (String)row.get("profileName")); } else { statement.setObject(5, null); }
		statement.setTimestamp(6, (java.sql.Timestamp)row.get("effectiveDate"));
		statement.setString(7, "FINALIZED");
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
	}
	
	
	static Map<String, Object> readBatch(Connection conn, String batchId) throws Exception {
		
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from ReconciliationBatchEntry where batchId = ?";

		statement = conn.prepareStatement(sql);
		statement.setString(1, batchId);
		
		rs = statement.executeQuery();
		
		Map<String, Object> row = new HashMap<>();
		
		if(rs.next()) {
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			for(int i=1; i<=metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}
		}
		
		return row;
	}

}
