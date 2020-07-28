package blazon.script.roleright.entry;

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

class ImportRoleRightEntriesFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportRoleRightEntriesFunctions.class.getName());

	static List<Map<String, Object>> readSourceRoleRightEntries(int limit) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select * from RoleRightEntry \n" + 
					"where _imported_ <> 1 \n"	+ 
					"order by id \n" + 
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

	public static void saveTargetRoleRightEntries(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();

		for (Map<String, Object> row : rows) {

			try {
				
				Long role_id = ImportRoleRightRoleFunctions.insertRole(targetConn, row);
				
				Long requester_id = ImportRoleRightRequesterFunctions.insertRequester(targetConn, row);
				
				if(role_id == null) {
					
					System.out.println("Role null, RoleRightEntry not imported id: " + row.get("id"));
					
				} else {
					
					saveRoleRightEntry(targetConn, row, role_id, requester_id);
					
					ImportRoleRightEntryItemsFunctions.insertItems(targetConn, row);
				}

				setImportedRoleRightEntry(sourceConn, row);

			} catch (Exception e) {

				LOGGER.log(Level.SEVERE, String.format("Erro ao importar roleRight entry com id %s", row.get("id")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveRoleRightEntry(Connection conn, Map<String, Object> row, Long role_id, Long requester_id) throws SQLException {

		PreparedStatement statement = null;

		String sql = "INSERT INTO RoleRightEntry \n" + 
				"(id, action, approvalWorkflowId, creationDate, executionDate, justification, lockDate, lockNumber, roleRightPolicyId, status, requester_id, role_id)\n" + 
				"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

		statement = conn.prepareStatement(sql);

		if (row.get("id") != null) {
			statement.setLong(1, (Long) row.get("id"));
		} else {
			statement.setObject(1, null);
		}
		if (row.get("action") != null) {
			statement.setString(2, (String) row.get("action"));
		} else {
			statement.setObject(2, null);
		}
		if (row.get("approvalWorkflowId") != null) {
			statement.setLong(3, (Long) row.get("approvalWorkflowId"));
		} else {
			statement.setObject(3, null);
		}
		if (row.get("creationDate") != null) {
			statement.setTimestamp(4, (java.sql.Timestamp) row.get("creationDate"));
		} else {
			statement.setObject(4, null);
		}
		if (row.get("executionDate") != null) {
			statement.setTimestamp(5, (java.sql.Timestamp) row.get("executionDate"));
		} else {
			statement.setObject(5, null);
		}
		if (row.get("justification") != null) {
			statement.setString(6, (String) row.get("justification"));
		} else {
			statement.setObject(6, null);
		}
		if (row.get("lockDate") != null) {
			statement.setTimestamp(7, (java.sql.Timestamp) row.get("lockDate"));
		} else {
			statement.setObject(7, null);
		}
		if (row.get("lockNumber") != null) {
			statement.setLong(8, (Long) row.get("lockNumber"));
		} else {
			statement.setObject(8, null);
		}
		if (row.get("roleRightPolicyId") != null) {
			statement.setLong(9, (Long) row.get("roleRightPolicyId"));
		} else {
			statement.setObject(9, null);
		}
		if (row.get("status") != null) {
			statement.setString(10, (String) row.get("status"));
		} else {
			statement.setObject(10, null);
		}
		if (requester_id != null) {
			statement.setLong(11, requester_id);
		} else {
			statement.setObject(11, null);
		}
		if (role_id != null) {
			statement.setLong(12, role_id);
		} else {
			statement.setObject(12, null);
		}

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}

	private static void setImportedRoleRightEntry(Connection conn, Map<String, Object> row) throws Exception {

		PreparedStatement statement = null;

		String sql = "update RoleRightEntry set _imported_ = 1 where id = ?";
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("id"));

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Update instance failed, no rows affected.");
		}
	}

}
