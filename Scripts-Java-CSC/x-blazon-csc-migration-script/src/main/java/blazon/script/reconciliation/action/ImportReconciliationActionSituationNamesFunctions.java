package blazon.script.reconciliation.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.HashMap;
import java.util.Map;

import blazon.script.util.ConnectionFactory;

class ImportReconciliationActionSituationNamesFunctions {

	static void insertSituationNames(Connection conn, Map<String, Object> row) throws Exception {
		
		if(row.get("id") == null) {
			
			return;
		}
		
		Map<String, Object> situationNameData = readSituationNames((Long) row.get("id"));
		
		PreparedStatement statement = null;
		
		String sql = "insert into ReconciliationAction_situationNames (ReconciliationAction_id, situationNames) values (?, ?) ";
				
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) situationNameData.get("ReconciliationAction_id"));
		statement.setString(2, (String) situationNameData.get("situationNames"));
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
	}
	
	
	static Map<String, Object> readSituationNames(Long ReconciliationAction_id) throws Exception {
		
		Connection conn = ConnectionFactory.getSourceConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		
		String sql = "select * from ReconciliationAction_situationNames where ReconciliationAction_id = ?";

		statement = conn.prepareStatement(sql);
		statement.setLong(1, ReconciliationAction_id);
		
		rs = statement.executeQuery();
		
		Map<String, Object> row = new HashMap<>();
		
		if(rs.next()) {
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			for(int i=1; i<=metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}
		}
		
		conn.commit();
		conn.close();
		
		return row;
	}
}
