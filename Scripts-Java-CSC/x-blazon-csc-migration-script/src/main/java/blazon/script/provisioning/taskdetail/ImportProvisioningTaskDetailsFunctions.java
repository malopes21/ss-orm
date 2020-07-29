package blazon.script.provisioning.taskdetail;

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

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import blazon.script.util.ConnectionFactory;

class ImportProvisioningTaskDetailsFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportProvisioningTaskDetailsFunctions.class.getName());

	static List<Map<String, Object>> read(int limit, int offset) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select ptd.* \n" + 
				"from ProvisioningTaskDetail ptd \n" + 
				"join ProvisioningEntry pe on pe.id = ptd.provisioningEntry_id \n" + 
				"where 1 = 1 " +
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
				
				saveProvisioningTaskDetail(targetConn, row);

			} catch (Exception e) {

				LOGGER.log(Level.ERROR, String.format("Erro ao importar provisioning task detail com id %s", row.get("id")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveProvisioningTaskDetail(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;

		String sql = "INSERT INTO ProvisioningTaskDetail \n" + 
				"(id, approvalDate, creation, outcome, provisioningEntry_id, taskId)\n" + 
				"VALUES (?, ?, ?, ?, ?, ?) ";

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
		if (row.get("outcome") != null) {
			statement.setString(4, (String) row.get("outcome"));
		} else {
			statement.setObject(4, null);
		}
		if (row.get("provisioningEntry_id") != null) {
			statement.setLong(5, (Long) row.get("provisioningEntry_id"));
		} else {
			statement.setObject(5, null);
		}
		if (row.get("taskId") != null) {
			statement.setLong(6, (Long) row.get("taskId"));
		} else {
			statement.setObject(6, null);
		}

		try {
			
			int affectedRows = statement.executeUpdate();

			if (affectedRows == 0) {
				throw new RuntimeException("Insert instance failed, no rows affected.");
			}
			
			LOGGER.log(Level.INFO, "Enviando comando SQL para importar provisioning task detail com id " + row.get("id"));
			
		}catch (MySQLIntegrityConstraintViolationException e) {

			LOGGER.log(Level.WARN, String.format("Erro ao importar provisioning task detail com id %s. Provavel que a provisioiningEntry não foi importada.", 
					row.get("id")));
		}
		
	}

}
