package blazon.script.reconciliation.action;

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

class ImportReconciliationActionsFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportReconciliationActionsFunctions.class.getName());
	
	static List<Map<String, Object>> readSourceReconciliationActions(int limit) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select * from ReconciliationAction ";

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

	public static void saveTargetReconciliationActions(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();

		for (Map<String, Object> row : rows) {

			try {
				
				saveReconciliationAction(targetConn, row);
				
				ImportReconciliationActionEntryTypesFunctions.insertEntryTypes(targetConn, row);
				
				ImportReconciliationActionSituationNamesFunctions.insertSituationNames(targetConn, row);

				setImportedReconciliationAction(sourceConn, row);

			} catch (Exception e) {

				LOGGER.log(Level.SEVERE, String.format("Erro ao importar reconciliation action com id %s", row.get("id")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveReconciliationAction(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;

		String sql = "INSERT INTO ReconciliationAction \n" + 
				"(id, actionName, beanName)\n" + 
				"VALUES (?, ?, ?) ";

		statement = conn.prepareStatement(sql);

		if(row.get("id") != null) { statement.setLong(1, (Long)row.get("id")); } else { statement.setObject(1, null); }
		if(row.get("actionName") != null) { statement.setString(2, (String)row.get("actionName")); } else { statement.setObject(2, null); }
		if(row.get("beanName") != null) { statement.setString(3, (String)row.get("beanName")); } else { statement.setObject(3, null); }

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}

	private static void setImportedReconciliationAction(Connection conn, Map<String, Object> row) throws Exception {

		PreparedStatement statement = null;

		String sql = "update ReconciliationAction set _imported_ = 1 where id = ?";
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("id"));

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Update instance failed, no rows affected.");
		}
	}

}
