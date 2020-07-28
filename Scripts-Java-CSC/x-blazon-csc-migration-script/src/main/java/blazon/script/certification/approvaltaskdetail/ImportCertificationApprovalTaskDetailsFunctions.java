package blazon.script.certification.approvaltaskdetail;

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

class ImportCertificationApprovalTaskDetailsFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportCertificationApprovalTaskDetailsFunctions.class.getName());

	static List<Map<String, Object>> readSourceCertificationApprovalTaskDetails(int limit) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select cat.* \n" + 
				"from CertificationApprovalTaskDetail cat \n" + 
				"join CertificationEntry ce on ce.id = cat.certificationEntry_id \n" + 
				"where cat._imported_ <> 1 " +
				"limit %s";

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

	public static void saveTargetCertificationApprovalTaskDetails(List<Map<String, Object>> rows) throws Exception {

		Connection targetConn = ConnectionFactory.getTargetConnection();
		Connection sourceConn = ConnectionFactory.getSourceConnection();

		for (Map<String, Object> row : rows) {

			try {
				
				saveCertificationApprovalTaskDetail(targetConn, row);

				setImportedCertificationApprovalTaskDetail(sourceConn, row);

			} catch (Exception e) {

				LOGGER.log(Level.SEVERE, String.format("Erro ao importar certification approval task detail com id %s", row.get("id")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveCertificationApprovalTaskDetail(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;

		String sql = "INSERT INTO CertificationApprovalTaskDetail \n" + 
				"(id, approvalDate, creation, levelName, outcome, certificationEntry_id, taskId)\n" + 
				"VALUES (?, ?, ?, ?, ?, ?, ?) ";

		statement = conn.prepareStatement(sql);

		if (row.get("id") != null) {
			statement.setLong(1, (Long) row.get("id"));
		} else {
			statement.setObject(1, null);
		}
		if (row.get("approvalDate") != null) {
			statement.setTimestamp(2, (java.sql.Timestamp) row.get("approvalDate"));
		} else {
			statement.setObject(2, null);
		}
		if (row.get("creation") != null) {
			statement.setTimestamp(3, (java.sql.Timestamp) row.get("creation"));
		} else {
			statement.setObject(3, null);
		}
		if (row.get("levelName") != null) {
			statement.setString(4, (String) row.get("levelName"));
		} else {
			statement.setObject(4, null);
		}
		if (row.get("outcome") != null) {
			statement.setString(5, (String) row.get("outcome"));
		} else {
			statement.setObject(5, null);
		}
		if (row.get("certificationEntry_id") != null) {
			statement.setLong(6, (Long) row.get("certificationEntry_id"));
		} else {
			statement.setObject(6, null);
		}
		if (row.get("task_id") != null) {
			statement.setLong(7, (Long) row.get("task_id"));
		} else {
			statement.setObject(7, null);
		}

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
	}

	private static void setImportedCertificationApprovalTaskDetail(Connection conn, Map<String, Object> row) throws Exception {

		PreparedStatement statement = null;

		String sql = "update CertificationApprovalTaskDetail set _imported_ = 1 where id = ?";
		statement = conn.prepareStatement(sql);
		statement.setLong(1, (Long) row.get("id"));

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Update instance failed, no rows affected.");
		}
	}

}
