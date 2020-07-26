package blazon.script.reconciliation.transitionstate;

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

class ImportReconciliationTransitionStatesFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportReconciliationTransitionStatesFunctions.class.getName());

	static List<Map<String, Object>> readSourceReconciliationTransitionStates(int limit) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select pets.* from ReconciliationEntryTransitionState pets \n" + 
				"join ReconciliationEntry pe on pets.reconciliationEntry_id = pe.id \n" + 
				"where pets._imported_ <> 1 \n" + 
				"and pe.status in ('PROCESSED', 'ERROR') \n" +
				"limit %s ";

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

	public static void saveTargetProvisioningTransitionStates(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();

		for (Map<String, Object> row : rows) {

			try {
				
				saveReconciliationTransitionState(targetConn, row);

				setImportedProvisioningTransitionState(sourceConn, row);

			} catch (Exception e) {

				LOGGER.log(Level.SEVERE, String.format("Erro ao importar reconciliation entry transition state com id %s", row.get("id")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveReconciliationTransitionState(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;

		String sql = "INSERT INTO ReconciliationEntryTransitionState \n" + 
				"(id, bySystem, date, description, detail, sourceState, targetState, reconciliationEntry_id) \n" + 
				"VALUES (?, ?, ?, ?, ?, ?, ?, ?) ";

		statement = conn.prepareStatement(sql);

		if(row.get("id") != null) { statement.setLong(1, (Long)row.get("id")); } else { statement.setObject(1, null); }
		if(row.get("bySystem") != null) { statement.setBoolean(2, (Boolean)row.get("bySystem")); } else { statement.setObject(2, null); }
		if(row.get("date") != null) { statement.setTimestamp(3, (java.sql.Timestamp)row.get("date")); } else { statement.setObject(3, null); }
		if(row.get("description") != null) { statement.setString(4, (String)row.get("description")); } else { statement.setObject(4, null); }
		if(row.get("detail") != null) { statement.setString(5, (String)row.get("detail")); } else { statement.setObject(5, null); }
		if(row.get("sourceState") != null) { statement.setString(6, (String)row.get("sourceState")); } else { statement.setObject(6, null); }
		if(row.get("targetState") != null) { statement.setString(7, (String)row.get("targetState")); } else { statement.setObject(7, null); }
		if(row.get("reconciliationEntry_id") != null) { statement.setLong(8, (Long)row.get("reconciliationEntry_id")); } else { statement.setObject(8, null); }

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}

	private static void setImportedProvisioningTransitionState(Connection conn, Map<String, Object> row) throws Exception {

		PreparedStatement statement = null;

		String sql = "update ReconciliationEntryTransitionState set _imported_ = 1 where id = ?";
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("id"));

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Update instance failed, no rows affected.");
		}
	}

}
