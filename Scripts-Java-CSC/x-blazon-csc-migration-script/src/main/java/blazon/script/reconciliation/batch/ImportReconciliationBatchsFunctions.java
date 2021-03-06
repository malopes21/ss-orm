package blazon.script.reconciliation.batch;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import blazon.script.util.ConnectionFactory;

class ImportReconciliationBatchsFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportReconciliationBatchsFunctions.class.getName());
	
	static List<Map<String, Object>> read(int limit, int offset) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = String.format("SELECT DISTINCT batchId FROM ReconciliationEntry order by batchId limit %s offset %s ", limit, offset);

		statement = conn.prepareStatement(sql);
		rs = statement.executeQuery();

		while (rs.next()) {

			Map<String, Object> row = new HashMap<>();
			ResultSetMetaData metaData = rs.getMetaData();

			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}

			rows.add(row);
		}

		conn.commit();

		return rows;
	}

	public static void save(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();

		for (Map<String, Object> row : rows) {

			try {
				
				saveReconciliationBatch(targetConn, row);
				
			} catch (Exception e) {

				LOGGER.log(Level.ERROR, String.format("Erro ao importar reconciliation action com id %s", row.get("id")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveReconciliationBatch(Connection conn, Map<String, Object> row) throws Exception {
		
		List<Map<String, Object>> entriesData = readSourceReconciliationEntriesByBatch((String) row.get("batchId"));
		
		
		
		if(entriesData.isEmpty()) {
			
			return;
		}

		PreparedStatement statement = null;

		String sql = "INSERT INTO ReconciliationBatchEntry \n" + 
				"(batchId, amount, finalizedDate, profileId, profileName, startDate, status) \n" + 
				"VALUES (?, ?, ?, ?, ?, ?, ?) ";
		
		statement = conn.prepareStatement(sql);
				
		statement.setString(1, (String)row.get("batchId")); 
		statement.setLong(2, Long.valueOf(entriesData.size())); 
		statement.setTimestamp(3, entriesData.get(entriesData.size()-1).get("processDate") != null ? 
				(java.sql.Timestamp)entriesData.get(entriesData.size()-1).get("processDate") : (java.sql.Timestamp)entriesData.get(entriesData.size()-1).get("effectiveDate")); 
		statement.setLong(4, (Long)entriesData.get(0).get("profile_id")); 
		statement.setString(5, (String)entriesData.get(0).get("profileName")); 
		statement.setTimestamp(6, (java.sql.Timestamp)entriesData.get(0).get("effectiveDate"));
		statement.setString(7, "FINALIZED");
		
		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
		    throw new RuntimeException("Creating instance failed, no rows affected.");
		}
		
		LOGGER.log(Level.INFO, "Enviando comando SQL para importar reconciliation batch com id " + (String)row.get("batchId"));
	}


	static List<Map<String, Object>> readSourceReconciliationEntriesByBatch(String batchId) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = String.format("select * from ReconciliationEntry re \n" + 
				"where re.batchId  = '%s' order by effectiveDate ", batchId);

		statement = conn.prepareStatement(sql);
		rs = statement.executeQuery();

		while (rs.next()) {

			Map<String, Object> row = new HashMap<>();
			ResultSetMetaData metaData = rs.getMetaData();

			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				row.put(metaData.getColumnName(i), rs.getObject(i));
			}
			
			addProfileInfo(conn, row);

			rows.add(row);
		}

		conn.commit();
		conn.close();

		return rows;
	}
	
	
	private static void addProfileInfo(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = String.format("select name from ReconciliationProfile re \n" + 
				"where re.id  = '%s' ", row.get("profile_id"));

		statement = conn.prepareStatement(sql);
		rs = statement.executeQuery();

		if (rs.next()) {

			row.put("profileName", rs.getString("name"));
		}
	}
}
