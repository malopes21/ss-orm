package blazon.script.reconciliation.matchentry;

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

class ImportReconciliationMatchedEntriesIdsFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportReconciliationMatchedEntriesIdsFunctions.class.getName());

	static List<Map<String, Object>> readSourceReconciliationMatchedIds(int limit) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select * from ReconciliationEntry_matchedEntriesIds rm \n" + 
				"where rm._imported_ <> 1 \n" + 
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

	public static void saveTargetReconciliationMatchedIds(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();

		for (Map<String, Object> row : rows) {

			try {
				
				Long reconciliationMatchedInternalEntry_id = ImportReconciliationMatchedInternalEntryFunctions.insertInternalEntry(sourceConn, targetConn, row);
				
				if(reconciliationMatchedInternalEntry_id != null) {
					
					saveReconciliationMatchedId(targetConn, (Long) row.get("ReconciliationEntry_id"), reconciliationMatchedInternalEntry_id);
					
				} else {
					
					System.out.println(String.format("Directory entry null, for reconciliationEntry %s e directoryMathedEntryId %s", 
							row.get("ReconciliationEntry_id"), row.get("matchedEntriesIds")));
				}

				setImportedReconciliationMatchedId(sourceConn, row);

			} catch (Exception e) {

				LOGGER.log(Level.SEVERE, String.format("Erro ao importar reconciliation matched entry id com, "
						+ " ReconciliationEntry_id %s e matchedEntriesIds %s",row.get("ReconciliationEntry_id"), row.get("matchedEntriesIds")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveReconciliationMatchedId(Connection conn, Long reconciliationEntryId, Long matchedEntryId) throws SQLException {

		PreparedStatement statement = null;

		String sql = "INSERT INTO ReconciliationEntry_matchedEntriesIds \n" + 
				"(ReconciliationEntry_id, matchedEntriesIds) \n" + 
				"VALUES (?, ?) ";

		statement = conn.prepareStatement(sql);

		if (reconciliationEntryId != null) {
			statement.setLong(1, reconciliationEntryId);
		} else {
			statement.setObject(1, null);
		}
		if (matchedEntryId != null) {
			statement.setLong(2, matchedEntryId);
		} else {
			statement.setObject(2, null);
		}

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}

	private static void setImportedReconciliationMatchedId(Connection conn, Map<String, Object> row) throws Exception {

		PreparedStatement statement = null;

		String sql = "update ReconciliationEntry_matchedEntriesIds set _imported_ = 1 where ReconciliationEntry_id = ? and matchedEntriesIds = ?";
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("ReconciliationEntry_id"));
		statement.setLong(2, (Long) row.get("matchedEntriesIds"));

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Update instance failed, no rows affected.");
		}
	}

}
