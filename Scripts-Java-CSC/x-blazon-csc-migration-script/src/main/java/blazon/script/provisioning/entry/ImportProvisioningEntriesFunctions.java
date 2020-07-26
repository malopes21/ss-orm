package blazon.script.provisioning.entry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import blazon.script.util.ConnectionFactory;

class ImportProvisioningEntriesFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportProvisioningEntriesFunctions.class.getName());

	static List<Map<String, Object>> readSourceProvisioningEntries(int limit) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select * from ProvisioningEntry \n" + "where _imported_ <> 1 \n"
				+ "and status in ('PROCESSED', 'ERROR') \n" + "order by id \n" + "limit %s ";

		sql = String.format(sql, limit);
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

	public static void saveTargetProvisioningEntries(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();

		for (Map<String, Object> row : rows) {

			try {
				
				Long resource_id = ImportProvisioningResourceFunctions.insertResource(targetConn, row);
				
				Long beneficiary_id = ImportProvisioningBeneficiaryFunctions.insertBeneficiary(targetConn, row);
				
				Long provisioningInternalEntry_id = ImportProvisioningInternalEntryFunctions.insertInternalEntry(targetConn, row);

				saveProvisioningEntry(targetConn, row, resource_id, beneficiary_id, provisioningInternalEntry_id);

				setImportedProvisioningEntry(sourceConn, row);

			} catch (Exception e) {

				LOGGER.log(Level.SEVERE, String.format("Erro ao importar provisioning entry com id %s", row.get("id")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveProvisioningEntry(Connection conn, Map<String, Object> row, Long resource_id, Long beneficiary_id, 
			Long provisioningInternalEntry_id) throws SQLException {

		PreparedStatement statement = null;

		String sql = "INSERT INTO ProvisioningEntry \n"
				+ "(id, date, entryType, lockDate, lockNumber, payload, processDate, provisioningTaskDefinitionIdentifier, "
				+ " provisioningTaskQueueIdentifier, provisioningType, provisioningTypeObjectId, status, targetId, targetType, "
				+ " workflowId, beneficiary_id, provisioningInternalEntry_id, resource_id) \n"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

		statement = conn.prepareStatement(sql);

		if (row.get("id") != null) {
			statement.setLong(1, (Long) row.get("id"));
		} else {
			statement.setObject(1, null);
		}
		if (row.get("date") != null) {
			statement.setTimestamp(2, (java.sql.Timestamp) row.get("date"));
		} else {
			statement.setObject(2, null);
		}
		if (row.get("entryType") != null) {
			if(row.get("entryType").toString().equals("REMOVE_ACCOUNT")) {
				statement.setString(3, "REVOKE_ACCOUNT");
			} else {
				statement.setString(3, (String) row.get("entryType"));
			}
		} else {
			statement.setObject(3, null);
		}
		if (row.get("lockDate") != null) {
			statement.setTimestamp(4, (java.sql.Timestamp) row.get("lockDate"));
		} else {
			statement.setObject(4, null);
		}
		if (row.get("lockNumber") != null) {
			statement.setLong(5, (Long) row.get("lockNumber"));
		} else {
			statement.setObject(5, null);
		}
		if (row.get("payload") != null) {
			statement.setString(6, (String) row.get("payload"));
		} else {
			statement.setObject(6, null);
		}
		if (row.get("processDate") != null) {
			statement.setTimestamp(7, (java.sql.Timestamp) row.get("processDate"));
		} else {
			statement.setObject(7, null);
		}
		if (row.get("provisioningTaskDefinitionIdentifier") != null) {
			statement.setLong(8, (Long) row.get("provisioningTaskDefinitionIdentifier"));
		} else {
			statement.setObject(8, null);
		}
		if (row.get("provisioningTaskQueueIdentifier") != null) {
			statement.setLong(9, (Long) row.get("provisioningTaskQueueIdentifier"));
		} else {
			statement.setObject(9, null);
		}
		if (row.get("provisioningType") != null) {
			statement.setString(10, (String) row.get("provisioningType"));
		} else {
			statement.setObject(10, null);
		}
		if (row.get("provisioningTypeObjectId") != null) {
			statement.setString(11, (String) row.get("provisioningTypeObjectId"));
		} else {
			statement.setObject(11, null);
		}
		if (row.get("status") != null) {
			statement.setString(12, (String) row.get("status"));
		} else {
			statement.setObject(12, null);
		}
		if (row.get("targetId") != null) {
			statement.setLong(13, (Long) row.get("targetId"));
		} else {
			statement.setObject(13, null);
		}
		if (row.get("targetType") != null) {
			statement.setString(14, (String) row.get("targetType"));
		} else {
			statement.setObject(14, null);
		}
		if (row.get("workflowId") != null) {
			statement.setLong(15, (Long) row.get("workflowId"));
		} else {
			statement.setObject(15, null);
		}
		if (beneficiary_id != null) {
			statement.setLong(16, beneficiary_id);
		} else {
			statement.setObject(16, null);
		}
		if (provisioningInternalEntry_id != null) {
			statement.setLong(17, provisioningInternalEntry_id);
		} else {
			statement.setObject(17, null);
		}
		if (resource_id != null) {
			statement.setLong(18, resource_id);
		} else {
			statement.setObject(18, null);
		}

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}

	private static void setImportedProvisioningEntry(Connection conn, Map<String, Object> row) throws Exception {

		PreparedStatement statement = null;

		String sql = "update ProvisioningEntry set _imported_ = 1 where id = ?";
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("id"));

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Update instance failed, no rows affected.");
		}
	}

}
