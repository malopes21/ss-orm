package blazon.script.reconciliation.entry;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
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

import blazon.script.reconciliation.entry.dependencies.ImportReconciliationInternalEntryFunctions;
import blazon.script.reconciliation.entry.dependencies.ImportReconciliationResourceFunctions;
import blazon.script.util.ConnectionFactory;

class ImportReconciliationEntriesFunctions {
	
	private static Map<Long, Long> profileIdMap = null;

	private final static Logger LOGGER = Logger.getLogger(ImportReconciliationEntriesFunctions.class.getName());

	static List<Map<String, Object>> read(int limit, int offset) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select * from ReconciliationEntry \n" + 
					"where status in ('PROCESSED', 'ERROR') \n" + 
					"order by id \n" + 
					"limit %s offset %s ";

		sql = String.format(sql, limit, offset);
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
				
				Long resource_id = ImportReconciliationResourceFunctions.insertResource(targetConn, row);

				Long reconciliationMatchedInternalEntry_id = ImportReconciliationInternalEntryFunctions.insertInternalEntry(targetConn, row);
				
				if(reconciliationMatchedInternalEntry_id == null) {
					
					System.out.println("InternalEntry null, not imported reconciliation entry: " + row.get("id"));
					
				} else {
					
					saveReconciliationEntry(targetConn, row, resource_id, reconciliationMatchedInternalEntry_id);
				}
				
			} catch (Exception e) {

				LOGGER.log(Level.ERROR, String.format("Erro ao importar reconciliation entry com id %s", row.get("id")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}


	private static void saveReconciliationEntry(Connection conn, Map<String, Object> row, Long resource_id,
			Long reconciliationMatchedInternalEntry_id) throws SQLException, IOException {

		PreparedStatement statement = null;

		String sql = "INSERT INTO ReconciliationEntry \n"
				+ "(id, batchId, data, date, effectiveDate, lockDate, lockNumber, ownersType, processDate, processedData, "
				+ "reconciliationActionBeanName, resourceAdapterId, schemaa, status, profile_id, reconciliationMatchedInternalEntry_id, resource_id, situation_id)\n"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

		statement = conn.prepareStatement(sql);

		if (row.get("id") != null) {
			statement.setLong(1, (Long) row.get("id"));
		} else {
			statement.setObject(1, null);
		}
		if (row.get("batchId") != null) {
			statement.setString(2, (String) row.get("batchId"));
		} else {
			statement.setObject(2, null);
		}
		if (row.get("data") != null) {
			statement.setString(3, (String) row.get("data"));
		} else {
			statement.setObject(3, null);
		}
		if (row.get("date") != null) {
			statement.setTimestamp(4, (java.sql.Timestamp) row.get("date"));
		} else {
			statement.setObject(4, null);
		}
		if (row.get("effectiveDate") != null) {
			statement.setTimestamp(5, (java.sql.Timestamp) row.get("effectiveDate"));
		} else {
			statement.setObject(5, null);
		}
		if (row.get("lockDate") != null) {
			statement.setTimestamp(6, (java.sql.Timestamp) row.get("lockDate"));
		} else {
			statement.setObject(6, null);
		}
		if (row.get("lockNumber") != null) {
			statement.setLong(7, (Long) row.get("lockNumber"));
		} else {
			statement.setObject(7, null);
		}
		if (row.get("ownersType") != null) {
			statement.setString(8, (String) row.get("ownersType"));
		} else {
			statement.setObject(8, null);
		}
		if (row.get("processDate") != null) {
			statement.setTimestamp(9, (java.sql.Timestamp) row.get("processDate"));
		} else {
			statement.setObject(9, null);
		}
		if (row.get("processedData") != null) {
			statement.setString(10, (String) row.get("processedData"));
		} else {
			statement.setObject(10, null);
		}
		if (row.get("reconciliationActionBeanName") != null) {
			statement.setString(11, (String) row.get("reconciliationActionBeanName"));
		} else {
			statement.setObject(11, null);
		}
		if (row.get("resourceAdapterId") != null) {
			statement.setString(12, (String) row.get("resourceAdapterId"));
		} else {
			statement.setObject(12, null);
		}
		if (row.get("schemaa") != null) {
			statement.setString(13, (String) row.get("schemaa"));
		} else {
			statement.setObject(13, null);
		}
		if (row.get("status") != null) {
			statement.setString(14, (String) row.get("status"));
		} else {
			statement.setObject(14, null);
		}
		if (row.get("profile_id") != null) {
			statement.setLong(15, getTargetProfileId((Long) row.get("profile_id")));
		} else {
			statement.setObject(15, null);
		}
		if (reconciliationMatchedInternalEntry_id != null) {
			statement.setLong(16, reconciliationMatchedInternalEntry_id);
		} else {
			statement.setObject(16, null);
		}
		if (resource_id != null) {
			statement.setLong(17, resource_id);
		} else {
			statement.setObject(17, null);
		}
		if (row.get("situation_id") != null) {
			statement.setLong(18, (Long) row.get("situation_id"));
		} else {
			statement.setObject(18, null);
		}

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
		
		LOGGER.log(Level.INFO, "Enviando comando SQL para importar reconciliation entry com id " + row.get("id"));
	}

	private static void readMappingReconciliationProfileId() throws IOException {

		profileIdMap = new HashMap<Long, Long>();

		BufferedReader br = new BufferedReader(new FileReader("reconciliationProfileIdMapping.tsv"));
		
		br.readLine();
		
		String mappingLine = br.readLine();
		
		while(mappingLine != null) {
			
			if(mappingLine.length() == 0) {
				
				break;
			}
			
			String[] mapping = mappingLine.split("\t");
			profileIdMap.put(Long.valueOf(mapping[0]), Long.valueOf(mapping[1]));
			
			mappingLine = br.readLine();
		}
		
		br.close();
	}
	
	private static Long getTargetProfileId(Long key) throws IOException {
		
		if(key == null) {
			
			return null;
		}
		
		if(profileIdMap == null) {
			readMappingReconciliationProfileId();
		}
		
		return profileIdMap.get(key);
	}

}
