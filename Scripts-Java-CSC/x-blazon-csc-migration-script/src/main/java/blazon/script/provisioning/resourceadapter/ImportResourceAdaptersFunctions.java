package blazon.script.provisioning.resourceadapter;

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

class ImportResourceAdaptersFunctions {

	private final static Logger LOGGER = Logger.getLogger(ImportResourceAdaptersFunctions.class.getName());

	static List<Map<String, Object>> read(int limit, int offset) throws Exception {

		Connection conn = ConnectionFactory.getSourceConnection();
		List<Map<String, Object>> rows = new ArrayList<>();

		PreparedStatement statement = null;
		ResultSet rs = null;

		String sql = "select * from ResourceAdapter limit %s offset %s ";

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
				
				saveResourceAdapter(targetConn, row);

			} catch (Exception e) {

				LOGGER.log(Level.ERROR, String.format("Erro ao importar resource adapter com id %s", row.get("id")));
				throw e;
			}
		}

		targetConn.commit();
		sourceConn.commit();

		targetConn.close();
		sourceConn.close();
	}

	private static void saveResourceAdapter(Connection conn, Map<String, Object> row) throws SQLException {

		PreparedStatement statement = null;

		String sql = "INSERT INTO ResourceAdapter \n" + 
				"(id, description, name, uuid)\n" + 
				"VALUES (?, ?, ?, ?) ";

		statement = conn.prepareStatement(sql);

		if(row.get("id") != null) { statement.setLong(1, (Long)row.get("id")); } else { statement.setObject(1, null); }
		if(row.get("description") != null) { statement.setString(2, (String)row.get("description")); } else { statement.setObject(2, null); }
		if(row.get("name") != null) { statement.setString(3, (String)row.get("name")); } else { statement.setObject(3, null); }
		if(row.get("uuid") != null) { statement.setString(4, (String)row.get("uuid")); } else { statement.setObject(4, null); }

		int affectedRows = statement.executeUpdate();

		if (affectedRows == 0) {
			throw new RuntimeException("Insert instance failed, no rows affected.");
		}
		
		LOGGER.log(Level.INFO, "Enviando comando SQL para importar resource adapter com id " + row.get("id"));
	}

}
